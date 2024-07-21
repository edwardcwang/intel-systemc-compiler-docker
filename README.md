# Dockerfiles for Intel SystemC Compiler

# Requirements
* Disk space: ~10-15GB
* ~20 minutes to build on c7i.8xlarge

Install required packages
```
sudo apt-get update && sudo apt-get install -y docker.io docker-compose docker-compose-v2 jq docker-buildx
```

# Build

```shell
DOCKER_BUILDKIT=1 docker buildx build -t icsc .
```

# Run

```shell
docker run -u 0 -it icsc /bin/bash
```

https://github.com/intel/systemc-compiler/wiki/Getting-started#generate-sv-code-for-one-specific-example-or-design
