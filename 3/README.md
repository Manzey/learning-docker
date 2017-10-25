# 3. Docker Production version

Builds the application using docker. Using a docker-compose.yml file to run multiple applications at the same time.
Also includes a reverseproxy and runs in production mode.

## CMDs
Run this first  
`docker-compose build`

Then run - (If it gives an error, run it again, the database might not have finished loading up)  
`docker-compose run redmine rake assets:precompile`  
`docker-compose run redmine rake db:migrate`

Then run  
`docker-compose up`

Then if docker-compose up doesn't work run, it might be because there is already an instance of the database or application running so run:  
`docker-compose down && docker-compose up --force-recreate`

Useful commands:  
`docker volume prune`  
`docker system prune -a -f`
