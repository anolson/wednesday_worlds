#!/bin/sh
set -e

restore_data() {
  if [ ! -f $LITESTREAM_DATA_PATH ]; then
    echo "Restoring litestream data."
    litestream restore -v -if-replica-exists -o $LITESTREAM_DATA_PATH $LITESTREAM_REPLICA_URL
  fi

  # Create symlink to the data path
  ln -nfs $LITESTREAM_DATA_PATH $APP_DATA_PATH
}

remove_symlink() {
  if [ -L "$APP_DATA_PATH" ]; then
    rm -f $APP_DATA_PATH
  fi
}

echo "Installing gems."
bundle check || (bundle install && bundle clean)

if [ $STORAGE_MODE == "local" ]; then
  remove_symlink
else
  restore_data
fi

exec "$@"
