# Ankaios metalayer.
This metalayer provides the recipes for ankaios packages needed to build and integrate its binary in yocto project environment.
It is based on the guildline 

## Quick start
If you already setup a yocto environment do the following if not start here [Yocto Project Quick Build](https://docs.yoctoproject.org/3.1.13/brief-yoctoprojectqs/brief-yoctoprojectqs.html#)


1. Clone the recipes `meta-anakios/recipes-ankaios` to your yocto environent 
2. Add the following dependencies if not yet available
3. Add the following on your `local.conf` file, This prevents bitbake from fetching `rust` and `cargo` from poky rather, it gets the recent version from `meta-rust` layer
```
BBMASK += "poky/meta/recipes-devtools/rust"
BBMASK += "poky/meta/recipes-devtools/cargo"
```
4. Add the following binaries and then build your image

```
IMAGE_INSTALL:append = " \
	ank \
	ank-server \
	ank-agent \
"
```
### Dependencies
This layer depends on
- poky
  - URI: https://git.yoctoproject.org/git/poky
  - Branch: kirkstone
  
- meta-rust
  - URI: https://github.com/meta-rust/meta-rust
  - Branch:
  
- meta-openembedded:
  - URI: https://git.openembedded.org/meta-openembedded
  - Branch: kirkstone
  - Layers:
    -  meta-oe

### Source Code

The project maintains the following source code repositories(temporary):

* https://github.com/mrogonna/ankaios


# Ankaios-recipes from source

## Prerequisites:
Before starting, ensure you have the following:

- Build system: I used  Linux Host PC (Ubuntu 22.04 LTS (64 bit) operating system).
- Yocto Build Essential
- Necessary Yocto Project setup, including poky, bitbake, and meta layers
- cargo installed in you build PC

## Generate recipes for Rust based projects
To generate a Yocto recipe for the Ankaios Rust-based project, Install `cargo bitbake` and then clone the project locally and navigate to the directory containing the `Cargo.toml` file to run `cargo bitbake`. 

### Install cargo-bitbake
`cargo-bitbake` is a subcommand of Cargo. Its primary function is to generate a Yocto recipe that uses meta-rust to build Cargo-based projects for Yocto. It mainly uses the data in your `Cargo.toml` file.

```sh
cargo install --locked cargo-bitbake
```

### Clone Ankaios Source File
```sh
cd ${yocto-directory}/
git clone https://github.com/mrogonna/ankaios
cd ankaios
```


### Generate Recipe
```sh
# Navigate to the Ankaios directory
cd ankaios/

# Run the Bash script to automatically generate the recipe for all the packages
./cargo_bitbake.sh
```

### Generate MD5 and Replace It in the LIC_FILES_CHKSUM Area
```sh
# Generate the MD5 values, navigate to the LICENSE directory
cd ${HOME}/yocto/ankaios
md5sum LICENSE

# Copy the value and input it in the recipe file as follows:
# FIXME: update generateme with the real MD5 of the license file
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
"
```
### Copy the .bb files
Copy the recipes to the appropriate directories 





