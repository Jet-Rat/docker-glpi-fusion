# docker-glpi

```
sudo docker network create -d bridge glpi-net

sudo docker run -d --name glpi-db \
-v glpi-db:/var/lib/mysql \
--net glpi-net \
-e MYSQL_ROOT_PASSWORD=suP3rp244w0rds91r00t \
-e MYSQL_DATABASE=glpi \
-e MYSQL_USER=glpi \
-e MYSQL_PASSWORD=suP3rp244w0rds9161p1 \
jetrat/mysql-utf8

sudo docker run -d --name glpi \
-v glpi-conf:/var/www/glpi \
--net glpi-net \
-e GLPI_DB_HOST=glpi-db \
-e GLPI_DB_NAME=glpi \
-e GLPI_DB_USER=glpi \
-e GLPI_DB_PASS=suP3rp244w0rds9161p1 \
-p 80:80 \
jetrat/glpi
```


If you're running new GLPI instance, you have to finish installation via web
