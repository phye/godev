FROM base/archlinux
LABEL description="This docker image is used to setup go dev environment based on ArchLinux"
LABEL maintainer="phye8080@gmail.com"

RUN echo 'Server = http://mirrors.163.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Sy && pacman -S --noconfirm man-db
RUN pacman -Sy && pacman -S --noconfirm vim
RUN pacman -Sy && pacman -S --noconfirm go 
RUN pacman -Sy && pacman -S --noconfirm gcc gdb
RUN echo 'add-auto-load-safe-path /usr/lib/go/src/runtime/runtime-gdb.py' > /root/.gdbinit
