#!/usr/bin/env bash

# brew install ariga/tap/atlas

cd "$(dirname "$0")"

atlas schema apply \
  -u "postgres://jt:jt@localhost:5435/jt?sslmode=disable" \
  -f ./schema.hcl \
  --auto-approve