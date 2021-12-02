#!/bin/bash

apt-get update
apt-get install jq -y

JSON=$( cat dependencies.json )

for PACKAGE in $( echo $JSON | jq -r 'keys | .[]' ); do
	VERSION=$( apt-cache policy "$PACKAGE" | grep -oP '(?<=Candidate:\s)(.+)' )
	JSON=$( echo $JSON | jq '.[$package] = $version' --arg package $PACKAGE --arg version $VERSION )
done

echo $JSON | jq . > dependencies.json
