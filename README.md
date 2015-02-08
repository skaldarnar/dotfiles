```

       ██            ██     ████ ██  ██
      ░██           ░██    ░██░ ░░  ░██
      ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
   ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
  ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
 ░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
 ░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
  ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░

 ████▓▓▓▓▓▒▒▒▒░░░░░░

    git            > global git config and aliases
    zsh            > zshell settings, aliases, and custom prompts

 ░░░░░░▒▒▒▒▓▓▓▓▓████
  ```

This configuration file for the zsh will automatically source all `*.zsh` files
located in your dotfiles repository. Be aware of the few naming conventions:

  <tag>/path.zsh        - is loaded first and is expected to set $PATH or similar
  <tag>/completion.zsh  - is loaded last and is expected to setup autocomplete
  <tag>/*.zsh           - any other zsh files get loaded into your environment
