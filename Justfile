set positional-arguments
alias i := install

# Lists all just targets
default:
  @just --list

# Backs up ~/.config/nvim in a ~/.config/nvim.backup directory
backup:
  @rm -rf ~/.config/nvim.backup
  @mv ~/.config/nvim ~/.config/nvim.backup

# Installs this configuration.
install: backup
  @mv . ~/.config/nvim

# Restore the backup, moving the current ~/.config/nvim to ~/.config/nvim.nots
restore:
  @rm -rf ~/.config/nvim.nots
  @mv ~/.config/nvim ~/.config/nvim.nots
  @mv ~/.config/nvim.backup ~/.config/nvim
