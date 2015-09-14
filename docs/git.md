# Git Utils

Here you can find a basic walkthrough for the creation of a new repository

## GitHub
- go to github.com and create an account

## New Repository
- log to your account on github
- create a repository
- create a new folder wherever you want into your computer
- navigate to the folder root from your command line
- write the command: 'git init .'
- create a new file with vim command: 'vim .gitignore' // press 'i' and insert the file or folder you want to not track with git
- write the command: 'git remote add origin git@github.com:MyUsername/nameOfTheOnlineRepo.git'
- write the command: 'git add .' // to start tracking the files
- write the command: 'git commit -am "initial-gitignore"' // to archive your chagesets
- write the command: 'git push -u origin master' // to push your changesets to the online repository // '-u' to set the branch as default

## Download Mate Changesets
- move to your command line window and type: 'git pull'

## Check Repository Status
- move to your command line window and type: 'git status'

## List branch
- move to your command line window and type: 'git branch'

## Create and move to a new branch
- move to your command line window and type: 'git checkout -b nameOfTheBranch'

## Delete file from repo  
- move to your command line window and type: 'git rm fileName' // git commit -m "remove fileName" (it will remove the file locally too)
