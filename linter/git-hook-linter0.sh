#!/bin/sh
RED="\033[1;31m"
GREEN="\033[1;32m"
NC="\033[0m"
linter_exit_code=1
staged_js_files=$(git diff --cached --diff-filter=d --name-only | grep .js$)
./node_modules/.bin/eslint $staged_js_files --quiet --fix
linter_exit_code=$?
git add -f $staged_js_files

if [ $linter_exit_code -ne 0 ]
then
  echo "${RED} ❌ Linter errors have occurred ${NC}"
  exit 1
else
  echo "${GREEN} ✅ Linter did not find any errors ${NC}"
  exit 0
fi
