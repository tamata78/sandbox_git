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
    
    cd $WORK_DIR/$BRANCH
    git add pom.xml
    git commit -m 'バージョンアップ_'$VERSION
    git push origin $VERSION

done
