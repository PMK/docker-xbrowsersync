# ⛔️ THIS REPOSITORY IS ARCHIVED. USE THE OFFICIAL DOCKER INSTEAD: https://github.com/xbrowsersync/api-docker

---

# docker-xbrowsersync

Dockerized xBrowserSync

> https://www.xbrowsersync.org/

## Run

```
$ docker run -d -p 8080:8080 \
    --name xbrowsersync \
    -v /path/to/settings.json:/xbrowsersync/config/settings.json:ro \
    pmkq/xbrowsersync
```

## Configure settings

Copy [this file](https://raw.githubusercontent.com/xBrowserSync/API/master/config/settings.default.json) and edit to your needs. Configure the volume to use this file, provided to the Docker.

```
-v /path/to/settings.json:/xbrowsersync/config/settings.json:ro
```

More info about contents of `settings.json`: https://github.com/xBrowserSync/API#3-modify-configuration-settings

### Environment variables

- XBROWSERSYNC_VERSION

## Enable HTTPS

Update these settings in your settings.json:

```
{
  "server": {
    "https": {
      "enabled": true,
      "certPath": "/certs/cert.pem",
      "keyPath": "/certs/private.key"
    }
  }
}
```

Run docker with a volume to your SSL certificates:

```
$ docker run -d -p 10443:8080 \
    --name xbrowsersync \
    -v /path/to/certs:/certs:ro \
    -v /path/to/settings.json:/xbrowsersync/config/settings.json:ro \
    pmkq/xbrowsersync
```
