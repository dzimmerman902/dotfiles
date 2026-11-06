# Log in and select a profile for subsequent commands in this shell.
aws-sso() {
  if [[ $# -ne 1 || -z "$1" ]]; then
    print -u2 -- 'Usage: aws-sso <profile-name>'
    return 1
  fi

  aws sso login --profile "$1" || return $?
  export AWS_PROFILE="$1"
  print -r -- "AWS_PROFILE set to: $AWS_PROFILE"
}
