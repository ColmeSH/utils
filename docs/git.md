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
    
## Discard Changes

On single file

    - git checkout -- <FILE_NAME>
    
All changes

    - git checkout .
    
Reset to Old Commit

    - git revert <COMMIT>

## Create and move to a new branch

Move to your command line window and type:

    - 'git checkout -b nameOfTheBranch'

    - git push <remote-name> <branch-name>

## List branch

Move to your command line window and type:

    - 'git branch -a'
    
If have cloned a new repository with different branches to move to one of those you will need 
to create a local branch that will track the remote one

    - git checkout -b local_branch_name origin/branch_name

## Merging

Move from the developing branch to the one which you want to import changesets:

    - 'git merge nameOfTheBranch'

## Delete file from repo

Move to your command line window and type:

    - git rm file1.txt
    - git commit -m "remove file1.txt"

But if you want to remove the file only from the Git repository and not remove it from the filesystem, use:

    - git rm --cached file1.txt
      
## Tag and Release

Some explanation from the Github Docs
[Github](https://help.github.com/articles/creating-releases/)

Tagging
    - git tag (listing)
    - git tag -a v1.4 -m "my version 1.4"
    - git push --tags
    - git show v1.4 (showing)

## Tips

Commits by author

    - git log --author=USERNAME

Ccompressed log where each commit is one line:

    - git log --pretty=oneline

ASCII art tree of all the branches, decorated with the names of tags and branches:

    - git log --graph --oneline --decorate --all

Git log with file changed
    
    - git log --name-status

Change permanently log format

    - git config format.pretty oneline
    - git config format.pretty medium
    - git config format.pretty full
    
Alias a super cool log visualization editing your .zshrc (I'm actually using zsh and not bash)
 
    - alias glp="git log --pretty='format:%Cgreen%H%Creset %an %Cblue%aD%Creset -     %s' --graph"