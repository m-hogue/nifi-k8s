#!/bin/sh

HOSTNAME=(`hostname`)
NIFI_VERSION=1.11.0-SNAPSHOT

if [ -d /share/$HOSTNAME ]; then
  echo EXISTS 
else
  mkdir -p /share/$HOSTNAME
  cp /template/nifi-$NIFI_VERSION-bin.tar.gz /share/$HOSTNAME/
  cd /share/$HOSTNAME
  tar -xzf /share/$HOSTNAME/nifi-$NIFI_VERSION-bin.tar.gz
  rm /share/$HOSTNAME/nifi-$NIFI_VERSION-bin.tar.gz
fi

if [ -f /share/flow.xml.gz ]; then
  cp /share/flow.xml.gz /share/$HOSTNAME/nifi-$NIFI_VERSION/conf/
fi

/share/$HOSTNAME/nifi-$NIFI_VERSION/bin/nifi.sh start &
tail -F /share/$HOSTNAME/nifi-$NIFI_VERSION/logs/nifi-app.log
