#!/bin/zsh

# Function to print log messages when verbose mode is enabled include time on each line
log() {
  if $verbose; then
    echo "$(date) - $1"
  fi
}


# General function to check if a command is installed, and install it if it's not
check_and_install() {
  local cmd="$1"
  local install_cmd="$2"

  if command -v "$cmd" >/dev/null 2>&1; then
    log "$cmd is already installed."
    return
  fi

  log "$cmd is not installed. Installing $cmd..."
  eval "$install_cmd"

  if [ $? -eq 0 ]; then
    log "$cmd installed successfully."
  else
    log "Failed to install $cmd."
    exit 1
  fi
}

