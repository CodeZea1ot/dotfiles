# backup <file>: Create a backup copy of a file by appending ".bak" to its name
# Examples:
#   backup config.yaml       -> creates a backup file named config.yaml.bak
#   backup /path/to/data.txt -> creates /path/to/data.txt.bak
# Notes:
#   - Uses 'cp -i' to prompt before overwriting an existing backup.
#   - Safe to run multiple times; you will be prompted if the .bak file already exists.
backup() {
  cp -i "$1" "$1.bak"
}

# mkcd <dir>: Create a directory (including parent directories if needed) and enter it
# Examples:
#   mkcd new_folder        -> creates 'new_folder' and cds into it
#   mkcd a/b/c             -> creates nested directories 'a/b/c' and cds into 'c'
# Usage: pass the directory path you want to create as an argument.
# Notes:
#   - Uses mkdir -p, so it won't fail if intermediate directories exist.
#   - If cd fails for some reason, the function exits without error.
mkcd() {
  mkdir -p "$1" && cd "$1" || return
}

# tsbackup <file>: Copy a file with current timestamp appended
# Example:
#   tsbackup config.yaml -> creates config_2026-02-02_23-50-00.yaml
tsbackup() {
  local file="$1"
  local ext="${file##*.}"
  local base="${file%.*}"
  cp -i "$file" "${base}_$(date '+%Y-%m-%d_%H-%M-%S').$ext"
}

# underscore <file_or_dir>: Replace spaces with underscores
# Example:
#   underscore "My File.txt" -> My_File.txt
#   underscore my\ folder     -> my_folder
underscore() {
  local f="$1"
  local new="${f// /_}"
  mv -i "$f" "$new"
}

# up(n): Go up 'n' directories (default 1)
# Examples:
#   up        -> cd ..
#   up 2      -> cd ../..
#   up 5      -> cd ../../../../..
# Usage: pass the number of levels you want to go up as an argument.
# If no argument is given, it defaults to 1.
up() {
  local n=${1:-1}  # default to 1 if no argument
  local path=""
  for ((i=0;i<n;i++)); do
    path="../$path"
  done
  cd "$path"
}


