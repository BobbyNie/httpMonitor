
ymd=`date '+%Y%m%d'`;
#取上一分钟时间。 
ihslogfile=443_ssl_access_$ymd.log

echo >$ihslogfile;
while(true); do
    hmColon=`perl -MPOSIX -le 'print strftime "%H:%M:",localtime(time)'`
    cat simulationdata.log |grep "$hmColon" >> $ihslogfile;
    sleep 59;
done;