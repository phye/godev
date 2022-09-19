FROM archlinux:base-devel
LABEL description="This docker image is used to setup go dev environment based on ArchLinux"
LABEL maintainer="phye8080@gmail.com"

RUN echo 'Server = http://mirrors.163.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Sy && pacman -S --noconfirm \
    gcc \
    gdb \
    git \
    go \
    vim
RUN rm -rf /var/cache/pacman/pkg/*
RUN echo 'add-auto-load-safe-path /usr/lib/go/src/runtime/runtime-gdb.py' > /root/.gdbinit
RUN mkdir -p /ws 
ENV GOPATH /ws
CMD ["/bin/bash"]
