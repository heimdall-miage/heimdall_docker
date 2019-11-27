**INSTALL**

* Clone this repository : `git clone https://github.com/heimdall-miage/heimdall_docker`

**Configure the environment**

You have to configure at least the _onesignal_, _mailer_ and _server_name_ environment variables for the application to work on a prod env.

* Modify the .env file according to your expected configuration (be sure to avoid committing it, or use the next solution)

OR

* Remove the ".dist" in the name of "docker-compose.override.yml.dist" and override the environment variables in there. This file is ignored by git.

**Initialize the server**

* Execute the command `docker-compose up --build` from the root of the heimdall_docker folder

* Execute the command `docker exec -ti -u heimdall heimdall_web /home/www/heimdall_web/bin/console heimdall:init`. This will ask for a superadmin username/password.

* A webserver is now running on port 80 (default). You can access it on `http://localhost`.

Now that the environment is installed, you can start/stop/restart it with: `docker-compose start` (replacing start by the desired action).

**Update the server**

/!\ This project is still under development, the updates might be bugged and there is no release at this time. An update will just pull the master branch, download new dependancies and reload the assets.

* Execute the command `docker exec -ti -u heimdall heimdall_web /home/www/heimdall_web/bin/console heimdall:update`

**Access the container**

You can access the container as root with `docker exec -ti heimdall_web /bin/bash`

Use `docker exec -ti -u heimdall heimdall_web /bin/bash` to use the heimdall user instead of root.
