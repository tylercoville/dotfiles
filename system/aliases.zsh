# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(type gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -lh --color"
  alias la='gls -A --color'
else
  alias ls="ls -F --color"
  alias l="ls -lAh --color"
  alias ll="ls -lh --color"
  alias la='ls -A --color'
fi
if $(type bat &>/dev/null)
then
  alias cat='bat'
fi
if $(type prettyping &>/dev/null)
then
  alias ping='prettyping --nolegend'
fi

if $(type htop &>/dev/null)
then
  alias top='sudo htop'
fi

if $(type ncdu &>/dev/null)
then
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
fi

if $(type fzf &>/dev/null)
then
  alias preview="fzf --preview 'bat --color \"always\" {}'"
fi

