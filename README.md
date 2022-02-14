Demo Project
==============================

Summary
---------
This repo contains example flask app.

Documentation
-------------

Software Versions
---------
ubuntu: 21.04
docker: >~
awscli: >~

Install steps
-------------------
# Requirements

0.0: This scrip currently tested only on ubuntu 21.04!

0.1: For spin up, env we need installed and configure AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
For do this first we neeed create IAM User in aws console.

# NOTE This script using aws credentials from $USER/.aws/ directory!!!

0.2:
Also we need to have installed "make" and "docker" on the host

```sh
sudo apt-get update
sudo apt-get install make
````

0.3:
For docker installation please read the official docs 
https://docs.docker.com/engine/install/ubuntu/

# DEPLOY TO AWS BEANSTALK

1: Clone infra repo to local env

2: Spinup aws env from infra repo (see readme on the infra repo)

3: Prepare scripts

```sh
make init
```

4: deploy

```sh
make deploy
```

5: copy url(CNAME) from the output and open int on the browser

```sh
Environment details for: demo
  Application name: demo
  Region: us-east-1
  Deployed Version: app-000000_000000000000
  Environment ID: x-xxxxxxxxxx
  Platform: arn:aws:elasticbeanstalk:us-east-1::platform/Docker running on 64bit Amazon Linux 2/3.4.11
  Tier: WebServer-Standard-1.0
  CNAME: demo.eba-z6xdmyn8.us-east-1.elasticbeanstalk.com
  Updated: 2022-02-14 10:48:02.222000+00:00
  Status: Ready
  Health: Green
```

# DEPLOY LOCALLY
1: Prepare scripts

```sh
make init
```

4: build docker container

```sh
make build
```

5: run docker container

```sh
make run
```

6: check app on browser

http://127.0.0.1:80
