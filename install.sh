#!/bin/zsh

# Base directory for installation purposes. Current directory by default
base_directory="."

# Target directory for stow to deploy configuration (home by default)
target_directory="$HOME"

# Leverage the same file stow uses to filter the packages to install
ignore_list_file=".stow-global-ignore"

# Flag to generate additional logs
verbose=false

# Flat to test the script on a dryrun
dryrun=false

while getopts "vd:t:n" opt; do
  case $opt in
    d) 
      base_directory=$OPTARG
      ;;
    t) 
      target_directory=$OPTARG 
      ;;
    v)
      verbose=true
      ;;
    n) 
      dryrun=true
      ;;
    *)
      echo "Usage: $0 [-v (verbose) -d (base directory) -t (target directory) -n (dry run)]"
      exit 1
      ;;
  esac
done

source ./common.sh

# Function to check if a directory should be ignored
ignore() {
  local dir="$1"
  local pattern
  while read -r pattern; do
    # Skip empty lines or lines that contain only whitespace
    [[ -z "$pattern" || "$pattern" =~ ^[[:space:]]*$ ]] && continue
    
    # Attempt to compile the regular expression before using it
    if [[ "$dir" =~ $pattern ]]; then
      return 0 # Ignore
    fi
  done < "$ignore_list_file"
  return 1 # Do not ignore
}

log "Updating configuration"
log "Checking pakcages from $base_directory"
log "Deploying configuration to $target_directory"

# Check if Homebrew is installed
check_and_install "brew" \
  "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"" \

# Check if GNU Stow is installed
check_and_install "stow" \
  "brew install stow" 

# Process directories with stow
find "$base_directory" -maxdepth 1 -type d | while read -r dir; do
   log "Processing -> $dir"

   if [[ "$dir" == "." ]]; then
    continue
   fi

   dir=${dir#./}
   
   # Ignore the root directory and directories that match the patterns
   if ignore "$dir"; then
     log "Ignoring $dir"
     continue
   fi

  if $dryrun; then
   if [ -f "$dir/install.sh" ]; then
       log "[Dryrun] Running install.sh script inside $dir"
    else
       log "[Dryrun] No install script found under $dir. Assuming manual installation"
   fi
   log "[Dryrun] Stowing $dir"
   log "[Dryrun] Execution - stow -n -d $base_directory -t $target_directory "$dir" -v"
   stow -n "$dir" -d $base_directory -t $target_directory -v 
  else
   if [ -f "$dir/install.sh" ]; then
       log "Running install.sh script inside $dir"
       source "$dir/install.sh"
    else
       log "No install script found under $dir. Assuming manual installation"
   fi
   stow "$dir" -d $base_directory -t $target_directory -v 
  fi 

done


