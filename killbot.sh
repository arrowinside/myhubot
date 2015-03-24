#!/bin/bash

HUBOTID=`ps -ef | grep hubot | grep -v grep | awk {'print $2'}`

kill $HUBOTID
