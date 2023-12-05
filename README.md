# NodeJS docker images

Node.js® is an open-source, cross-platform JavaScript runtime environment.

The image is based on [NodeSource](https://nodesource.com/) builds and it is built on top of the [clover/common](https://hub.docker.com/r/clover/common/).

## Available versions

| tag | node version | npm version |
|----:|-------------:|------------:|
|  16 |    `16.20.2` |    `8.19.4` |
|  18 |    `18.19.0` |    `10.2.3` |
|  20 |    `20.10.0` |    `10.2.3` |
|  21 |     `21.4.0` |    `10.2.4` |

## Additional version tags

 * `{8..19}-git` are based on `{8..19}` with additional `openssh-client` and `git` binaries;
