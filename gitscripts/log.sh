function log {
  echo "[info] " $@
}

function checkvar {
  if [ -z "${!1}" ]; then
    log "${1} not set"
    exit 1
  fi
}

function checkvars {
  local var
  for var in ${@}; do
    checkvar ${var}
  done
}
