#!/bin/bash
set -e
chown -R openclaw:openclaw /data
chmod 700 /data
if [ ! -d /data/.linuxbrew ]; then
cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi
rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew
if [ ! -f /data/.openclaw/openclaw.json ]; then
  mkdir -p /data/.openclaw
  echo '{}' > /data/.openclaw/openclaw.json
  chown openclaw:openclaw /data/.openclaw/openclaw.json
fi
exec gosu openclaw node src/server.js
