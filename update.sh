#!/bin/bash
mkdocs build
echo "STATIC FILE BUILDED"
git checkout gh-pages
git rm -r .
git rm .
echo "removing from repo production files REMOVING FROM REPO PRODUCTION FILE"
mv /Users/andreafspeziale/Repository/utils/site/css /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/fonts /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/git /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/img /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/js /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/license /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/mongodb /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/index.html /Users/andreafspeziale/Repository/utils
rm -r site
echo "PRODUCTION FILE UPDATED"
git add .
git status
git commit -am "production updated"
git push origin gh-pages
git checkout master
git status
echo "PRODUCTION UPDATED NIGGAH!"
