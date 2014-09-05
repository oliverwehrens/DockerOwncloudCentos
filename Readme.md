Installing Owncloud in Docker on Centos

This creates a Docker image for owncloud running CentOS.

It exposes the data directory as volume. If you choose sqlite as database (not recommended for big installations, but for my home installation it is fine), everything, including the sqllite database file, is available in the data directory. I can now backup everything useing the means of the host system.

One important note: the data dir on the hostsystem will have the same userid as the user running inside the container (which is user apache).

I use it behind an reverse proxy so I terminate https there instead on owncloud directly.

```
docker build -t="owehrens/owncloud" .
```

to run it:

```
docker run -v <HOSTDATADIR>:/var/www/html/owncloud/data -p <HOSTPORT>:80  owehrens/owncloud
```
