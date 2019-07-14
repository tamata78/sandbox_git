#!/bin/sh

BRANCH=$1

cd /c/pleiades/workspace/app_web; git checkout $BRANCH; git pull
cd /c/pleiades/workspace/app_db; git checkout $BRANCH; git pull
cd /c/pleiades/workspace/app_pom; git checkout $BRANCH; git pull
cd /c/pleiades/workspace/app_batch; git checkout $BRANCH; git pull
