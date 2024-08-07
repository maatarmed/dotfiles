# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ubuntu zsh-autosuggestions  zsh-syntax-highlighting)



source $ZSH/oh-my-zsh.sh

# User configuration
source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GITUSER="maatarmed"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export SECOND_BRAIN="$GHREPOS/ZeeVault"
export EJ="$REPOS/github.com/eyesjapan"
export ALAN="$EJ/alan-pd-ml"
export TFAM="$REPOS/PhD_Thesis/source_code/TFAM"

# if path does not exist, create it
if [ ! -d "$REPOS" ]; then
  mkdir -p $REPOS
fi
if [ ! -d "$GHREPOS" ]; then
  mkdir -p $GHREPOS
fi
if [ ! -d "$EJ" ]; then
  mkdir -p $EJ
fi
#second brain
if [ ! -d "$SECOND_BRAIN" ]; then
  mkdir -p $SECOND_BRAIN
fi
# alan
if [ ! -d "$ALAN" ]; then
  mkdir -p $ALAN
  # git clone git@github.com:eyesjapan/alan-pd-ml.git $ALAN
fi
# i3
if [ ! -d "~/.config/i3/" ]; then
  mkdir -p ~/.config/i3/
fi
############# PATH #############
PATH="${PATH:+${PATH}:}"$SCRIPTS"" # appending scripts to path
if [ -d "$HOME/anaconda3/" ]; then
  PATH="$HOME/anaconda3/bin:$PATH"
fi
if [ -d "$HOME/miniconda3/" ]; then
  PATH="$HOME/miniconda3/bin:$PATH"
fi
# PATH="$HOME/anaconda3/bin:$PATH"
# PATH="$HOME/miniconda3/bin:$PATH" # adding miniconda to path
export PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
############ Aliases ############
# CD
alias v=nvim
alias ..="cd .."
alias scripts="cd $SCRIPTS"
alias repos="cd $REPOS"
alias ghrepos="cd $GHREPOS"
alias dot="cd $DOTFILES"
alias alan="cd $ALAN"
alias sb="cd \$SECOND_BRAIN"
alias lab="cd $REPOS/PhD_Thesis/source_code/floorplan/Nash_emulator/NASH_py"
alias tfam="cd $TFAM"
# ls
alias ll="ls -la"
alias la="ls -lathr"
# finds all files recursively and sorts by last modification, ignore hidden files
alias last='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias t='tmux'

# git
alias gp="git pull"
alias gs="git status"
alias lg="lazygit"
alias gc="git commit"

#sourcing
alias szr='source ~/.zshrc'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/maatar/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/maatar/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/maatar/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/maatar/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/maatar/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/maatar/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/maatar/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/maatar/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# setxkbmap us
