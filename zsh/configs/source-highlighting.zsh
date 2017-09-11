# configures less to use the source-highlighting brew package

if [ -s '/usr/share/source-highlight/src-hilite-lesspipe.sh' ]; then
  export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
  export LESS=" -R "
fi
