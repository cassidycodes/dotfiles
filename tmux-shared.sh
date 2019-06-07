# opens 4 windows with 4 panels each

#@params [exit value, default path]
HOMEDIR=$HOME
open_panels () {
  if [ $1 -eq 0 ]; then
    tmux -S /tmp/sharedtmux set-option default-path $2
    tmux -S /tmp/sharedtmux source-file $HOME'/.tmux/dev'
    tmux -S /tmp/sharedtmux set-option default-path $HOME
  fi
}

tmux -S /tmp/sharedtmux -2 attach-session -t hsdev
if [ "$?" -eq 0 ]; then
  exit
fi

cd $HOMEDIR/homestars-www
tmux -S /tmp/sharedtmux set-option default-path #HOMEDIR/homestars-www

#create a session with a shared socket
tmux -S /tmp/sharedtmux new-session -s hsdev -n www -d
open_panels $? $HOMEDIR/homestars-www

#set permissions for shared socket
chmod 777 /tmp/sharedtmux

#create windows
cd $HOMEDIR/api
tmux -S /tmp/sharedtmux set-option default-path $HOMEDIR/api
tmux -S /tmp/sharedtmux new-window  -t hsdev:2 -n "api"
open_panels $? $HOMEDIR/api

cd $HOMEDIR/auth_server
tmux -S /tmp/sharedtmux set-option default-path $HOMEDIR/auth_server
tmux -S /tmp/sharedtmux new-window  -t hsdev:3 -n "auth"
open_panels $? $HOMEDIR/auth_server

tmux -S /tmp/sharedtmux select-window -t api

#Attach to session
tmux -S /tmp/sharedtmux -2 attach-session -t hsdev
