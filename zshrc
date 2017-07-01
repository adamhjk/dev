export TERM=xterm-256color
export ZPLUG_REPOS=PKG_PREFIX/repos
source PKG_PREFIX/zplug/init.zsh

#source ~/.fzf.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug 'ytet5uy4/fzf-widgets'
zplug 'jreese/zsh-titles'
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "joel-porquet/zsh-dircolors-solarized"
# zplug "bobsoppe/zsh-ssh-agent", use:ssh-agent.zsh, from:github

if ! zplug check --verbose; then
  zplug install
fi

zplug load

export KEYTIMEOUT=1
bindkey -v
bindkey -M vicmd '/' vi-history-search-backward

export EDITOR=nvim
export VISUAL=nvim
alias ls='ls --color=auto'

# no c-s/c-q output freezing
setopt noflowcontrol
# allow expansion in prompts
setopt prompt_subst
# this is default, but set for share_history
setopt append_history
setopt share_history
# save each command's beginning timestamp and the duration to the history file
setopt extended_history
# display PID when suspending processes as well
setopt longlistjobs
# try to avoid the 'zsh: no matches found...'
setopt nonomatch
# report the status of backgrounds jobs immediately
setopt notify
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all
# not just at the end
setopt completeinword
# use zsh style word splitting
setopt noshwordsplit
# allow use of comments in interactive code
setopt interactivecomments

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# if zplug check 'ytet5uy4/fzf-widgets'; then
#   # Map widgets to key
#   bindkey '^@'  fzf-select-widget
#   bindkey '^@.' fzf-edit-dotfiles
#   bindkey '^J' fzf-change-directory
#   bindkey '^N' fzf-edit-files
#   bindkey '^@k' fzf-kill-processes
#   bindkey '^S' fzf-exec-ssh
#   bindkey '^\'  fzf-change-recent-directory
#   bindkey '^r'  fzf-insert-history
#   bindkey '^xf' fzf-insert-files
#   bindkey '^xd' fzf-insert-directory
# 
#   ## Git
#   bindkey '^@g'  fzf-select-git-widget
#   bindkey '^@ga' fzf-git-add-files
#   bindkey '^@gc' fzf-git-change-repository
# 
#   # GitHub
#   bindkey '^@h'  fzf-select-github-widget
#   bindkey '^@hs' fzf-github-show-issue
#   bindkey '^@hc' fzf-github-close-issue
# 
#   ## Docker
#   bindkey '^@d'  fzf-select-docker-widget
#   bindkey '^@dc' fzf-docker-remove-containers
#   bindkey '^@di' fzf-docker-remove-images
#   bindkey '^@dv' fzf-docker-remove-volumes
# 
#   # Enable Exact-match by fzf-insert-history
#   FZF_WIDGET_OPTS[insert-history]='--exact'
# 
#   # Start fzf in a tmux pane
#   FZF_WIDGET_TMUX=1
# fi
