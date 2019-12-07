# workstation

> Development laptop setup

### About

This is a set of Ansible roles that will set up my laptop with the current development stack I use.

I used to use an Ubuntu base now I use an Arch base. Both are represented in this
repo and the submodules it uses, but the Arch configs are much more up to date.

### Bootstrap

To be able to use the Ansible, we first have to setup some prerequisites:

- [`netplan`](https://github.com/CanonicalLtd/netplan) for networking
  - `wpa_supplicant`
  - `networkmanager`
- `python-pip`/`python3-pip` for dependencies

For `netplan` do something like:

```
# touch /etc/netplan/10-blah.yaml
# # write down some config...
# cat /etc/netplan/10-blah.yaml
network:
  version: 2
  renderer: NetworkManager
  wifis:
    all-wlans:
      # useful on a system where you know there is
      # only ever going to be one device
      match: {}
      access-points:
        "Joe's home":
          # mode defaults to "infrastructure" (client)
          password: "s3kr1t"
# netplan apply
```

The bootstrap script will install the necessary dependencies (on Arch anyway)
which can be used directly from an installation:

```
https://git.sr.ht/~roryrjb/workstation/blob/master/bootstrap
```

### Related

- [dotfiles](https://git.sr.ht/~roryrjb/dotfiles)
- [ansible-roles](https://git.sr.ht/~roryrjb/ansible-roles)
