#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

set -eu

bind_zone_dir='/etc/bind'
bind_zone_file='zone.svc.cluster.local'

bind_zone_file_path="${bind_zone_dir}/${bind_zone_file}"

domain='infra.svc.cluster.local'
origin="${domain}."
origin_line="\$ORIGIN ${origin}"

function add_zone_entry {
	host="$1"
	ip="$2"
	record="$3"

	sed -E -i "/^${host}\s+IN\s+${record}/d" "${bind_zone_file_path}"

	entry="${host}                IN ${record}    ${ip}"
	sed -i "s/${origin_line}/${origin_line}\n\n${entry}/" "${bind_zone_file_path}"
}

dns_container_hostname='dns'
ip='10.99.0.254'
#ip="$(dig +short ${dns_container_hostname}.${domain})"


add_zone_entry "${dns_container_hostname}" "${ip}" "A"
