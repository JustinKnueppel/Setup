#! /usr/bin/env bash

sed -i -E 's/path([[:blank:]]*)blue/path\1cyan/' "$HOME/.zprezto/modules/prompt/external/pure/pure.zsh"

sed -i -E 's/prompt:success([[:blank:]]*)magenta/prompt:success\1white/' "$HOME/.zprezto/modules/prompt/external/pure/pure.zsh"

sed -i "s/zstyle ':prezto:module:prompt' theme 'sorin'/zstyle ':prezto:module:prompt' theme 'pure'/" "$HOME/.zprezto/runcoms/zpreztorc"

sed -i "s/# zstyle ':prezto:module:utility' safe-ops 'yes'/zstyle ':prezto:module:utility' safe-ops 'no'/" "$HOME/.zprezto/runcoms/zpreztorc"
