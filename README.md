## jleivaizq's Dotfiles

### Overview

These dotfiles are meticulously crafted to personalize your system. They are designed to be topic-centric, making it easier to manage and deploy configurations across different systems. The project is structured around main areas such as Python, git, system libraries, and more.

### Installation Script Description

The script, written in Zsh, facilitates the management and deployment of configuration files using GNU Stow. It offers flexibility in setting the base and target directories, supports an ignore list file for package filtering, enables verbose mode for detailed logging, and provides a dry run mode for testing without affecting the system.

### Usage

The script supports the following options:

- `-d`: Set the base directory for installation.
- `-t`: Set the target directory for deploying configurations.
- `-v`: Enable verbose mode for detailed logging.
- `-n`: Perform a dry run to test the script without making changes.

### Installation

To install and deploy configurations using the script:

1. Clone the repository:
   ```
   git clone git://github.com/jleivaizq/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   install.sh
   ```

### Dependencies

The script relies on the following dependencies:

- Homebrew for package management.
- GNU Stow for deploying configurations.

### Script Execution

The script ensures the presence of Homebrew and GNU Stow, installs them if needed, deploys configurations using Stow, and executes any
