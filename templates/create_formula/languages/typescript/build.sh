# Make Run Node
BINARY_NAME_UNIX=run.sh
BINARY_NAME_WINDOWS=run.bat
BIN_FOLDER=bin

#node-build:
	mkdir -p $BIN_FOLDER
	cp -r src/* $BIN_FOLDER
	npm install --silent --no-progress --prefix $BIN_FOLDER
	npm run build --silent --prefix  $BIN_FOLDER
	echo '#!/bin/sh' > $BIN_FOLDER/$BINARY_NAME_UNIX
	echo 'node "$$(dirname "$$0")"/dist/index.js' >>  $BIN_FOLDER/$BINARY_NAME_UNIX
	echo 'node /dist/index.js' > $BIN_FOLDER/$BINARY_NAME_WINDOWS
	chmod +x $BIN_FOLDER/$BINARY_NAME_UNIX

#docker:
	cp Dockerfile set_umask.sh $BIN_FOLDER
