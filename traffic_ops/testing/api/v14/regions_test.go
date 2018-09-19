package v14

/*

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

import (
	"testing"

	"github.com/apache/trafficcontrol/lib/go-log"
	"github.com/apache/trafficcontrol/lib/go-tc"
)

func TestRegions(t *testing.T) {

	CreateTestDivisions(t)
	CreateTestRegions(t)
	UpdateTestRegions(t)
	GetTestRegions(t)
	GetTestRegionsByNamePath(t)
	DeleteTestRegions(t)
	DeleteTestDivisions(t)

}

func CreateTestRegions(t *testing.T) {

	// Retrieve the Division by name so we can get the ID
	division := testData.Divisions[0]
	resp, _, err := TOSession.GetDivisionByName(division.Name)
	if err != nil {
		t.Errorf("cannot GET Division by name: %v - %v\n", division.Name, err)
	}
	respDivision := resp[0]

	for _, region := range testData.Regions {
		region.Division = respDivision.ID
		resp, _, err := TOSession.CreateRegion(region)
		log.Debugln("Response: ", resp)
		if err != nil {
			t.Errorf("could not CREATE region: %v\n", err)
		}
	}
}

func UpdateTestRegions(t *testing.T) {

	firstRegion := testData.Regions[0]
	// Retrieve the Region by region so we can get the id for the Update
	resp, _, err := TOSession.GetRegionByName(firstRegion.Name)
	if err != nil {
		t.Errorf("cannot GET Region by region: %v - %v\n", firstRegion.Name, err)
	}
	remoteRegion := resp[0]
	expectedRegion := "OFFLINE-TEST"
	remoteRegion.Name = expectedRegion
	var alert tc.Alerts
	alert, _, err = TOSession.UpdateRegionByID(remoteRegion.ID, remoteRegion)
	if err != nil {
		t.Errorf("cannot UPDATE Region by id: %v - %v\n", err, alert)
	}

	// Retrieve the Region to check region got updated
	resp, _, err = TOSession.GetRegionByID(remoteRegion.ID)
	if err != nil {
		t.Errorf("cannot GET Region by region: %v - %v\n", firstRegion.Name, err)
	}
	respRegion := resp[0]
	if respRegion.Name != expectedRegion {
		t.Errorf("results do not match actual: %s, expected: %s\n", respRegion.Name, expectedRegion)
	}

	// Set the name back to the fixture value so we can delete it after
	remoteRegion.Name = firstRegion.Name
	alert, _, err = TOSession.UpdateRegionByID(remoteRegion.ID, remoteRegion)
	if err != nil {
		t.Errorf("cannot UPDATE Region by id: %v - %v\n", err, alert)
	}

}

func GetTestRegions(t *testing.T) {
	for _, region := range testData.Regions {
		resp, _, err := TOSession.GetRegionByName(region.Name)
		if err != nil {
			t.Errorf("cannot GET Region by region: %v - %v\n", err, resp)
		}
	}
}

func GetTestRegionsByNamePath(t *testing.T) {
	log.Debugln("GetTestRegionsByNamePath")
	for _, region := range testData.Regions {
		_, _, err := TOSession.GetRegionByNamePath(region.Name)
		if err != nil {
			t.Fatalf("cannot GET Region by name: %v - %v\n", region.Name, err)
		}
	}
}

func DeleteTestRegions(t *testing.T) {

	for _, region := range testData.Regions {
		// Retrieve the Region by name so we can get the id
		resp, _, err := TOSession.GetRegionByName(region.Name)
		if err != nil {
			t.Errorf("cannot GET Region by name: %v - %v\n", region.Name, err)
		}
		respRegion := resp[0]

		delResp, _, err := TOSession.DeleteRegionByID(respRegion.ID)
		if err != nil {
			t.Errorf("cannot DELETE Region by region: %v - %v\n", err, delResp)
		}

		// Retrieve the Region to see if it got deleted
		regionResp, _, err := TOSession.GetRegionByName(region.Name)
		if err != nil {
			t.Errorf("error deleting Region region: %s\n", err.Error())
		}
		if len(regionResp) > 0 {
			t.Errorf("expected Region : %s to be deleted\n", region.Name)
		}
	}
}