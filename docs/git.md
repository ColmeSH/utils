# Git Utils

Here you can find a basic walkthrough for the creation of a new Git repository

##Install Git

If you don't have git installed you will need also to install brew package manager:

    - 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    - 'brew install git'

## Local Global Configuration

From anyway on your command line:

    - 'git config --global user.name <NAME>'

    - 'git config --global user.email <EMAIL>'

## GitHub

Go to github.com and create an account

## New Repository

To create a new repository:

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

Move to your command line window and type:

    - 'git pull'

## Check Repository Status

Move to your command line window and type:

    - 'git status'

## List branch

Move to your command line window and type:

    - 'git branch -a'

## Create and move to a new branch

Move to your command line window and type:

    - 'git checkout -b nameOfTheBranch'

    - git push <remote-name> <branch-name>

## Merging

Move from the developing branch to the one which you want to import changesets:

    - 'git merge nameOfTheBranch'

## Delete file from repo  

Move to your command line window and type:

    - 'git rm fileName'

    - git commit -m "remove fileName"
