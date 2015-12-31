#!/bin/bash
#
# Licensed under the Apache Software Foundation (ASF) under one
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

#
# defines global variables
#

set -e
BRIDGE_THE_GAP_DBS=(bridgethegap data4good district staff state)
SOCIAL_DATA_SCI_URL="https://storage.googleapis.com/phdata-public/social-data-sci/"
BRIDGE_THE_GAP_FILE="bridgethegap-mysql-dump-original-20151230.sql.gz"
BRIDGE_THE_GAP_URL="${SOCIAL_DATA_SCI_URL}${BRIDGE_THE_GAP_FILE}"




CACHE_DIR=${ROOT_DIR}/cache/
GOLDEN_DIR=$ROOT_DIR/golden/
TEST_OUTPUT_DIR=$ROOT_DIR/test-output/
UPDATES_DIR=$ROOT_DIR/updates/
