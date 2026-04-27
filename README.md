# dotfiles

macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle).

## Quick Start

```bash
git clone https://github.com/AndrewPalet/dotfiles ~/Repos/personal/dotfiles
cd ~/Repos/personal/dotfiles
./bootstrap.sh
```

## What's Included

| Package | Files | Description |
|---------|-------|-------------|
| ghostty | `.config/ghostty/config` | Snazzy theme, Display P3, copy-on-select, block cursor |
| cmux | `.config/cmux/settings.json` | Notification sound, external URL whitelist, sidebar prefs |
| zsh | `.zshrc` | Oh My Zsh (robbyrussell), rbenv, Android SDK paths |
| git | `.gitconfig` | Name and email |

## What's NOT Included (by design)

- **`~/.config/cmux/cmux.json`** — workspace commands with machine-specific project paths. Create per-machine.
- **`~/.ssh/config`** — auto-managed by OrbStack on install.
- **Secrets** — `LINEAR_API_KEY` is read from macOS Keychain at runtime, not stored in dotfiles.

## Brewfile

All apps installed via `brew bundle`:

**Formulae:** gh, git, helm, jq, pre-commit, rbenv, sops, stow, uv, yarn, zplug

**Casks:** 1password-cli, android-studio, claude-code, cmux, notion, obsidian, orbstack, postman, proxyman, reactotron, rectangle, sublime-text

## Adding a New Config

1. Create a stow package directory: `mkdir -p newpkg/.config/newapp`
2. Move your config in: `mv ~/.config/newapp/config newpkg/.config/newapp/config`
3. Add the package name to `PACKAGES` in `bootstrap.sh`
4. Stow it: `stow -t ~ newpkg`
5. Commit and push

## Managing

| Task | Command |
|------|---------|
| Update a config | Edit the file in this repo (symlink reflects instantly) |
| Re-stow after structure changes | `stow --restow <package>` |
| Remove a package's symlinks | `stow -D <package>` |
| Add a new brew package | Add to `Brewfile`, run `brew bundle` |
| Update all brew packages | `brew bundle` |

## License

MIT
