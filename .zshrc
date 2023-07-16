source $HOMEBREW_PREFIX/share/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# oh-my-zsh Plugins
antigen bundle command-not-found
antigen bundle pyenv
antigen bundle python
antigen bundle vscode

# Mac Plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle zshzoo/macos
    antigen bundle digitalraven/omz-homebrew
fi

# ZSH Completeions bundle.
antigen bundle zsh-users/zsh-completions

# Auto Suggestions bundle.
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting bundle. MUST BE LAST BUNDLE
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done
antigen apply

EDITOR="vscode" # Set default editor to VSCode

alias ls="ls -G" # Colorize ls output
alias zshrc="${=EDITOR} ~/.zshrc" # Edit zshrc

eval "$(starship init zsh)"
