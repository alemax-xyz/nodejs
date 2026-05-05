cat <<EOF
# NodeJS docker images

Node.js® is an open-source, cross-platform JavaScript runtime environment.

The image is based on [NodeSource](https://nodesource.com/) builds and it is built on top of the [clover/common](https://hub.docker.com/r/clover/common/).

### Enviroment variables

| Name | Default value | Description
| ---- | ------------- | -----------
| \`PUID\` | _not set_ | desired user id of the process owner
| \`PGID\` | _not set_ | desired group id of the process pwner (primary group of the \`PUID\` user)
| \`PUSER\` | _not set_ | desired \`PUID\` user name
| \`PGROUP\` | _not set_ | desired \`PGID\` group name
| \`CHOWN\` | _not set_ | space-separated list of directories to change ownership to \`PUID\`/\`PGID\` during container startup
| \`CRON\` | _not set_ (\`0\`) | will start _cron_ inside the container if set to \`1\`
| \`TZ\` / \`TIMEZONE\` | _not set_ (\`UTC\`) | desired container timezone

## Available versions

| tag  | node version | npm version |
|-----:|-------------:|------------:|
EOF
for VERSION do printf \
	'| %4s | %12s | %11s |\n' \
	"\`$VERSION\`" \
	"\`$(docker run --rm "clover/nodejs:$VERSION" node --version)\`" \
	"\`$(docker run --rm clover/nodejs:$VERSION npm --version)\`"
done
cat <<EOF

## Additional version tags

 * \`{VERSION}-git\` are based on \`{VERSION}\` with additional \`openssh-client\` and \`git\` binaries;

### Supported platforms

EOF
for PLATFORM in $PLATFORMS; do cat <<EOF
 * \`$PLATFORM\`;
EOF
done
