#!/bin/bash
echo $MARATHON
CONTENT="Content-Type: application/json"
DEPLOYS=("af-santa-clj-test-r2d2")
echo "posting data to Marathon"
for app in "${DEPLOYS[@]}"; do
	echo "Deploying $app to $MARATHON"
	curl -s -X POST -H "$CONTENT" "$MARATHON" -d@json/${app}.json >> curl.log
	sleep 3
done
