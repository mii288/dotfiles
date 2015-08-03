# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
set completion-ignore-case on
export TERM=xterm-256color

# スクリプト読み込み
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
export PS1='\[\033[0;32m\]\u\[\033[00m\]:\[\033[0;34m\]\w\[\033[0;31m\]$(__git_ps1)\[\033[00m\] \n\$ '
##############

# alias
alias cdmdkn='cd /var/www/html/mdkn'
alias cdapi='cd /var/www/html/mdkn_api'
