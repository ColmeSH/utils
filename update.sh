#!/bin/bash
mkdocs build
echo "static site builded."
git checkout gh-pages
echo "moved to gh-pages branch"
git rm -r .
git rm .
echo "removing from repo production files"
