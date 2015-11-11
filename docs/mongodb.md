# Mongo DB Utils

Here you can find a basic MongoDB commands line

##

If you don't have git installed you will need also to install brew package manager:

    - 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    - 'brew install mongodb'

## Run

If you don't have git installed you will need also to install brew package manager:

    - 'mongod'

## Check if is Running

To check if you have any mongo instance running:

    - 'ps -ax | grep mongo'

## Kill Mongo Instance

Move to your command line window and type:

    - use 'kill PID' code that the previous Check if is Running command provide

## Shell

Move to your command line window and type:

    - 'mongo'

## DB List

From the mongo opened shell:

    - 'show dbs'

## Use/Create DB

From the mongo opened shell:

    - 'use nameOfYourDB' (if the DB doesn't exist mongo will move you to a new one, but it will not be totally created until you make an insert)

## Collections List

From the mongo opened shell:

    - 'show collections'

## Create a new Document / Collection ('tables')

From the mongo opened shell:

    - 'db.nameOfTheDocument.insert({"key1":"value1", "key2": "value2"})'

## Query all Document Entries

From the mongo opened shell:

    - 'db.nameOfTheDocument.find().pretty()'

## Filtered Query

From the mongo opened shell:

    - 'db.nameOfTheDocument.find({ "key1": "value1"})'

## Update Document

From the mongo opened shell:

    - 'db.nameOfTheDocument.update({"key1": "value1"}, { $set: {"key2": "value2"}})'

## Deleting a Document

From the mongo opened shell:

    - 'db.nameOfTheDocument.drop()'

## Deleting Multiple Documents Entries

From the mongo opened shell:

    - 'db.nameOfTheDocument.remove({ "key1": "value1" })'

## Deleting DB

From the mongo opened shell and make sure you are using the DB that you want to delete typing 'use nameOfYourDB':

- 'db.dropDatabase()'
