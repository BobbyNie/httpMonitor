
logdir=$1
outDir=$2
if [ "$logdir" = "" ];
then
    echo "log dir must input as first param, and outDir as second param";
    exit 1
fi;


ymd=`date '+%Y%m%d'`;
#取上一分钟时间。
hmColon=`date  -d "1 minute ago" '+ %H:%M:'`
hm=`date  -d "1 minute ago" '+%H%M'`
outJsonFile=$outDir/$ymd$hm.json
#echo $outJsonFile

ihslogfile=443_ssl_access_$ymd.log
tail -10000 $logdir/$ihslogfile | grep $hmColon |awk '{sum[$1]++}END{print "{";for(i in sum) print "\""i"\":"sum[i];print "yyyyMMddhhmm:'$ymd$hm'}"}' >$outJsonFile
 
cat $outJsonFile