# LEMP stack built with Docker Compose

A LEMP (Linux Nginx MySQL PHP) stack environment built using Docker Compose. It is meant for local development and not for production usage. It consists of:

- PHP
- Nginx
- MariaDB
- phpMyAdmin


## Installation

Clone this repository to your local computer:

```bash
git clone https://github.com/contaware/docker-lemp.git
```


## Usage and Configuration

### Start servers

1. Enter the project directory: `cd docker-lemp/`
2. Run: `docker compose up -d` 

### Stop servers

1. Enter the project directory: `cd docker-lemp/`
2. Run: `docker compose down`

### After configuration changes

Enter the project directory: `cd docker-lemp/`

- If *./nginx_conf/default.conf* has been changed, run:  
  `docker compose exec nginx nginx -s reload`

- If *./compose.yaml* has been changed, run:  
  `docker compose down`  
  `docker compose up -d`
   
- If *./Dockerfile* has been changed, run:  
  `docker compose down`  
  `docker compose up -d --build`

### Web Server and PHP

The Nginx server is listening on <http://localhost:8000>. Change the port in *./compose.yaml* file.

Place your web project files into *./html/* directory.

The installed PHP version along the extensions can be configured in *./Dockerfile* file.

### Database Server

MariaDB is configured to listen on port **3306**. Access the server with the **mariadb** hostname, see *./html/index.php* for an example. The databases are stored under *./mariadb_data/*.

Other than the **root** user, there is also a **blog** user with a **blogdb** database. Both **root** and **blog** have the **1234** password. Server version, port and passwords can be changed in *./compose.yaml*. But note that in some cases it may be necessary to start with no databases, for that delete the *./mariadb_data/* directory.

### phpMyAdmin

phpMyAdmin is accessed through <http://localhost:8081>. Use the credentials reported in the previous section.

Change version and port in *./compose.yaml*.
