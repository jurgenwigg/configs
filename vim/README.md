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

## Tools used in python development

> Before doing any Python development please create `virtual environment` in your path
> with `python<version> -m venv <name of your venv>` command. Just before entering `vim`
> you should activate created environment with `source <name of your venv>/bin/activate`
> and install there required tools `pip install pylint black isort`.
 
- Linters
    - `Pylint` as a main linter
- Formatters
    - `black` as a main general formatter
    - `isort` as a import sorter


