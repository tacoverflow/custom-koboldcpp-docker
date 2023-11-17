#! /bin/bash
command -v docker &>/dev/null || alias docker=podman
shopt -s expand_aliases
docker build --no-cache -f Dockerfile -t koboldcpp:latest
