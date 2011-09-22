#!/bin/sh

arg_repo=${1:-git://github.com/dsouza/dot.git}

bin_ln=/bin/ln
bin_cat=/bin/cat
bin_cp=/bin/cp
bin_rm=/bin/rm
bin_mkdir=/bin/mkdir
bin_chmod=/bin/chmod
bin_env=/usr/bin/env
bin_git=${GIT_BIN:-$(which git)}
bin_find=/usr/bin/find
bin_xmonad=/usr/bin/xmonad
bin_emacs=/usr/bin/emacs
bin_xargs=/usr/bin/xargs

dot_print_info()
{
  printf "%s\n" "$1"
}

dot_print_error()
{
  printf "ERROR - %s\n" "$1"
  exit 1
}

dot_check_binaries()
{
  [ ! -x "$bin_ln" ]  && dot_print_error "ln binary not found"
  [ ! -x "$bin_rm" ]  && dot_print_error "rm binary not found"
  [ ! -x "$bin_chmod" ] && dot_print_error "chmod binary not found"
  [ ! -x "$bin_env" ] && dot_print_error "env binary not found"
  [ ! -x "$bin_git" ] && dot_print_error "git binary not found"
  [ ! -x "$bin_find" ] && dot_print_error "find binary not found"
  [ ! -x "$bin_xargs" ] && dot_print_error "xargs binary not found"
  [ ! -x "$bin_cat" ] && dot_print_error "cat binary not found"
  [ ! -x "$bin_cp" ] && dot_print_error "cp binary not found"
}

dot_mkdir()
{
  local dir=$1

  [ ! -d "$dir" ] && $bin_mkdir "$dir"
}

dot_symlink()
{
  local src=$1
  local dst=$2

  [ -d "$dst" ] && $bin_rm -r -f "$dst"
  [ -e "$src" ] && $bin_ln -s -f -n "$src" "$dst"
}

dot_clone_dot()
{
  dot_print_info "cloning dot into $HOME/.dot"
  if [ -d "$HOME/.dot" ]
  then
    $bin_rm -rf $HOME/.dot
  fi
  $bin_git clone $arg_repo "$HOME/.dot"
}

dot_install()
{
  dot_print_info "installing dot files"

  dot_mkdir   "$HOME/.ssh"
  $bin_cp     "$HOME/.dot/install.sh" "$HOME/.dot/bin/dot-install"
  dot_symlink "$HOME/.dot/dot.ssh/config" "$HOME/.ssh/config"
  dot_symlink "$HOME/.dot/dot.emacs" "$HOME/.emacs"
  dot_symlink "$HOME/.dot/dot.libemacs" "$HOME/.libemacs"
  dot_symlink "$HOME/.dot/dot.viper" "$HOME/.viper"
  dot_symlink "$HOME/.dot/dot.vim" "$HOME/.vim"
  dot_symlink "$HOME/.dot/dot.vimrc" "$HOME/.vimrc"
  dot_symlink "$HOME/.dot/dot.bash_profile" "$HOME/.bash_profile"
  dot_symlink "$HOME/.dot/dot.bashrc" "$HOME/.bashrc"
  dot_symlink "$HOME/.dot/dot.zshrc" "$HOME/.zshrc"
  dot_symlink "$HOME/.dot/dot.conkerorrc" "$HOME/.conkerorrc"
  dot_symlink "$HOME/.dot/dot.gitconfig" "$HOME/.gitconfig"
  dot_symlink "$HOME/.dot/dot.inputrc" "$HOME/.inputrc"
  dot_symlink "$HOME/.dot/dot.screenrc" "$HOME/.screenrc"
  dot_symlink "$HOME/.dot/dot.xinitrc" "$HOME/.xinitrc"
  dot_symlink "$HOME/.dot/dot.xmobarrc" "$HOME/.xmobarrc"
  dot_symlink "$HOME/.dot/dot.xmodmaprc" "$HOME/.xmodmaprc"
  dot_symlink "$HOME/.dot/dot.xmonad" "$HOME/.xmonad"
  dot_symlink "$HOME/.dot/dot.xresourcesrc" "$HOME/.xresourcesrc"
  dot_symlink "$HOME/.dot/dot.mutt" "$HOME/.mutt"
  dot_symlink "$HOME/.dot/dot.email-signature" "$HOME/.email-signature"
  dot_symlink "$HOME/.dot/dot.irssi" "$HOME/.irssi"
}

dot_overlay_merge()
{
  src=$1
  dst=$2

  if [ -f "$src" ]
  then
    dot_print_info "  merging $src into $dst"
    $bin_cat "$src" >>"$dst"
  fi
}

dot_overlay_replace()
{
  src=$1
  dst=$2

  if [ -f "$src" ]
  then
    dot_print_info "  replacing $dst with $src"
    $bin_cp "$src" "$dst"
  fi
}

dot_overlay()
{
  dot_print_info "applying overlay"

  for f in $($bin_find $HOME/.dot -type f)
  do
    rf=${f##$HOME/.dot/}
    dot_overlay_replace "$HOME/.dot.overlay/r/$rf" "$HOME/.dot/$rf"
    dot_overlay_merge "$HOME/.dot.overlay/m/$rf" "$HOME/.dot/$rf"
  done
}

dot_fixperms()
{
  $bin_find $HOME/.dot -type d -exec $bin_chmod 0700 \{\} \;
  $bin_find $HOME/.dot -type f -exec $bin_chmod 0600 \{\} \;
  $bin_find $HOME/.dot/bin -type f -exec $bin_chmod 0700 \{\} \;
}

dot_post_xmonad()
{
  dot_print_info "  recompiling xmonad"
  $bin_xmonad --recompile
}

dot_post_emacs()
{
  dot_print_info "  byte-compiling emacs lisp files"
  $bin_rm -f $HOME/.emacs.elc
  $bin_find $HOME/.dot -name \*.el | $bin_xargs $bin_emacs --user $USER --batch --funcall batch-byte-compile
}

dot_postinst()
{
  dot_fixperms
  [ -x $bin_xmonad ] && dot_post_xmonad
  [ -x $bin_emacs ]  && dot_post_emacs
}

dot_omit_stdout_of()
{
  txt=$1
  cmd=$2
  
  dot_print_info "invoking $txt"
  $cmd 1>/dev/null

  if [ "$?" = "0" ]
  then
    dot_print_info "$txt : ok"
  else
    dot_print_info "$txt : fail"
  fi
}

dot_omit_stderr_of()
{
  txt=$1
  cmd=$2
  
  dot_print_info "invoking $txt"
  $cmd 2>/dev/null

  if [ "$?" = "0" ]
  then
    dot_print_info "$txt : ok"
  else
    dot_print_info "$txt : fail"
  fi
}

dot_check_binaries
dot_omit_stderr_of "git clone" dot_clone_dot
dot_install
dot_overlay
dot_omit_stderr_of "post install" dot_postinst
