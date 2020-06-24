#!/bin/bash

TAB=$'\t'
counter=0

for i in {1..8};
do # start of IP range: 192.168.1-8.j
	for j in {1..254};
	do # start of IP range: 192.168.i.1-254
		sed -e "36s@.*192.168.202.2.*@${TAB}${TAB}${TAB}${TAB}${TAB}${TAB}\"ip\": \"192.168.$i.$j/32\"@" loopFlow.json > temp.json
		((counter+=1))
		curl -X POST --user onos:rocks -H "content-type:application/json" http://localhost:8181/onos/v1/flows -d @temp.json
	done # end of IP range: 192.168.i.1-254
done

for i in {1..13};
do
	sed -e "36s@.*192.168.202.2.*@${TAB}${TAB}${TAB}${TAB}${TAB}${TAB}\"ip\": \"192.168.9.$i/32\"@" loopFlow.json > temp.json
	((counter+=1))
	curl -X POST --user onos:rocks -H "content-type:application/json" http://localhost:8181/onos/v1/flows -d @temp.json
done

echo "Total add # of flow:" $counter
