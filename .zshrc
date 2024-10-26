# Add this in your ~/.zshrc -> Paste before any mentions of plugins
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)";
fi

if which go > /dev/null; then
  export PATH=$PATH:$(go env GOPATH)/bin
fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/luke/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/luke/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/luke/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/luke/google-cloud-sdk/completion.zsh.inc'; fi

# Path fix
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

if [[ $(uname) == 'Darwin' ]]; then
    # Add to FPATH
    fpath=( ~/.completions "${fpath[@]}" )

    source $HOMEBREW_PREFIX/share/antigen/antigen.zsh
else
    source ~/antigen.zsh
fi



# Load the oh-my-zsh's library
antigen use oh-my-zsh

# oh-my-zsh Plugins
antigen bundle command-not-found
antigen bundle python
antigen bundle vscode

# Mac Plugins
if [[ $(uname) == 'Darwin' ]]; then
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

EDITOR="code" # Set default editor to VSCode

alias ls="ls -G" # Colorize ls output
alias zshrc="${=EDITOR} ~/.zshrc" # Edit zshrc
alias gha="act --container-architecture linux/amd64 -s GITHUB_TOKEN='$(gh auth token)'"
alias dbtc="dbt debug && dbt clean && dbt deps"
alias gbm="git branch --merged | egrep -v \"(^\*|main|develop)\""
alias gbmd="git branch --merged | egrep -v \"(^\*|main|develop)\" | xargs git branch -d"

# Skip Copy Into on DBT Models
export SKIP_ON_RUN_START=true
export SKIP_ON_RUN_END=true


eval "$(starship init zsh)"
fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
