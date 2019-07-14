#!/bin/sh

if [ $# != 3 ]; then
    echo " example:"
    echo "   $0 [repository_name] [branch_name] [tag_name]"
    exit 1
fi

repo=$1
bran_name=$2
tag_name=$3

cd /c/pleiades/workspace/$repo
git checkout master; git pull; git tag $tag_name; git push orgin $tag_name

# dev_add_snapshot
git branch -D dev_add_snapshot
git push --delete origin dev_add_snapshot

# param del target branch
git branch -D $bran_name
git push --delete origin $bran_name

