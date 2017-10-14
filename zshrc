#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
case ${OSTYPE} in
    darwin*)
        # For nvm
        # PATH=${NVM_DIR:-$HOME/.nvm}/default/bin:$PATH
        # MANPATH=${NVM_DIR:-$HOME/.nvm}/default/share/man:$MANPATH
        # export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/default/lib/node_modules

        # （以下 Zsh のみ）
        # $NODE_PATH にバージョン番号が含まれていないと `yo doctor` が警告を出す
        # 次のように書くと $NODE_PATH のシンボリックリンクが展開され、警告が出なくなる
        # (Hint: .nvm/default は .nvm/vX.Y.Z へのシンボリックリンク)
        # NODE_PATH=${NODE_PATH:A}

        # export NVM_DIR=~/.nvm
        #     . $(brew --prefix nvm)/nvm.sh
        ;;

    linux*)
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm ]
        ;;
esac

# Attache tmux
if [ -x "`which tmux`" ]; then
    if $(tmux has-session); then
        tmux attach
    fi
fi

# For neovim
export XDG_CONFIG_HOME=~/.config