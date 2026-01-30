# Colors
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
RESET="\[\033[0m\]"

# Function to get current git branch, only when in a repo
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt, single quotes needed to keep git_branch from being stale
export PS1="${BLUE}\u@\h${RESET}: ${YELLOW}\w${RESET} \$(git_branch) \$ "

