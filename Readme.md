Purpose
=======
A docker image to enable golang program develop and debug(with gdb) in any OS, whether macOS or Windows, where installing gdb is rather
troublesome.

Explanation
===========
- Choosing ArchLinux is simply because I like the lightweighted distro with the (almost) most efficient package manager. 

Hint
====
To run gdb properly with this image, please append privilege param to `docker run`:

```sh
docker run --privileged -it godev
```
