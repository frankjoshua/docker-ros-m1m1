# ROS Slamtec M1M1 laser in Docker [![](https://img.shields.io/docker/pulls/frankjoshua/ros-m1m1)](https://hub.docker.com/r/frankjoshua/ros-m1m1) [![CI](https://github.com/frankjoshua/docker-ros-m1m1/workflows/CI/badge.svg)](https://github.com/frankjoshua/docker-ros-m1m1/actions)

## Description

Runs a ROS Slamtec M1M1 laser in a Docker container. Probably need --network="host" because ROS uses ephemeral ports.

## Example

```
docker run -it \
    --network="host" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    frankjoshua/ros-m1m1
```

## Building

Use [build.sh](build.sh) to build the docker containers.

<br>Local builds are as follows:

```
./build.sh -t frankjoshua/ros-m1m1 -l
```

## Testing

Github Actions expects the DOCKERHUB_USERNAME and DOCKERHUB_TOKEN variables to be set in your environment.

## License

Apache 2.0

## Author Information

Joshua Frank [@frankjoshua77](https://www.twitter.com/@frankjoshua77)
<br>
[http://roboticsascode.com](http://roboticsascode.com)
