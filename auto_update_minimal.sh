TODOYNEEDED=
DAYBREAKNEEDED=
NEEDFRESHTODOY=blah
echo $TODOYNEEDED
echo $DAYBREAKNEEDED
echo $NEEDFRESHTODOY
if [ $TODOYNEEDED ] ; then
    logger -s -p4 "TODOYNEEDED is true"
else
    logger -s -p4 "TODOYNEEDED is false/unset"
fi
if [[ $TODOYNEEDED || $DAYBREAKNEEDED || $NEEDFRESHTODOY ]]  ; then
    logger -s -p4 "At least one true"
else
    logger -s -p4 "All false"
fi
