distribute-files ()
{
  help () {
    echo "Usage: $0 <separator> <files...>"
    echo "Moves files into subdirectories based on the prefix before the separator."
    return 0
  }

  if [ "$#" -eq 0 ]; then
    help
  fi
  # Loop through all arguments to check for --help
  for arg in "$@"; do
      if [[ "$arg" == "--help" || "$arg" == "-h" ]]; then
        help
      fi
  done
  # Ensure at least two arguments: a separator and at least one file
  if [[ "$#" -lt 2 ]]; then
      echo "Usage: $0 <separator> <files...>"
      return 1
  fi

  DIVIDER=$1
  shift

  for file in "$@"; do
      if [[ -f "$file" ]]; then
          prefix="${file%%"$DIVIDER"*}"  # Extract the part before the first underscore (_)
          mkdir -p "$prefix"    # Create directory if it doesn't exist
          mv "$file" "$prefix/" # Move the file
      fi
  done
  return 0
}
