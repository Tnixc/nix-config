#!/bin/sh

OLDRESULT=$(realpath result)
nix flake update
echo "Diff with $OLDRESULT"
nix store diff-closures "$OLDRESULT" ./result |grep '→'
#nix store diff-closures "$OLDRESULT" ./result |grep -Ev '[∅ε]' |grep '→'

