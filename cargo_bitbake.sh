#!/bin/bash

# Array of package directories
packages=("api" "common" "agent" "server" "grpc" "ank")

# Root directory of the workspace
root_dir="/home/ubuntu/yocto/ankaios"

# Loop through each package and run `cargo bitbake`
for pkg in "${packages[@]}"; do
  (
    cd "$root_dir/$pkg" || exit
    echo "Running cargo bitbake in $pkg..."
    cargo bitbake
  )
done

