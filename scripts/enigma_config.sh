#!/usr/bin/env bash

# Variables

ENIGMAHOME=${ENIGMAHOME:-'/enigma-bbs'}

# Logic

echo "Checking for an ENiGMA config file..."

if [[ -f "${ENIGMAHOME}/config/config.hjson" ]]; then
  echo " - Found config.hjson..."
else
  echo " - No config file found, using basic config..."
  cp ${ENIGMAHOME}/misc/config.hjson ${ENIGMAHOME}/config/config.hjson
fi

echo "Checking for theme files..."

for themefile in menu prompt; do
  if [[ -f "${ENIGMAHOME}/config/${themefile}.hjson" ]; then
    echo " - Found ${themefile}.hjson"
  else
    echo " - ${themefile}.hjson not found, copying template..."
    cp ${ENIGMAHOME}/misc/${themefile}_template.in.hjson ${ENIGMAHOME}/config/${themefile}.hjson
  fi
done
