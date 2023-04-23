# VIM as an IDE

Here you will find all files and scripts needed to configure VIM as IDE to python development.

## Requirements

Firstly you need to be sure that all requirements are installed on your system.  

### Linux

```shell
sudo apt install -y cmake python3.11-dev
```

### MacOs

```shell
brew install cmake
```

## Installation and setup

Simply make `install.sh` executable and run it in terminal:

```shell
chmod +x install.sh
./install.sh
```

Script should copy all files in proper places and execute commands to install all
provided plugins in VIM.

