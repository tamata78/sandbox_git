#!/bin/sh

WORK_DIR="/c/pleiades/workspace"


cat ./rel_branch_ver.txt| while read line
do
    strcomment=`echo "$line" | cut -c 1`
    if [ $strcomment = '#' ]; then
        continue
    fi
    
    BRANCH=`echo $line | cut -d'=' -f1`
    VERSION=`echo $line | cut -d'=' -f2`
    TAG_NAME='tag_'$VERSION
    
    cd $WORK_DIR/$BRANCH
    git checkout $VERSION; git pull origin $VERSION; git tag $TAG_NAME; git push origin $TAG_NAME
    
    echo "$TAG_NAME create, and pushed"
done
