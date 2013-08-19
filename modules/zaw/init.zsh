#
# Integrates zaw into Prezto.
#
# Authors:
#   Santiago Suarez Ordoñez <santiycr@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'editor'

# Source module files.
source "${0:h}/external/zaw.zsh"

#
# Search
#

zstyle -s ':prezto:module:zaw:color' marked 'REPLY' || REPLY='bg=standout,fg=none'
zstyle ':filter-select:highlight' marked "$REPLY"

zstyle -s ':prezto:module:zaw:color' matched 'REPLY' || REPLY='bg=magenta,fg=white,bold'
zstyle ':filter-select:highlight' matched "$REPLY"

zstyle -s ':prezto:module:zaw:color' selected 'REPLY' || REPLY='standout'
zstyle ':filter-select:highlight' selected "$REPLY"

zstyle -s ':prezto:module:zaw:color' title 'REPLY' || REPLY='fg=yellow,underline'
zstyle ':filter-select:highlight' title "$REPLY"

zstyle -s ':prezto:module:zaw' max-lines 'REPLY' || REPLY=15
zstyle ':filter-select' max-lines "$REPLY"

zstyle -b ':filter-select' rotate-list 'REPLY' || REPLY='yes'
zstyle ':filter-select' rotate-list "$REPLY"

zstyle -b ':prezto:module:zaw' extended-search 'REPLY' || REPLY='no'
zstyle ':filter-select' extended-search "$REPLY"

if ! zstyle -t ':prezto:module:zaw' case-sensitive; then
  zstyle ':filter-select' case-insensitive 'yes'
fi

if ! zstyle -t ':prezto:module:zaw' color; then
  for style in selected marked matched title; do
    zstyle -d ':filter-select:highlight' "$style"
  done
fi

#
# Key Bindings
#

if [[ -n "$key_info" ]]; then
  # Emacs
  bindkey -M emacs "$key_info[Control]R" zaw-history
  bindkey -M emacs "$key_info[Control]S" zaw-history

  # Vi
  bindkey -M vicmd "/" zaw-history
  bindkey -M vicmd "?" zaw-history
fi

