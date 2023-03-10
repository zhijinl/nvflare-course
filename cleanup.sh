#!/bin/bash

# This script will clean up
#  pycache
#  notebook cache
#  permission issues.
#  demo workspaces
#  tmp directories

sudo chown -R $(id -un):$(id -gn) .
sudo chown -R $(id -un):$(id -gn) /tmp/monai_workspace
sudo chown -R $(id -un):$(id -gn) /tmp/fl-dashboard

rm -f .DS_Store
rm -r notebooks/.Trash*
rm -r notebooks/.ipynb_checkpoints

# clean out examples
rm -r notebooks/examples
rm -r notebooks/hello-numpy-cross-val-workspace
rm -r notebooks/poc_workspace
rm -r notebooks/monai_workspace
rm -r /tmp/monai_workspce
rm -r /tmp/fl-dashboard

