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
# Proceses args to scripts which take args
# ideally we use the same command-line args for all scripts

# globals
MYSQL_OPTS=""
MYSQL_USER=""
MYSQL_PASSWORD_REQUIRED=""
MYSQL_PASSWORD=""
TARGET_VERSION=""

usage() {
  echo "
Usage:

  all:
  -u mysql-user               - required
  -p mysql-password           - optional and if specified argument is optional


  load-database:
  -v version                  - required data version, either original|latest

"
  exit 1
}

while getopts ":h:p:u:v:" opt; do
  case $opt in
    h)
      usage
      ;;
    p)
      MYSQL_PASSWORD=${OPTARG}
      ;;
    u)
      MYSQL_USER=${OPTARG}
      ;;
    v)
      TARGET_VERSION=${OPTARG}
      ;;
    \?)
      echo "ERROR: Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      if [[ "${OPTARG}" == "p" ]] # password arg is optional
      then
        MYSQL_PASSWORD_REQUIRED=1
      elif [[ "${OPTARG}" == "h" ]]
      then
        usage
      else
        echo "ERROR: Option -$OPTARG requires an argument." >&2
        exit 1
      fi
      ;;
  esac
done

if [[ -n "${MYSQL_PASSWORD}" ]]
then
  MYSQL_OPTS="-p${MYSQL_PASSWORD}"
elif [[ -n "${MYSQL_PASSWORD_REQUIRED}" ]]
then
  MYSQL_OPTS="-p"
fi
