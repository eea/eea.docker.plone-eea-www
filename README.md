# EEA Plone WWW Docker Image based on EEA KGS

[![Build Status](https://ci.eionet.europa.eu/buildStatus/icon?job=eea/eea.docker.plone-eea-www/master)](https://ci.eionet.europa.eu/job/eea/job/eea.docker.plone-eea-www/job/master/display/redirect)

Docker Plone Image used for EEA website. See more at [eea.docker.www](https://github.com/eea/eea.docker.www)

## Supported environment variables

* `ZOPE_MODE` Can be `zeoserver`, `standalone`, `zeo_client`, `zeo_async`,  `rel_client`, `rel_async`. Default `standalone`
* `GRAYLOG` Configure zope inside container to send logs to GrayLog. Default logcentral.eea.europa.eu:12201. (e.g.: `GRAYLOG=logs.example.com:12201`)
* `GRAYLOG_FACILITY` Custom GrayLog facility. Default eea.docker.kgs (e.g.: `GRAYLOG_FACILITY=staging.example.com`)
* `RABBITMQ_HOST` RabbitMQ host. Default `rabbitmq` (e.g.: `RABBITMQ_HOST=rabbitmq.example.com`)
* `RABBITMQ_PORT` RabbitMQ port. Default `5672` (e.g.: `RABBITMQ_PORT=8080`)
* `RABBITMQ_USER` RabbitMQ username. Default `guest` (e.g.: `RABBITMQ_USER=client`)
* `RABBITMQ_PASS` RabbitMQ password. Default `guest` (e.g.: `RABBITMQ_USER=secret`)

## Release new versions of this image

Get source code

    $ git clone git@github.com:eea/eea.docker.plone-eea-www.git

Update `FROM eeacms/kgs:X.Y` base image within `Dockerfile`

    $ cd eea.docker.plone-eea-www
    $ vim Dockerfile
    FROM eeacms/kgs:19.5

Update `FROM eeacms/www:X.Y` base image within `devel/Dockerfile`

    $ cd eea.docker.plone-eea-www
    $ vim devel/Dockerfile
    FROM eeacms/www:19.5

Commit changes

    $ git commit -am "Release 19.5"

Create tag

    $ git tag 19.5

Push changes

    $ git push --tags
    $ git push

After eeacms/www:19.5 is build, you need to trigger the release of eeacms/www-devel:19.5 ( which uses eeacms/www:19.5)
