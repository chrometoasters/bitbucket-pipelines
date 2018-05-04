# bitbucket-pipelines

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Docker](https://www.docker.com/) image based on [Debian 9.0 _Stretch_](https://www.debian.org/releases/stretch/) with [PHP](http://php.net/)/[MySQL](https://www.mysql.com) (and more)

More help in Bitbucket's [Confluence](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html)

Docker image at [chrometoaster/bitbucket-pipelines](https://hub.docker.com/r/chrometoaster/bitbucket-pipelines/)

All credit goes to SmartApps and their [bitbucket-pipelines-debian-9](https://github.com/smartapps-fr/bitbucket-pipelines-debian-9) source image we extend.

## Sample `bitbucket-pipelines.yml`

```YAML
image: chrometoaster/bitbucket-pipelines:0.0.1

pipelines:
  custom:   # manually triggered pipelines
    deploy-statics:
      - step:
          caches:
            - node
          script:
            - eval `ssh-agent`
            - ssh-add /opt/atlassian/pipelines/agent/data/id_rsa
            - cd ${BITBUCKET_CLONE_DIR} && cd app/client/
            - yarn install
            - yarn run styleguide:build && echo "Build finished"
            - ...
            - ...
    test-server-connection:
      - step:
          script:
            - eval `ssh-agent`
            - ssh-add /opt/atlassian/pipelines/agent/data/id_rsa
            - ssh bob@example.com "date"

  branches:   # automatically triggered pipelines on push
    fe-statics:
      - step:
          caches:
            - node
          script:
            - eval `ssh-agent`
            - ssh-add /opt/atlassian/pipelines/agent/data/id_rsa
            - cd ${BITBUCKET_CLONE_DIR} && cd app/client/
            - yarn install
            - yarn run styleguide:build && echo "Build finished"
            - ...
            - ...

```
