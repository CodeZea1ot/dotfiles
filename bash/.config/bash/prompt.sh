# Function to get current git branch
git_branch() {
  # Only show branch if inside a git repo
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    echo "($branch)"
  fi
}

# Prompt
export PS1="\u@\h: \w $(git_branch) \$ "
