#!/bin/bash

# This script will clean up
#  pycache
#  notebook cache
#  permission issues.
#  demo workspaces
#  tmp directories

sudo chown -R $(id -un):$(id -gn) .

rm -f .DS_Store
rm -r notebooks/.Trash*
rm -r notebooks/.ipynb_checkpoints

# clean out examples
rm -r notebooks/examples
rm -r notebooks/temp-workspace
rm -r /tmp/nvflare/

