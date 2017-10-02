> A fork of https://github.com/Drillster/drone-rsync

Use the Rsync plugin to synchronize files to remote hosts, and execute arbitrary commands on those hosts.

## Config
The following parameters are used to configure the plugin:
- **user** - user to log in as on the remote machines, defaults to `root`
- **key** - private SSH key for the remote machines
- **hosts** - hostnames or ip-addresses of the remote machines
- **port** - port to connect to on the remote machines, defaults to `22`
- **source** - source folder to synchronize from, defaults to `./`
- **target** - target folder on remote machines to synchronize to
- **include** - rsync include filter
- **exclude** - rsync exclude filter
- **recursive** - recursively synchronize, defaults to `false`
- **delete** - delete target folder contents, defaults to `false`
- **script** - list of commands to execute on remote machines

It is highly recommended to put your **key** into a secret so it is not exposed to users. This can be done using the drone-cli.

```sh
drone secret add octocat/hello-world RSYNC_KEY @path/to/.ssh/id_rsa
```

Add the secret to your `.drone.yml`:
```yaml
pipeline:
  rsync:
    image: easypi/drone-rsync-arm
    user: some-user
    key: ${RSYNC_KEY}
    hosts:
      - remote1
    source: ./dist
    target: ~/packages
```

Then sign the YAML file after all secrets are added.

```sh
drone sign octocat/hello-world
```

See the [Secret Guide](http://readme.drone.io/usage/secret-guide/) for additional information on secrets.

## Examples
```yaml
pipeline:
  rsync:
    image: easypi/drone-rsync-arm
    user: some-user
    key: ${RSYNC_KEY}
    hosts:
      - remote1
      - remote2
    source: ./dist
    target: ~/packages
    include:
      - "app.tar.gz"
      - "app.tar.gz.md5"
    exclude:
      - "**.*"
    script:
      - cd ~/packages
      - md5sum -c app.tar.gz.md5
      - tar -xf app.tar.gz -C ~/app
```

The example above illustrates a situation where an app package (`app.tar.gz`) will be deployed to 2 remote hosts (`remote1` and `remote2`). An md5 checksum will be deployed as well. After deploying, the md5 checksum is used to check the deployed package. If successful the package is extracted.

## Important
The script passed to **script** will be executed on remote machines directly after rsync completes to deploy the files. It will be executed step by step until a command returns a non-zero exit-code. If this happens, the entire plugin will exit and fail the build.


## SSH key secret in Drone >= 0.6

Secret injection has changed for Drone 0.6 and up. Register your SSH key secret using the drone-cli.

```sh
drone secret update \
   --repository your/repo \
   --name plugin_key \
   --value @./id_rsa.pub \
   --image easypi/drone-rsync-arm
```

Do not add a `key` parameter in `.drone.yml` configuration, but add:

```
secrets: [ plugin_key ]
```

Using any other name will not work.
