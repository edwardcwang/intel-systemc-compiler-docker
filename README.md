# Dockerfiles for Intel SystemC Compiler

Quickstart:

```shell
docker run -u 0 -it ghcr.io/edwardcwang/intel-systemc-compiler-docker:20240509
cd $ICSC_HOME
source setenv.sh
cd build
cmake ../
ctest -R counter
cat designs/examples/counter/sv_out/counter.sv
```

Or download from the [releases page](https://github.com/edwardcwang/intel-systemc-compiler-docker/releases) and extract to `/opt/icsc-home`:

```shell
cat icsc-home-*.tar.gz.part* | tar zxvf -
sudo mv icsc-home /opt/
```

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
