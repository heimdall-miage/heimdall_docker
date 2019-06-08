**INSTALL**

* Clone this repository : `git clone https://github.com/heimdall-watch/heimdall_docker`

**Configure the environment**

You have to configure at least the _onesignal_, _mailer_ and _server_name_ environment variables for the application to work on a prod env.

* Modify the .env file according to your expected configuration (be sure to avoid committing it, or use the next solution)

OR

* Remove the ".dist" in the name of "docker-compose.override.yml.dist" and override the environment variables in there. This file is ignored by git.

**Initialize the server**

* Execute command `docker-compose up --build` from the root of the heimdall_docker folder

* A webserver is now running on port 80 (default). You can access it on `http://localhost`.

Now that the environment is installed, you can start/stop/restart it with: `docker-compose start` (replacing start by the desired action).

**Access the container**

You can access the container as root with `docker exec -ti heimdall_web /bin/bash`

Use `docker exec -ti -u heimdall heimdall_web /bin/bash` to use the heimdall user instead of root.

**Temp dev notes**

**A chaque nouvelle dépendances html/css/js**
yarn install

**A chaque  nouvelle dépendances**

composer install

**Se connecter au contenaire web sous intelliJ**

docker exec -ti -u heimdall heimdall_web /bin/bash

**Commit des fichiers ajoutés dans le projet**

Pour commit selectionner : heimdall_web dans le projet
Ctrl alt A pour commit les fichier (uniquement en création, passage de rouge à vert)

**compiler bootstrap à chaque modification du css/js**

yarn watch

**regénéré les assets, css et js**

yarn encore dev

**renouveller le cache après un update**

php bin/console cache:clear

**mettre a jour la base de donnée suite à mise à jour du schema**

php bin/console doctrine:schema:update --force

**Mettre à jour la base de donnée en fonction des data fixtures**

php bin/console doctrine:fixtures:load

