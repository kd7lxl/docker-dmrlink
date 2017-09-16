#!/bin/bash
set -e
/opt/bridge/IPSC_Bridge.py &
/opt/hblink/HB_Bridge.py &
while /bin/true; do
	for process in IPSC_Bridge.py HB_Bridge.py; do
		ps aux | grep $process | grep -q -v grep
	done
	sleep 10
done
