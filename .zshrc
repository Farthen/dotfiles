# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="farthen"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Comment this out to disable the prompt on updates
DISABLE_UPDATE_PROMPT="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew screen sublime terminalapp rake)

source $ZSH/oh-my-zsh.sh

export LC_ALL="en_US.UTF-8"

# Customize to your needs...
export PATH=/opt/toolchains/gcc-arm-none-eabi-4_9-2014q4/bin:/usr/local/opt/ruby/bin:/opt/local/bin:/opt/local/sbin:$PATH

if [ "$(uname)" == "Darwin" ]; then
	eval `/usr/libexec/path_helper -s`
fi

# ZSH completions installed through homebrew
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist

#TOOLCHAINS=$(find /opt/toolchains -maxdepth 2 -mindepth 2 -type d -name 'bin' -exec printf {}: \;)
#export PATH=${TOOLCHAINS}${PATH}
export PATH=/usr/local/texlive/2015/bin/x86_64-darwin:$PATH

# Set Apple Terminal.app resume directory
if [[ $TERM_PROGRAM == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]] {
  function chpwd {
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
  }

  chpwd
}

EDITOR="subl"
alias rake='nocorrect rake'

export HOMEBREW_INSTALL_BADGE='🍵'
export HOMEBREW_GITHUB_API_TOKEN='3803c3cbad54dbcf47bd5be5536c35e80e60f1b2'

export RUST_SRC_PATH=/Users/farthen/Code/rust/rust-2015-05-15/src
alias cargo='nocorrect cargo'

setopt HIST_IGNORE_SPACE

source /Users/farthen/.iterm2_shell_integration.zsh 2> /dev/null || true
