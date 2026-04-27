#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> macOS Dotfiles Bootstrap"

# 1. Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. Install packages from Brewfile
echo "==> Running brew bundle..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# 3. Install Oh My Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 4. Configure git email (per-machine, not stored in repo)
if [ ! -f "$HOME/.gitconfig-work" ]; then
  read -p "Work git email (for ~/Repos/): " WORK_EMAIL
  printf "[user]\n\temail = %s\n" "$WORK_EMAIL" > "$HOME/.gitconfig-work"
fi
if [ ! -f "$HOME/.gitconfig-personal" ]; then
  read -p "Personal git email (for ~/personal/, leave blank to skip): " PERSONAL_EMAIL
  if [ -n "$PERSONAL_EMAIL" ]; then
    printf "[user]\n\temail = %s\n" "$PERSONAL_EMAIL" > "$HOME/.gitconfig-personal"
  fi
fi

# 5. Stow all config packages

echo "==> Stowing dotfiles..."
PACKAGES=(ghostty cmux zsh git)
for pkg in "${PACKAGES[@]}"; do
  echo "  Stowing $pkg..."
  stow -d "$DOTFILES_DIR" -t "$HOME" --adopt "$pkg"
done

# Restore repo versions in case --adopt pulled in divergent files
git -C "$DOTFILES_DIR" checkout .

# 6. Set up Volta (adds PATH to .zshenv)
if command -v volta &>/dev/null; then
  echo "==> Setting up Volta..."
  volta setup 2>/dev/null || true
fi

# 7. Install cmux-ultimate plugin
if command -v claude &>/dev/null; then
  echo "==> Installing cmux-ultimate plugin..."
  claude plugin marketplace add AndrewPalet/cmux-ultimate 2>/dev/null || true
  claude plugin install cmux-ultimate 2>/dev/null || true
fi

# 8. Reminders
echo ""
echo "==> Done! Post-setup reminders:"
echo "  1. Add LINEAR_API_KEY to Keychain:"
echo "     security add-generic-password -a \"\$USER\" -s LINEAR_API_KEY -w '<your-key>'"
echo "  2. Create ~/.config/cmux/cmux.json with your workspace commands"
echo "  3. Open a new terminal to pick up .zshrc changes"
echo "  4. Run 'rbenv install <version>' for your Ruby version"
