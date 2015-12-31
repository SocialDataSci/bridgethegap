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
echo "Downloading dependencies..."
set -e
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && /bin/pwd )"
ROOT_DIR="$( cd ${CURRENT_DIR}/../ && pwd )"
source ${CURRENT_DIR}/vars.sh
mkdir -p $CACHE_DIR
download() {
  url=${1}
  if [[ -z "$url" ]]; then
    echo "ERROR: incorrect number of args"
    exit 1
  fi
  name="$(basename ${url})"
  (cd $CACHE_DIR
  if [[ -f "${name}" ]]; then
    echo "File '${name}' is cached"
  else
    echo "Downloading '${name}'"
    curl -o "${name}" "${url}"
  fi)
}
download "${BRIDGE_THE_GAP_URL}"
echo "Success!"
