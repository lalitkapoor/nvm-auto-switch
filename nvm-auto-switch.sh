if [ "$(command -v nvm)" == "" ]; then
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
  else
    echo "could not find nvm"
  fi
fi

# based on https://github.com/creationix/nvm/issues/603#issuecomment-88617225
nvm_auto_switch() {
  local NVM_RC_FILE
  local DEFAULT_VERSION
  local NVM_VERSION
  NVM_RC_FILE=`nvm_find_nvmrc`

  if [ "$NVM_RC_FILE"  == "" ]; then
    DEFAULT_VERSION="$(nvm_alias default 2>/dev/null || echo)"
    NVM_VERSION="$(nvm_version $DEFAULT_VERSION)"
  else
    NVM_VERSION=`cat $NVM_RC_FILE`
  fi

  [ "$(nvm_version_path $NVM_VERSION)/bin" == "$NVM_BIN" ] || nvm use "$NVM_VERSION"
}

cd() { builtin cd "$@"; nvm_auto_switch; }
