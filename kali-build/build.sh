#!/bin/bash

image="kali:latest"

docker build -t $image . --no-cache
