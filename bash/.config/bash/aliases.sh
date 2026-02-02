alias dotfiles="cd ~/dotfiles"
alias reload="source ~/.bashrc"

# Use eza or exa if available, otherwise fallback to ls
if command -v eza >/dev/null 2>&1; then
    alias ll="eza -alF --git"
    alias la="eza -A"
elif command -v exa >/dev/null 2>&1; then
    alias ll="exa -alF --git"
    alias la="exa -A"
else
    alias ll="ls -alF"
    alias la="ls -A"
fi
