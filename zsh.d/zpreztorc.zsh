#  vim: set ft=zsh sw=2 tw=0 fdm=marker et :
#
# Sets Prezto options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# ++Sets Prezto options. # General# {{{
    zstyle ':prezto:*:*' case-sensitive 'yes'                         # Set case-sensitivity for completion, history lookup, etc.
    zstyle ':prezto:*:*' color 'yes'                                  # Color output (auto set to 'no' on dumb terminals).
    zstyle ':prezto:load' pmodule-dirs ${ZDOTDIR}/local.d             # Add directories to load prezto modules from
    zstyle ':prezto:load' zmodule complist files zutil terminfo     # Set the Zsh modules to load (man zshmodules).
    zstyle ':prezto:load' zfunction zargs zmv zrecompile \
                          add-zsh-hook down-line-or-beginning-search \
                          up-line-or-beginning-search sticky-note     # Set the Zsh functions to load (man zshcontrib).
# }}}

# Set the Prezto modules to load (browse modules).
# Enabled# {{{
zstyle ':prezto:load' pmodule 'helper' 'spectrum' 'prompt' 'UserPrefs' \
  'environment' 'terminal' 'editor' 'history' 'command-not-found' \
  'directory' 'utility' 'completion' 'archive' 'git' 'ssh' 'docker' \
  'python' 'gpg' 'rsync' 'syntax-highlighting' 'history-substring-search'
# }}}
# disabled# {{{
# 'autosuggestions' 'dnf' 'emacs' 'gnu-utility' 'gpg' ' 'haskell' 'homebrew' 'macports' 'node' 'ocaml' 'osx' 'pacman' 'perl' \
# 'rails' 'ruby' 'screen' 'wakeonlan' 'yum'
# }}}

#  prezto options local preferences {{{
    # zstyle ':prezto:module:gnu-utility' prefix 'g'                    # Set the command prefix on non-GNU systems.
    zstyle ':prezto:module:completion:*:hosts' etc-host-ignores '0.0.0.0' '127.0.0.1' # Set the entries to ignore in static */etc/hosts* for host completion.
    zstyle ':prezto:module:editor' dot-expansion 'yes'                  # Auto convert .... to ../..
    zstyle ':prezto:module:editor' key-bindings 'vi'                    # Set the key mapping style to 'emacs' or 'vi'.
    zstyle ':prezto:module:editor' ps-context 'yes'                     # Allow the zsh prompt context to be shown.
    zstyle ':prezto:module:git:info' verbose 'yes'
    zstyle ':prezto:module:git:status:ignore' submodules 'all'          # Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
    zstyle ':prezto:module:history-substring-search' globbing-flags ''  # Set the search globbing flags.
    zstyle ':prezto:module:prompt' pwd-length 'short'
    zstyle ':prezto:module:prompt' show-return-val 'yes'
    zstyle ':prezto:module:prompt' theme 'sorin'                        # Set the prompt theme to load.
    zstyle ':prezto:module:prompt:sorin' show_host 'yes'
    zstyle ':prezto:module:prompt:sorin' show_user 'yes'
    zstyle ':prezto:module:ssh:load' identities 'id_rsa'                # Set the SSH identities to load into the agent.
    zstyle ':prezto:module:terminal' auto-title 'no'                    # Auto set the tab and window titles.
    zstyle ':prezto:module:tmux:auto-start' local 'no'                 # Auto start a session when Zsh is launched in a local terminal.
    zstyle ':prezto:module:utility' safe-ops 'yes'
    zstyle ':prezto:module:utility:diff' color 'yes'
    zstyle ':prezto:module:utility:ls' color 'yes'
    zstyle ':prezto:module:utility:make' color 'no'
    zstyle ':prezto:module:utility:wdif' color 'yes'
    zstyle ':prezto:module:UserPrefs:syntax-highlighting' theme 'amber'
    zstyle ':prezto:module:UserPrefs:widgets' load 'yes'
    zstyle ':prezto:module:UserPrefs:widgets:autoclose-pairs' enabled 'yes'
  # zstyle ':prezto:module:pacman' frontend 'yaourt'                    # Set the Pacman frontend.
    zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'         # Auto switch the Python virtualenv on directory change.
    zstyle ':prezto:module:python:virtualenv' initialize 'yes'          # Automatically initialize virtualenvwrapper if pre-requisites are met.
  # zstyle ':prezto:module:ruby:chruby' auto-switch 'yes'               # Auto switch the Ruby version on directory change.
  # zstyle ':prezto:module:screen:auto-start' local 'yes'               # Auto start a session when Zsh is launched in a local terminal.
  # zstyle ':prezto:module:screen:auto-start' remote 'yes'              # Auto start a session when Zsh is launched in a SSH connection.
  # zstyle ':prezto:module:terminal' auto-title 'yes'                   # Auto set the tab and window titles.
  # zstyle ':prezto:module:terminal:multiplexer-title' format '%s'      # Set the terminal multiplexer title format.
  # zstyle ':prezto:module:terminal:tab-title' format '%m: %s'          # Set the tab title format.
  # zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'    # Set the window title format.
  # zstyle ':prezto:module:tmux:auto-start' local 'yes'                 # Auto start a session when Zsh is launched in a local terminal.
  zstyle ':prezto:module:tmux:auto-start' remote 'no'                # Auto start a session when Zsh is launched in a SSH connection.
  # zstyle ':prezto:module:tmux:iterm' integrate 'yes'                  # Integrate with iTerm2.
  zstyle ':prezto:module:tmux:session' name 'raspi'                    # Set the default session name:
# }}}
