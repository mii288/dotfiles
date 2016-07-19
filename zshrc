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
        PATH=${NVM_DIR:-$HOME/.nvm}/default/bin:$PATH
        MANPATH=${NVM_DIR:-$HOME/.nvm}/default/share/man:$MANPATH
        export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/default/lib/node_modules

        # （以下 Zsh のみ）
        # $NODE_PATH にバージョン番号が含まれていないと `yo doctor` が警告を出す
        # 次のように書くと $NODE_PATH のシンボリックリンクが展開され、警告が出なくなる
        # (Hint: .nvm/default は .nvm/vX.Y.Z へのシンボリックリンク)
        NODE_PATH=${NODE_PATH:A}

        nvm() {
            # まず仮の nvm コマンドを unset
            unset -f nvm
            export NVM_DIR=~/.nvm
            . $(brew --prefix nvm)/nvm.sh

            # 仮の nvm コマンドに渡された引数を本物に受け渡す
            nvm "$@"
        }

        # export PATH=/usr/local/bin:$PATH
        ;;

    *)
    if [ -s /root/nvm/nvm.sh ];
    then
        source /root/nvm/nvm.sh ;
    fi
esac

# Attache tmux
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
  else
    tmux
  fi
fi

