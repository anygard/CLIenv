LABEL=jbs
DATA=$(jobs | wc -l)

if [ $DATA -ne 0 ] ; then
    echo -e "${LABEL}:${DATA}"
fi
