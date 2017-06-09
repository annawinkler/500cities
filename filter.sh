#!/usr/bin/env bash

echo ""

if ! type "jq" > /dev/null; then
  echo "You need to install 'jq' to run these tests. You can get it here: http://stedolan.github.io/jq/"
  exit 1
fi

CITY_DATA="${BASH_SOURCE%/*}/citydata.json"

NUM_CITIES=$(cat $CITY_DATA | jq '.data | length')
# Assert there are 500 cities - 500 items in the array
echo -n "Found $NUM_CITIES cities"
if [[ $NUM_CITIES == 500 ]]; then
	echo -e "... \033[32m Passed\c"
else
	echo -e "... \033[31m Failed"
fi
	 
echo -e "\033[0m"
