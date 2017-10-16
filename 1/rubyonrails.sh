#!/usr/bin/bash

# Add the Ruby Version Manager
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm

# Install the latest supporting version Ruby for Redmine 3.4
rvm use --default --install 2.4.0

# Go into directory with Gemfile and Rakefile
cd redmine-3.4.2/

# Install new bundler version
gem install bundler

# Install unicorn to run app
gem install unicorn

# Install gems - exclude RMagick as it won't be needed and drains the install
bundle install --without development test rmagick

# Create database structure and insert default configuration.
bundle exec rake generate_secret_token
bundle exec rake db:migrate
REDMINE_LANG=en bundle exec rake redmine:load_default_data

# Create directories and set permissions for them to vagrant. (Required on redmine install guide)
mkdir -p tmp tmp/pdf public/plugin_assets
sudo chown -R vagrant:vagrant files log tmp public/plugin_assets
sudo chmod -R 755 files log tmp public/plugin_assets

# Write to hosts file route 0.0.0.0 to localhost. Only way I found it to work.
sudo sh -c "echo '0.0.0.0 localhost localhost.localdomain localhost4 localhost4.localdomain4' >> /etc/hosts"

# Run RedMine with Unicorn
unicorn