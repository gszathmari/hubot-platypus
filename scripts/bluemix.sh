#!/bin/bash

curl -L -o cf.gz 'https://cli.run.pivotal.io/stable?release=linux64-binary&source=github'
tar xvfz cf.gz
chmod 755 ./cf
ls -l
./cf -v
./cf api https://api.ng.bluemix.net
./cf auth $BLUEMIX_USER $BLUEMIX_PASSWORD
./cf target -o $BLUEMIX_USER -s $BLUEMIX_WORKSPACE
./cf install-plugin -f https://static-ice.ng.bluemix.net/ibm-containers-linux_x64
./cf ic login
#./cf ic cpi gszathmari/hubot-platypus registry.ng.bluemix.net/gszathmari/hubot-platypus
docker tag gszathmari/hubot-platypus registry.ng.bluemix.net/gszathmari/hubot-platypus:latest
docker push registry.ng.bluemix.net/gszathmari/hubot-platypus
