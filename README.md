# ThatMattCat's Dotfiles

### Installation
WARNING: I've tried to prevent this from overriding existing configurations but double-check the install script before running.

The install.sh script will ask for Git username and email, currently there are references to the location of the script so it shouldn't be moved(to be resolved).

```
cd ~
git clone git@github.com:ThatMattCat/dotfiles.git
cd dotfiles
./install.sh [all,vim,bash]
```


### Info

This is a collection of configurations/aliases/functions/etc for bash and vim. It is not optimized and currently used in a specific Ubuntu 24.04 VM using cloud-init. YMMV on your own systems.

Much of the bash setup was collected from [fotinakis/bashrc](https://github.com/fotinakis/bashrc/tree/master), including the incredible "eternal bash history".

