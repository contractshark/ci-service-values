npm() {
  if [[ ($1 == "i" || $1 == "install") && -e yarn.lock ]]; then
    read "REPLY?Use yarn (Y/n)? "
    echo ""
    if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
      if [[ $2 == "--save-dev" ]]; then
        echo "yarn add --dev ${@:3}"
        command yarn add --dev "${@:3}"
        return $?
      elif [[ $2 == "--save" ]]; then
        echo "yarn add ${@:3}"
        command yarn add "${@:3}"
        return $?
      elif [[ $2 != "" ]]; then
        echo "yarn add ${@:2}"
        command yarn add "${@:2}"
        return $?
      else
        command yarn
        return $?
      fi
    fi
  fi

  command npm "$@"
}
