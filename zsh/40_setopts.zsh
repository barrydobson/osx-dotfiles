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
