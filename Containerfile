ARG FEDORA_MAJOR_VERSION=rawhide

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

RUN curl -s -o /etc/yum.repos.d/tailscale.repo https://pkgs.tailscale.com/stable/centos/9/tailscale.repo
RUN dnf group install gnome-desktop base-graphical container-management core fonts hardware-support multimedia networkmanager-submodules printing workstation-product -y

#RUN bash <(curl -sSf https://raw.githubusercontent.com/bshephar/fedora-sb/main/nordvpn-install.sh)

RUN dnf in -y alacritty \
              fedpkg \
              distrobox \
              rust \
              gdb \
              glib \
              krb5-workstation \
              libvirt \
              libvirt-client \
              lld \
              lua5.1-lpeg \
              make \
              neovim \
              pre-commit \
              qemu \
              qemu-kvm \
              ripgrep \
              tailscale \
              tmux \
              virt-install \
              waybar \
              zsh \
              tailscale && \

    dnf clean all && \
    systemctl set-default graphical.target 
