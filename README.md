# A C++ build environment with Docker

What I'm missing from working at Google is a build environment. It just worked. [Blaze][1], the build system providing distributed build was awesome, with few other very convenient tools like version control system it was a pleasure to code.
Blaze was recently open sourced as [Bazel] so now everyone may use it.

Right now I'm challanged with configuring a build environment for myself and I turned my eyes on [Docker]. I would like to be able to easily reproduce build environment on any Linux machine. Right now I'm just installing deps and tools on my dev machine but this approache scales poorly even solely for myself. Additionally any system upgrady may destroy my environemnt by changing a version of library or some tool. Thus, I came with idea:

  1. Provide a Docker container with stable headers and libraries for C++ build.
  2. Provide another container with a tooling.

### Create a data volume container
This container will keep all installed libraries in `/libs/` directory. It allows to share the libs between multiple machines.
```sh
docker create -v /libs --name cpplibs orian/cppenv:v1 /bin/true
```

### Run a container for a purpose of executing commands
The container will be disposed just after you exit bash.
```
docker run --rm -i --volumes-from cpplibs orian/cppenv:v1 /bin/bash
```

### Run a compilation inside a container
```
docker run --rm -i --volumes-from cpplibs -v /home/orian/workspace/cpp/forex/mt4:/src:ro -v /tmp/build:/build orian/cppenv:v1 /bin/bash
```

Helpful resources:
  - [Dev env with Docker][2] at Terse System
  - Data Only Container Madness [link][3]

[1]:https://gradle.org/gradle-team-perspective-on-bazel/
[Bazel]:http://bazel.io/
[Docker]:https://www.docker.com/
[2]:https://tersesystems.com/2013/11/20/building-a-development-environment-with-docker/
[3]:http://container42.com/2014/11/18/data-only-container-madness/