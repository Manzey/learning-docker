#!/usr/bin/bash 

# Download and unpackage redmine
wget http://www.redmine.org/releases/redmine-3.4.2.tar.gz
tar xzfv redmine-3.4.2.tar.gz

# Go to the redmine directory
cd redmine-3.4.2/

# Write a quick SQLite3 config to database.yml
echo -e "development:\n   adapter: sqlite3\n   database: db/redmine.sqlite3" >> config/database.yml

# Copy configuration template into a non-template file.
cp config/configuration.yml.example config/configuration.yml