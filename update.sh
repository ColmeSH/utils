#!/bin/bash
mkdocs build
echo "static site builded."
git checkout gh-pages
echo "moved to gh-pages branch"
git rm -r .
git rm .
echo "removing from repo production files"
mv /Users/andreafspeziale/Repository/utils/site/css /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/fonts /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/git /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/img /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/js /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/license /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/mongodb /Users/andreafspeziale/Repository/utils
mv /Users/andreafspeziale/Repository/utils/site/index.html /Users/andreafspeziale/Repository/utils
rm -r site
git add .
git status
