source $HOME/.zsh/init
. "$HOME/.cargo/env"
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin

export FZF_DEFAULT_OPTS='
  --color=fg:#f8f8f0,hl:#66d9ef
  --color=fg+:#f8f8f0,bg+:#1793d0,hl+:#f8f8f0
  --color=info:#f8f8f0,prompt:#f8f8f0,pointer:#f8f8f0
  --color=marker:#1793d0,spinner:#1793d0,header:#1793d0
  --color=border:#cfcfcf
  --border=sharp
  --margin=0,1,1,1
  --preview-window sharp'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
