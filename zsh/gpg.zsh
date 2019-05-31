#!/usr/bin/env zsh

# export GPG_TTY="$(tty)"

# Disabled for OSX in favor of LaunchAgents
# /usr/local/bin/gpgconf --launch gpg-agent
# export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"

export GOPASS_GPG_OPTS='--no-throw-keyids'
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'
