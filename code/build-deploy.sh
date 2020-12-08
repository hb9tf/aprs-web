#!/usr/bin/bash

REPO_URL="https://github.com/hb9tf/aprs-web.git"
REPO_DIR="/tmp/aprs-web"
PROD_DIR="/var/www/ch.hb9tf.aprs"
GIT="git --git-dir=$REPO_DIR/.git --work-tree=$REPO_DIR"

force=0
flag="$1"

case $flag in
    -f|--force)
        force=1
    ;;
#    *)
#        # nothing to do
#    ;;
esac

if [ ! -d "$REPO_DIR" ]; then
    mkdir -p $REPO_DIR
    git clone --recurse-submodules $REPO_URL $REPO_DIR
    force=1
fi

$GIT remote update
$GIT checkout master

LOCAL=$($GIT rev-parse @)
REMOTE=$($GIT rev-parse @{u})

if [[ "$force" -eq "0" && $LOCAL = $REMOTE ]]; then
    echo "Nothing to do for PROD"
else
    if [ ! -d "$PROD_DIR" ]; then
        mkdir -p $PROD_DIR
    fi
    $GIT pull origin master
    hugo --config "$REPO_DIR/config.toml" --source $REPO_DIR --destination $PROD_DIR
fi
