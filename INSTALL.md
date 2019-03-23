* Clone the repository : `git clone https://github.com/SosthenG/heimdall_docker`
* Clone the web app repository inside the web/src directory : `git clone https://github.com/SosthenG/heimdall_web`
(TODO : Clone and install the app directly from the Dockerfile)
* Execute command `docker-compose up` from the root of the heimdall_docker folder
* Execute the command `docker exec -ti -u heimdall heimdall_web /bin/bash` : This will log you inside the web container
  * Launch `composer install`
  * Modify the .env file variables according to your configuration (database, env, ...)
  * Launch `php bin/console doctrine:schema:update --force`
  * Launch `php bin/console doctrine:fixtures:load --group=dev` (use **prod** instead of **dev**, depending on your env)

The environment is running, you can work with it.

Now that environment is installed, you can start/stop/restart it with the corresponding commands : `docker-compose COMMAND`

TODO : To complete for prod env