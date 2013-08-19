Zaw
===

Loads and configures Zaw from the [zaw][1] project.

Contributors
------------

New features and bug fixes should be submitted to the [zaw][1] project according
to its rules and regulations. This module will be synchronized against it.

Settings
--------

### Case Sensitivity

To enable case-sensitivity for this module only, add the following line to
*zpreztorc*:

    zstyle ':prezto:module:zaw' case-sensitive 'yes'

### Highlighting

    zstyle ':prezto:module:zaw:color' marked 'bg=standout,fg=none'

    zstyle ':prezto:module:zaw:color' matched 'bg=magenta,fg=white,bold'

    zstyle ':prezto:module:zaw:color' selected 'standout'

    zstyle ':prezto:module:zaw:color' title 'fg=yellow,underline'

    zstyle ':prezto:module:zaw' max-lines 15

    zstyle ':filter-select' rotate-list 'yes'

    zstyle ':prezto:module:zaw' extended-search 'no'

More details can be found in the [zaw][1] project's README.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Santiago Suarez Ordoñez](https://github.com/santiycr)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/zsh-users/zaw
[2]: https://github.com/sorin-ionescu/prezto/issues
