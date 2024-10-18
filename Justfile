set positional-arguments
alias i := install

# Lists all just targets
default:
  @just --list

# Backs up ~/.config/nvim in a ~/.config/nvim.backup directory
backup:
  @rm -rf ~/.config/nvim.backup
  @cp -R ~/.config/nvim ~/.config/nvim.backup

# Installs this configuration.
install:
  @rm -rf ~/.config/nvim
  @mkdir -p ~/.config/nvim
  @cp -R ./* ~/.config/nvim/

# Restore the backup, moving the current ~/.config/nvim to ~/.config/nvim.broken
restore:
  @rm -rf ~/.config/nvim.broken
  @mv ~/.config/nvim ~/.config/nvim.broken
  @mv ~/.config/nvim.backup ~/.config/nvim
