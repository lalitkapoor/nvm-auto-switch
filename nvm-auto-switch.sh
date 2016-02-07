if [ "$(command -v nvm)" == "" ]; then
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
  else
    echo "could not find nvm"
  fi
fi

# based on https://github.com/creationix/nvm/issues/603#issuecomment-88617225
nvm_auto_switch() {
  local NVM_RC_VERSION
  local DEFAULT_VERSION
  local REAL_VERSION
  NVM_RC_FILE=`nvm_find_nvmrc`

  if [ "$NVM_RC_FILE"  == "" ]; then
    DEFAULT_VERSION="$(nvm_alias default 2>/dev/null || echo)"
    REAL_VERSION="$(nvm_version $DEFAULT_VERSION)"
  else
    REAL_VERSION=`cat $NVM_RC_FILE`
  fi

  [ "$(nvm_version_path $REAL_VERSION)/bin" == "$NVM_BIN" ] || nvm use "$REAL_VERSION"
}

# based on https://github.com/postmodern/chruby/blob/master/share/chruby/auto.sh
if [[ -n "$BASH_VERSION" ]]; then
  trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && nvm_auto_switch' DEBUG
else
  cd() { builtin cd "$@"; nvm_auto_switch; }
fi
