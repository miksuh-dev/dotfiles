source $HOME/.zsh/init
. "$HOME/.cargo/env"

export FZF_DEFAULT_OPTS='
  --color=fg:#f8f8f0,hl:#66d9ef
  --color=fg+:#f8f8f0,bg+:#1793d0,hl+:#f8f8f0
  --color=info:#f8f8f0,prompt:#f8f8f0,pointer:#f8f8f0
  --color=marker:#1793d0,spinner:#1793d0,header:#1793d0'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
