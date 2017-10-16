# 1. Vagrant demo version

If encounter error message due to Hyper-V crash with VirtualBox, delete .vagrant and run vagrant up again

## Files
The vagrant file builds a CentOS/7 box. The startup process in split into different files:

### bootstrap.sh
This .sh runs with admin priviledges so it is allowed to update and install wget which will be needed in the other files.

### redmine.sh
Download a packaged version of redmine and unpackage it in the VM. Then write a simple SQLite database configuration.

### rubyonrails.sh
It starts off with installing the Ruby version manager and then it installs the correct version of Ruby.
After that it installs bundler and unicorn, as both of them will be used in the "future".
After that it installs all the gems and requirements using Ruby and Bundler. Then it creates a database structure
and provides it with basic configuration. Then it sets permissions for a set of folders that was required by RedMine according to the install guide. Then it writes a line in the VMs hosts-file, which had to be there in-order for it to work to connect to the Redmine application outside of the VM.
And finally it runs "unicorn" which runs the application.

## CMDs to run
`vagrant up`  
`vagrant up --provider hyperv`
