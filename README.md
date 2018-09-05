# docker-phpstorm

Jetbrains PhpStorm running inside a docker container.  
This project is derived from [`iainmckay/phpstorm`](https://hub.docker.com/r/iainmckay/phpstorm/).

## Features

* PhpStorm 2018
* Git
* Docker
* Python

There is a ubuntu:bionic based container.

## Running

To run PhpStorm we need to provide the current display and your X11 socket.  
You can run PhpStorm with the following command:

```sh
▶ docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /var/run/docker.sock:/var/run/docker.sock
    -v ~/.PhpStorm2018.2:/home/developer/.PhpStorm2018.2 \
    -v ~/workspace:/workspace \
    roukmoute/phpstorm
```

With this your configuration will be persisted to `/home/<user>/.PhpStorm2018.2` so that you don't lose it over subsequent runs.  
It also makes any sourcecode under `/home/<user>/workspace` available to PhpStorm.  
Inside the dockerized environment, it will be available through /workspace.

Note: Remember to change the ownership of the config directory on the host as it will be created as root if it does not already exist and PhpStorm won't be able to write to it.
