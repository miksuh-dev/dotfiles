#!/usr/bin/env bash
FIREFOX_DIR=$HOME/.mozilla/firefox
PLACES_DB=$(find "$FIREFOX_DIR" -name "places.sqlite" ! -path "$FIREFOX_DIR/*.default$" ! -path "$FIREFOX_DIR/*default" | head -1)
TEMP_DIR="/tmp"

rm -f "$TEMP_DIR/places.sqlite"
cp -f ${PLACES_DB} "$TEMP_DIR/places.sqlite"
