LABEL=pve
DATA=""
if [ "$VIRTUAL_ENV" ] ; then
    DATA=$(basename $VIRTUAL_ENV)
fi

if [ $DATA ] ; then
    echo -e "${LABEL}:${DATA}"
fi
