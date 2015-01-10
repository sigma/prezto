#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Load manually installed pyenv into the shell session.
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
  eval "$(pyenv init -)"

# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH. The
# path can be overridden using PYTHONUSERBASE.
else
  if [[ -n "$PYTHONUSERBASE" ]]; then
    path=($PYTHONUSERBASE/bin $path)
  elif [[ "$OSTYPE" == darwin* ]]; then
    path=($HOME/Library/Python/*/bin(N) $path)
  else
    # This is subject to change.
    path=($HOME/.local/bin $path)
  fi
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

install_v_aliases() {
  alias v=workon
  alias v.deactivate=deactivate
  alias v.mk='mkvirtualenv --no-site-packages'
  alias v.mk_withsitepackages='mkvirtualenv'
  alias v.rm=rmvirtualenv
  alias v.switch=workon
  alias v.add2virtualenv=add2virtualenv
  alias v.cdsitepackages=cdsitepackages
  alias v.cd=cdvirtualenv
  alias v.lssitepackages=lssitepackages
}

# Load virtualenvwrapper into the shell session.
if (( $+commands[pyenv-virtualenvwrapper_lazy] )); then
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  pyenv virtualenvwrapper_lazy
  install_v_aliases
elif (( $+commands[virtualenvwrapper_lazy.sh] )); then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="$HOME/.virtualenvs"

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  source "$commands[virtualenvwrapper.sh]"
  install_v_aliases
fi

#
# Aliases
#

alias py='python'
