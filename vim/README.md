# VIM jako IDE

Configi i rzeczy potrzebne do zainstalowania i przygotowania VIMa jako IDE.

## Potrzebne rzeczy

Najpierw trzeba się upewnić, że są zainstalowane wszystkie potrzebne rzeczy po stronie systemu:

### Linux

```shell
sudo apt install -y cmake python3.11-dev
```

### MacOs

```shell
brew install cmake
```

## Instalacja konfiguracji

Wystarczy po prostu nadać atrybut wykonywalności dla `install.sh` i go odpalić

```shell
chmod +x install.sh
./install.sh
```

Skrypt zainstaluje wszystko co potrzebne i przeniesie potrzebne pliki w odpowiednie miejsca.
