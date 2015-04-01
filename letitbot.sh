#!/bin/bash
# runhubot

export HUBOT_SLACK_TOKEN=xoxb-3624057176-v5Be7pwbom31EWZXGIBolpZ2

#bin/hubot -a slack
forever start -c bash bin/hubot -a slack


