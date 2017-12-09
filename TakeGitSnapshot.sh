#!/bin/bash

set -e
tempDir=$(mktemp -d)
checkoutDir="$tempDir/mash"
git clone --quiet https://pagure.io/mash.git "$checkoutDir"
tar -C "$tempDir" -cjf mash.tar.bz2 mash

lastTag=$(cd "$checkoutDir"; git describe --tags --abbrev=0)
headCommit=$(cd "$checkoutDir"; git rev-list HEAD -n 1 | cut -c 1-7)

echo "%global gitdate $(date +%Y%m%d)"
echo "%global gitversion ${lastTag}"
echo "%global gitcommit ${headCommit}"

rm -rf "$tempDir"
