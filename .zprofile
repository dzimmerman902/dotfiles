# Login-shell environment: Homebrew, Python and SnowSQL.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

typeset -U path PATH
[[ -d /Library/Frameworks/Python.framework/Versions/3.13/bin ]] && path=(/Library/Frameworks/Python.framework/Versions/3.13/bin $path)
[[ -d /Applications/SnowSQL.app/Contents/MacOS ]] && path=(/Applications/SnowSQL.app/Contents/MacOS $path)
export PATH
