source $HOME/.zsh/init
export GO111MODULE=on

# Files
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# Paths
export PATH="$PATH:/usr/sbin:$HOME/.local/bin"


# TODO Make this loop
[ -d $HOME/.cargo/bin ] && export PATH=$PATH:$HOME/.cargo/bin
[ -d /usr/local/go/bin ] && export PATH=$PATH:/usr/local/go/bin

[ -d $HOME/.npm-global ] && export PATH="$PATH:$HOME/.npm-global"
[ -d $HOME/.npm-global/bin ] && export PATH="$PATH:$HOME/.npm-global/bin"
[ -d /snap/bin ] && export PATH="$PATH:/snap/bin"
[ -d $HOME/.local/share/gem/ruby/3.0.0/bin ] && export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

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
