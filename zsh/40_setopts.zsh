# Spell-check commands
setopt correct
# Spell-check all arguments
setopt correct_all

# Sort brace expansions
setopt brace_ccl

# Print double single-quotes as single-quote
setopt rc_quotes

# Use tee and cat for multiple redirections
setopt multios

# Remove unnecessary trailing slash
setopt auto_remove_slash

# Disable beeps
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# Expand =command to full path
setopt equals

# Search paths even if they include slashes
setopt path_dirs

# Output exit status except zero
setopt print_exit_value

# Confirm when executing 'rm *'
setopt rm_star_wait

# Notify immediately when terminating jobs
setopt notify
# Print long-format job notifications
setopt long_list_jobs
# Resume existing job if command is run again
setopt auto_resume

# Ignore case when globbing
setopt no_case_glob
# Allow '*, ~, ^' when globbing
setopt extended_glob
# Append slash to directory when globbing
setopt mark_dirs

# Notify when mail arrives
setopt mail_warning

# Don't record command to history if duplicate of previous
setopt hist_ignore_dups
# Don't record any duplicate commands to history
setopt hist_ignore_all_dups
setopt hist_save_nodups
# Expire duplicate command first when trimming history
setopt hist_expire_dups_first
# Don't display duplicates when searching
setopt hist_find_no_dups
# Shere history
setopt share_history
# Remove extra blanks when adding to history
setopt hist_reduce_blanks
# Write to history immediately
setopt inc_append_history
# Remove history commands from history
setopt hist_no_store
# Remove functions from history
setopt hist_no_functions
# Record start and end time to history
setopt extended_history
# Remove commands with leading space from history
setopt hist_ignore_space
# Append instead of replace history
setopt append_history
# Expand history and reload the line
setopt hist_verify

# Automatically change to given directory
setopt auto_cd

# Automatically use menu completion
setopt auto_menu

setopt auto_param_keys
setopt auto_param_slash

setopt auto_pushd
setopt complete_in_word
setopt globdots
setopt interactive_comments
setopt list_types
setopt magic_equal_subst
