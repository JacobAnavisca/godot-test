#! /bin/bash

echo "Initializing Headless Godot v$GODOT_VERSION"

mkdir -p /opt/
curl -s -L -o godot_headless.zip -C - https://downloads.tuxfamily.org/godotengine/$GODOT_VERSION/Godot_v$GODOT_VERSION-stable_linux_headless.64.zip
unzip godot_headless.zip -d /opt/
rm -f godot_headless.zip
ln -s /opt/Godot_v$GODOT_VERSION-stable_linux_headless.64 /usr/local/bin/godot
mkdir -p /root/.local/share/godot/templates/$GODOT_VERSION.stable/
mkdir -p /root/.local/share/godot-tmp/
curl -s -L -o godot_export_templates.zip -C - https://downloads.tuxfamily.org/godotengine/$GODOT_VERSION/Godot_v$GODOT_VERSION-stable_export_templates.tpz
unzip godot_export_templates.zip -d /root/.local/share/godot-tmp/
rm -f godot_export_templates.zip
mv /root/.local/share/godot-tmp/templates/* /root/.local/share/godot/templates/$GODOT_VERSION.stable
