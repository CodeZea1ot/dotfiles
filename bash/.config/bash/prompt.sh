# Function to get current git branch
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt, single quotes needed to keep git_branch from being stale
export PS1='\u@\h: \w $(git_branch) \$ '
