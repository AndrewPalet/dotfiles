# ZSH Customization
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# Ruby manager
eval "$(rbenv init - zsh)"

# API keys (macOS Keychain)
export LINEAR_API_KEY=$(security find-generic-password -a "$USER" -s "LINEAR_API_KEY" -w)

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# Force blinking block cursor on every prompt (prevents Oh My Zsh from overriding)
precmd() { printf '\e[1 q' }
