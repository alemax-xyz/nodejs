# NodeJS docker images

Node.js® is an open-source, cross-platform JavaScript runtime environment.

The image is based on [NodeSource](https://nodesource.com/) builds and it is built on top of the [clover/common](https://hub.docker.com/r/clover/common/).

### Enviroment variables

| Name | Default value | Description
| ---- | ------------- | -----------
| `PUID` | _not set_ | desired user id of the process owner
| `PGID` | _not set_ | desired group id of the process pwner (primary group of the `PUID` user)
| `PUSER` | _not set_ | desired `PUID` user name
| `PGROUP` | _not set_ | desired `PGID` group name
| `CHOWN` | _not set_ | space-separated list of directories to change ownership to `PUID`/`PGID` during container startup
| `CRON` | _not set_ (`0`) | will start _cron_ inside the container if set to `1`
| `TZ` / `TIMEZONE` | _not set_ (`UTC`) | desired container timezone

## Available versions

| tag  | node version | npm version |
|-----:|-------------:|------------:|
| `16` |   `v16.20.2` |    `8.19.4` |
| `18` |   `v18.20.8` |    `10.8.2` |
| `20` |   `v20.20.2` |    `10.8.2` |
| `21` |    `v21.7.3` |    `10.5.0` |
| `22` |   `v22.22.2` |    `10.9.7` |
| `23` |   `v23.11.1` |    `10.9.2` |
| `24` |   `v24.15.0` |   `11.12.1` |

## Additional version tags

 * `{16..24}-git` are based on `{16..24}` with additional `openssh-client` and `git` binaries;

### Supported platforms

 * `linux/amd64`;
 * `linux/arm64/v8`;
