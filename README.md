# waggle-nspawn

Experimenting with bootstrapping a Waggle system for use with systemd-nspawn.

## Dependencies

This is currently only supported on a Debian like Linux system. It uses `debootstrap`
and `systemd-container` to build and run the container. To install these, run:

```sh
apt-get install debootstrap systemd-container
```

## Initial Setup

The `bootstrap` command will run `debootstrap` to setup a minimal Debian stable
environment in `basedir` and install some base packages and configuration.

```sh
./bootstrap basedir
```

## Running

The `run` command uses `systemd-nspawn`

```sh
./run basedir
```
