# This dependes on tmux pomodoro plus plugin - https://github.com/olimorris/tmux-pomodoro-plus
# E.g.: Requires https://github.com/aaronpowell/tmux-weather

show_pomodoro() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module
  icon="$(  get_tmux_option "@catppuccin_test_icon"  "" )"
  color="$( get_tmux_option "@catppuccin_test_color" "$thm_red" )"
  text="$(  get_tmux_option "@catppuccin_test_text"  "#{pomodoro_status}" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}


