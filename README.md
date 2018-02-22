Purpose
=======
A docker image to enable golang program develop and debug(with gdb) in any OS, whether macOS or Windows, where installing gdb is rather
troublesome.

Explanation
===========
- Choosing ArchLinux(Instead of Alphine or other Debian distro) is simply because personally I like the lightweighted distro with the 
    (almost) most efficient package manager. 

- vim is added for *temporal* modification of source code in the container directly.
- git is added to avoid the git related error if you happens to enter git command in the container (Maybe I will remove it later??).
- Other command line related tools/programs(e.g. tmux, screen .etc) are not installed in the image 

Hint
====
To run gdb properly with this image, please append privilege param to `docker run`:
Do remember to replace the `/gopath/on/host` with the *absolute* `$GOPATH` on your host.

```sh
docker run --privileged --mount type=bind,source=/gopath/on/host,target=/ws -it phye/godev:latest /bin/bash
```

Example
=======
Say that you're developing golang programs in macOS and want to debug your golang binary using gdb, here is typical steps:

1. Write your golang code in macOS under your GOPATH. Let's assume that `algobase` package contains some basic component, while `playground`
directory is the main package which uses `algobase` package, and thus we have the following layout:

```sh
$ echo $GOPATH
/ws/go
$ ls $GOPATH/src/github.com/phye
algobase playground
```

2. Now you need to debug your code in `playground` directory in macOS, all you need to do is:

```sh
$ docker run --privileged --mount type=bind,source=/ws/go,target=/ws -it phye/godev:latest /bin/bash
(container)$ cd /ws/go/src/github.com/phye/playground
(container)$ go build -gcflags "-N -l" sth.go
(container)$ gdb sth
(container gdb) break 33
(container gdb) r # Other gdb commands you like to use during debug
```
