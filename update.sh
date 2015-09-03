#!/bin/bash
mkdocs build
echo "static site builded."
git checkout gh-pages
echo "moved to gh-pages branch"
git rm -r .
git rm .
echo "removing from repo production files"
mkdir delete
mv /Users/andreafspeziale/Repository/utils/css /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/fonts /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/git /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/img /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/js /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/license /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/mongodb /Users/andreafspeziale/Repository/utils/delete
mv /Users/andreafspeziale/Repository/utils/index.html /Users/andreafspeziale/Repository/utils/delete
