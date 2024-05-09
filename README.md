# Developer Automation Scripts Repository

This repository contains automation scripts for downloading daily usage tools for developers. These scripts are designed to be run in the terminal after cloning the repository. The repository includes scripts for Arch-based, Debian-based, and Alpine-based Linux distributions.

## Usage

Clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/my-scripts.git
cd my-scripts
```
## Arch-based Systems
For Arch-based systems, run the following script:

```bash
cd Arch
./script.sh
```
## Debian-based Systems
For Debian-based systems, run the following script:

```bash
cd Debian
./script.sh
```
## Alpine-based Systems
For Alpine-based systems, run the following script:

```bash
cd Alpine
./alpine_install.sh
```
## For NixOs
For NixOS , run the following script:

**Copy the packages mentioned below ``config.nix `` and paste in your ``configuration.nix`` and then copy the content of ``.nix_bashrc`` to your ``.bashrc`` and then run the following command :**
```bash
  config-nix # to edit the configuration.nix file (mention the packages for installation)
  build-nix # to build the new NixOS image with new packages that were mentioned in the configuration.nix
```

## Requirements
- Bash
- Git
