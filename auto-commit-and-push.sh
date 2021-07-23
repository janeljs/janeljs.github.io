#!/bin/bash
git add .
C=$(git diff --staged | grep category)
T=$(git diff --staged | grep title)
BRANCH=$(git branch | grep '*')
CATEGORY=${C##*:}
TITLE=${T##*:}
ISSUE=${BRANCH##*-}
MESSAGE="${CATEGORY:1}: (#${ISSUE}) ${TITLE:1}"
git commit -m "${MESSAGE}"
git push origin "${BRANCH:2}":develop
