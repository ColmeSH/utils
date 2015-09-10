# MongoDB Utils

Here you can find a basic MongoDB commands line

## Run
- open a new command line window
- type: mongod

## Check if is running
- open a new command line window
- ps -ax | grep mongo

## Kill
- open a new command line window
- ps -ax | grep mongo
- use 'kill' command with the PID code that the previous command will print

## Shell
- open a new command line window
- type: mongo

## DB List
- move to your command line window with the mongo shell opened
- type: show dbs

## Use/Create DB
- move to your command line window with the mongo shell opened
- type: use nameOfYourDB (if the DB doesn't exist mongo will move you to a new one, but it will not be totally created until you make an insert)

## Collections List
- move to your command line window with the mongo shell opened
- type: show collections


## Create a new document/collection ('tables')
- move to your command line window with the mongo shell opened
- type: db.nameOfTheDocument.insert({"key1":"value1", "key2": "value2"})

## Query all document entries
- move to your command line window with the mongo shell opened
- type: db.nameOfTheDocument.find().pretty()

## Filtered query
- move to your command line window with the mongo shell opened
- type: db.nameOfTheDocument.find({ "key1": "value1"})

## Update document
- move to your command line window with the mongo shell opened
- type: db.nameOfTheDocument.update({"key1": "value1"}, { $set: {"key2": "value2"}})

## Deleting a document
- move to your command line window with the mongo shell opened
- type: db.nameOfTheDocument.drop()

## Deleting multiple documents entries
- move to your command line window with the mongo shell opened
- type: db.nameOfTheDocument.remove({ "key1": "value1" })

## Deleting DB
- move to your command line window with the mongo shell opened
- make sure you are using the DB that you want to delete typing: use nameOfYourDB
- type: db.dropDatabase()
