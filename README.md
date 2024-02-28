# direnv.fish
Custom hooks for direnv for Fish shell.

## Installation

Install with [Fisher][]:

```console
fisher install martonperei/direnv.fish
```

Specify `DIRENV_WHITELIST_MATCH`
```console
set -gx DIRENV_WHITELIST_MATCH $HOME/Workspace/direnv-dir
```

## Differences from `direnv hook fish`

- Supports directory whitelisting, only running in directories specified with `DIRENV_WHITELIST_MATCH`

[fisher]: https://github.com/jorgebucaran/fisher
