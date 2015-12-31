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
echo "Loading database..."
set -e
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && /bin/pwd )"
ROOT_DIR="$( cd ${CURRENT_DIR}/../ && pwd )"
source ${CURRENT_DIR}/vars.sh
source ${CURRENT_DIR}/args.sh

load_original() {
  ${CURRENT_DIR}/download-dependencies.sh
  gunzip -dc ${CACHE_DIR}/${BRIDGE_THE_GAP_FILE} | \
      mysql -u "${MYSQL_USER}" ${MYSQL_OPTS}
}

load_latest() {
  load_original
  for updateFile in $(cd $UPDATES_DIR && ls -1 *.sql | sort)
  do
    echo "Running update file $updateFile"
    mysql -u "${MYSQL_USER}" ${MYSQL_OPTS} < $UPDATES_DIR/$updateFile
  done
}

if [[ -z "${MYSQL_USER}" ]]
then
  echo "ERROR: Incorrect usage, -u mysql-user is required"
  exit 1
elif [[ "${TARGET_VERSION}" == "latest" ]]
then
  load_latest
elif [[ "${TARGET_VERSION}" == "original" ]]
then
  load_original
else
  echo "ERROR: Incorrect usage, -v latest|original must be either 'latest' or 'original'"
  exit 1
fi 
echo "Success!"
