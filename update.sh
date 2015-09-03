#!/bin/bash
mkdocs build
echo "STATIC FILE BUILDED"
git checkout gh-pages
git rm -r .
git rm .
echo "removing from repo production files REMOVING FROM REPO PRODUCTION FILE"
mv /Users/andreafspeziale/Repository/utils/site/* /Users/andreafspeziale/Repository/utils
rm -r site
echo "PRODUCTION FILE UPDATED"
git add .
git status
git commit -am "production updated"
git push origin gh-pages
git checkout master
git status
echo "PRODUCTION UPDATED NIGGAH!"
