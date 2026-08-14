# ZSH Customization
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Ruby manager
eval "$(rbenv init - zsh)"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# Alias
alias yolo="git push --no-verify --force"
alias gpu="git push --set-upstream origin"
alias gbranch="git branch | sed -n -e 's/^\* \(.*\)/\1/p'"
alias prd="git pull --rebase origin develop && yarn install"
alias rebaseDev="git pull --rebase origin develop && yarn install"
alias rebaseMain="git pull --rebase origin main && yarn install"

# Force blinking block cursor on every prompt (prevents Oh My Zsh from overriding)
precmd() { printf '\e[1 q' }
