<!--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
-->

[![Build Status](https://builds.apache.org/buildStatus/icon?job=trafficcontrol-master-build)](https://builds.apache.org/job/trafficcontrol-master-build/) [![Documentation Status](https://readthedocs.org/projects/traffic-control-cdn/badge/?version=latest)](http://traffic-control-cdn.readthedocs.io/en/latest/?badge=latest)

Apache Traffic Control is an Open Source implementation of a Content Delivery Network.

#### Documentation
* [Intro](http://traffic-control-cdn.readthedocs.io/en/latest/index.html)
* [CDN Basics](http://traffic-control-cdn.readthedocs.io/en/latest/basics/index.html)
* [Traffic Control Overview](http://traffic-control-cdn.readthedocs.io/en/latest/overview/index.html)
* [Administrator's Guide](http://traffic-control-cdn.readthedocs.io/en/latest/admin/index.html)
* [Developer's Guide](http://traffic-control-cdn.readthedocs.io/en/latest/development/index.html)

##### Releases
* [https://github.com/apache/trafficcontrol/releases](https://github.com/apache/trafficcontrol/releases)

##### Downloads
* [https://www.apache.org/dyn/closer.cgi/trafficcontrol](https://www.apache.org/dyn/closer.cgi/trafficcontrol)

####  Questions, Comments, Bugs and More
* [Frequently Asked Questions](https://traffic-control-cdn.readthedocs.io/en/latest/faq.html)
* [Found a bug or file a feature request](https://github.com/apache/trafficcontrol/issues)
* [Subscribe to our users list](mailto:users-subscribe@trafficcontrol.apache.org)
* [Subscribe to our dev list](mailto:dev-subscribe@trafficcontrol.apache.org)
* [Search the email archives](https://lists.apache.org/list.html?dev@trafficcontrol.apache.org)
* [Check out the wiki](https://cwiki.apache.org/confluence/display/TC/Traffic+Control+Home) for less formal documentation, design docs and roadmap discussions

## For CS6250

Make sure your host installed [docker daemon](https://www.docker.com).

* Deployment

need to build RPMs and docker images 

```
// at the directory of this repo 
$ cd infrastructure/cdn-in-a-box

// build RPMs, only need to build once, no need to build everytime if there is not code pushed 
$ make

// build docker images and boot up the services ( no need --build after you built the images
$ docker-compose -f docker-compose.k8s.yml -f docker-compose.expose-ports.yml up --build

```

* Test the correctness
```
// after the server is running
$ docker-compose -f docker-compose.traffic-ops-test.yml up

// run another test
$ docker-compose -f docker-compose.traffic-portal-test.yml up

```

to be continued for k8s part...


