#! /usr/bin/env zsh

for rcfile in $(cd "$HOME"/.zprezto/runcoms/ && ls | grep "z"); do
  if [ ! -e "$HOME/.${rcfile}" ]; then
    ln -s "$HOME/.zprezto/runcoms/$rcfile" "$HOME/.${rcfile}"
  fi
done