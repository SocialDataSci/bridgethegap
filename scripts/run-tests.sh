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
# This file runs a series of 'smoke' tests on the data to ensure that a
# change doesn't completely blow way the data
#

set -e
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && /bin/pwd )"
ROOT_DIR="$( cd ${CURRENT_DIR}/../ && pwd )"
source ${CURRENT_DIR}/vars.sh
source ${CURRENT_DIR}/args.sh
mkdir -p $TEST_OUTPUT_DIR

if [[ -z "${MYSQL_USER}" ]]
then
  echo "ERROR: Incorrect usage, -u mysql-user is required"
  exit 1
fi 

#
# Get the count of rows for all tables
# 
for database in ${BRIDGE_THE_GAP_DBS[@]}
do
  output=${TEST_OUTPUT_DIR}/${database}-counts-$(date +%Y%m%d-%H%M%S).out
  rm -f $output
  for table in $(mysql --silent -u "${MYSQL_USER}" "${database}" -e "show tables" | sort)
  do
    echo "${table}" >> $output
    mysql --silent -u "${MYSQL_USER}" "${database}" -e "select count(1) from $table" >> $output
  done
  goldenFile=$GOLDEN_DIR/${database}-counts.out
  if [[ -f $goldenFile ]]
  then
    echo "Diffing $goldenFile and $output"
    diff $goldenFile $output
  fi
done
echo "Success!"
