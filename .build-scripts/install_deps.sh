#! /bin/bash

echo "Installing dependencies for $EXPORT_TYPE"

pip3 install gdtoolkit
apt-get update -qq && apt-get install -y -qq curl unzip software-properties-common ca-certificates sudo zip

# if [[ "$EXPORT_TYPE" == "Android" ]]; then
# 	apt-get update -qq && apt-get install -y -qq curl unzip software-properties-common ca-certificates sudo zip openjdk-8-jdk-headless adb
# else
# 	apt-get update -qq && apt-get install -y -qq curl unzip software-properties-common ca-certificates sudo zip
# fi
