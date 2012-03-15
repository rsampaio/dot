# -*- mode: Shell-script; sh-basic-offset: 2; -*-

source $HOME/.dot/dot.sh_shared

my_bash_prompt()
{
  export PS1="\[$fg_bold_red\]➜ \[$fg_bold_grey\]|\\u@\\H| \[$fg_norm_cyan\]\\w \\n\[$fg_bold_yellow\]\\$\[$nocolors\] "
}

my_bash_history()
{
  export HISTFILE=$HOME/.bash_history
  export HISTFILESIZE=10000
  export HISTSIZE=7500
  export HISTCONTROL=ignoredups:erasedups
  export HISTIGNORE=" *"
  # http://stackoverflow.com/questions/103944/real-time-history-export-amongst-bash-terminal-windows/3055135#3055135
}

my_bash_cd()
{
  local todir=$HOME
  if [ $# -eq 1 ]
  then
    todir=$1
  fi
  builtin pushd "$todir" >/dev/null
}

my_bash_aliases()
{
  alias cd=my_bash_cd
  [ -n "$COLORTERM" ] && { 
    alias ls="$(which ls) --color"
    alias grep="$(which grep) --color"
  }
}

my_bash_options()
{
  shopt -s histappend
  shopt -s extglob
  shopt -s extquote
  shopt -s cdspell
  shopt -s dirspell
  shopt -s globstar
  shopt -s checkjobs
  shopt -s checkwinsize
}

my_ssh_add()
{
  if [ -n "$SSH_AGENT_PID" ]
  then
    $HOME/.dot/bin/cache-pw /bin/sh -c 'for f in $(/usr/bin/find "$HOME/.ssh/" -xtype f); do if /usr/bin/file -L -b "$f" | /bin/grep -q -i "\bprivate key\b"; then key_finger=$(/usr/bin/ssh-keygen -l -f "$f" | /usr/bin/cut -d \  -f2); if ! /usr/bin/ssh-add -l | /bin/grep -q "$key_finger"; then /usr/bin/ssh-add "$f"; fi; fi; done'
  fi
}

[ -z "${PS1}" ] && return
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f "${HOME}/.bashrc.local" ] && source "${HOME}/.bashrc.local"

my_bash_options
my_colors
my_setenv
my_editors
my_aliases
my_encfs
my_loadrvm
my_bash_history
my_bash_prompt
my_bash_aliases
my_ssh_add
