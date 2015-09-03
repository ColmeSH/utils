#!/bin/bash
mkdocs build
echo "STATIC FILE BUILDED"
git checkout gh-pages
git rm -r .
echo "removing from repo production files REMOVING FROM REPO PRODUCTION FILE"
mv site/* .
rm -r site
echo "PRODUCTION FILE UPDATED"
git add .
git commit -am "production updated"
git push origin gh-pages
git checkout master
echo "PRODUCTION UPDATED NIGGAH!"
