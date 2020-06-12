#!/bin/bash
dirs=$(find . -name '.git' -type d | sed 's/\/\.git//')

echo '' > clone-all.sh

for dir in $dirs; do
  GIT_DIR=$dir/.git

  # Creates the folder structure
  if [[ -n $(git --git-dir=$GIT_DIR remote) ]]; then
    echo mkdir -p $dir;
  fi

  # Clones the repository in the same folder
  COMMAND=$(git --git-dir=$GIT_DIR remote | grep -n origin)
  if [[ -n $COMMAND ]]; then
    echo git clone $(git --git-dir=$GIT_DIR remote get-url origin) $dir;
  fi

  # Re-adds other remotes
  for r in $(git --git-dir=$GIT_DIR remote | grep -v origin); do
    echo git --git-dir=$GIT_DIR remote add $r $(git --git-dir=$GIT_DIR remote get-url $r);
  done

  echo
done > clone-all.sh
