# mii288's dotfiles

1. Install [Homebrew](https://brew.sh/)

2. Run

```sh
brew install ghq
ghq get -p mii288/dotfiles && sh ./init.sh
```

3. Setup fish

```sh
sudo cat $(which fish) >> /etc/shells
chsh -s $(which fish)
```
