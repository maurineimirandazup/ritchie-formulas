# Build PHP
BINARY_NAME_UNIX=run.sh
BINARY_NAME_WINDOWS=run.bat
BIN_FOLDER=bin

# php-build:
	mkdir $BIN_FOLDER
	cp -r src/* $BIN_FOLDER
	composer install -q -d $BIN_FOLDER
	echo '#!/bin/sh' > $BIN_FOLDER/$BINARY_NAME_UNIX
	echo 'php -f $(dirname "$0")/index.php' >>  $BIN_FOLDER/$BINARY_NAME_UNIX
	echo 'echo off' > $BIN_FOLDER/$BINARY_NAME_WINDOWS
	echo 'php -f index.php' >> $BIN_FOLDER/$BINARY_NAME_WINDOWS
	chmod +x $BIN_FOLDER/$BINARY_NAME_UNIX

# docker:
	cp Dockerfile set_umask.sh $BIN_FOLDER
