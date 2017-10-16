FROM drecom/ubuntu-ruby:latest

# Update & Install
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Install Ruby
#RUN apt-get install -y ruby ruby-dev ruby-bundler

# Create folder structure
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install Bundler
# RUN gem install bundler 

# Gem install postgres (Had issues without manually installing it)
RUN gem install pg

# Install unicorn
RUN gem install unicorn

# Copy the Gemfile to get dependencies
COPY Gemfile Gemfile

COPY config/database.yml config/database.yml

# Install all the gems
RUN bundle install

# Copy the current directory to work directory again
COPY . .

EXPOSE 8080 