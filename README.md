# About
This is something I did whilst learning how to work with Vagrant and Docker.  
I learned about using compose to build docker-machines.  
Below is my work diary with some frustration about how things went.

## Work Diary - Total worktime: 17 hours
### Day 1 (Part 1 Vagrant) Worktime: 8 hours
The first working day of the examination went pretty good at the start. It all flowed on well, read the documentation for redmine and learned how to use it.
Then it came to the actual implementation and I noticed that my Vagrant was having issues. Working with Docker in the previous exercises forced me to turn Hyper-V on which malfunctioned Vagrant since I normally use VBox. So every time I used vagrant up, my computer prompted a blue screen. This took some time to figure out and fix, but eventually I found the solution of disabling Hyper-V and it worked perfectly after that.
I also had some issues with Rsync, but since no synced folders were needed for the examination I just disabled them to avoid errors.

And then to the actual implementation. This took several hours. I did the correct approach at first, followed the redmine guide, no errors or nothing. But the application didn't wanna show up on localhost:8080 or any port for that matter. So I spent countless hours researching until I finally found a solution, which was to bind Webrick/Unicorn to 0.0.0.0 and adjust in the VMs etc/hosts file to route 0.0.0.0 to localhost. After that the application worked perfectly and part 1 was complete. All that is required is "vagrant up" and the machine will boot up and install and then run Unicorn to launch the application.

### Day 2 (Part 2 Docker Development version) Worktime: 7 hours
This day started out poorly with plenty of errors and hours of bugfixing. But eventually things progressed up to one point where
I had issues with the database not creating the users and whatnot. After about 3 hours of trying to fix this, I found a source saying that I could prune the volume and system and recreate the application. This worked and the problem was caused by a database already running in the background so it interfered with the newly created one. After that the application ran successfully, I installed unicorn and made sure it worked, and it did! Now its only the production part left, which I doubt will be as painful and with less bugs.

### Day 3(Part 3 Docker Production version) Worktime: 2 hours
This day was way better than the other days. No bugs or errors that I had to fix. I only had to get the nginx reverseproxy up and running and that was fairly easy since I did it in the exercise not too long ago. The only thing that remains right now is to push everything up to github and it should be all set!
