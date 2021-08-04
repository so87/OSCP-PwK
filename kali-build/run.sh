#!/bin/bash
image="kali:latest"

docker run -it --entrypoint "/bin/bash" --rm --network host --cap-add all -v ${pwd}/data:/data/ -v ${pwd}/scripts:/scripts/ $image
