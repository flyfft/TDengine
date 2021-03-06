#!/bin/bash

DATA_DIR=/mnt/root/testdata
NUM_LOOP=5

function printTo {
  if $verbose ; then
    echo $1
  fi
}

TDTESTQ2OUT=tdengineTestQ2.out

function runTest {
  totalCount10=0
  totalCount20=0
  totalCount30=0
  totalCount40=0
  totalCount50=0
  totalCount60=0
  totalCount70=0
  totalCount80=0
  totalCount90=0
  totalCount100=0

  totalAvg10=0
  totalAvg20=0
  totalAvg30=0
  totalAvg40=0
  totalAvg50=0
  totalAvg60=0
  totalAvg70=0
  totalAvg80=0
  totalAvg90=0
  totalAvg100=0

  totalSum10=0
  totalSum20=0
  totalSum30=0
  totalSum40=0
  totalSum50=0
  totalSum60=0
  totalSum70=0
  totalSum80=0
  totalSum90=0
  totalSum100=0

  totalMax10=0
  totalMax20=0
  totalMax30=0
  totalMax40=0
  totalMax50=0
  totalMax60=0
  totalMax70=0
  totalMax80=0
  totalMax90=0
  totalMax100=0

  totalMin10=0
  totalMin20=0
  totalMin30=0
  totalMin40=0
  totalMin50=0
  totalMin60=0
  totalMin70=0
  totalMin80=0
  totalMin90=0
  totalMin100=0

  totalSpread10=0
  totalSpread20=0
  totalSpread30=0
  totalSpread40=0
  totalSpread50=0
  totalSpread60=0
  totalSpread70=0
  totalSpread80=0
  totalSpread90=0
  totalSpread100=0

  for i in `seq 1 $NUM_LOOP`; do
    printTo "loop i:$i, $TDTEST_DIR/tdengineTest \
	      -sql q2.txt"
    restartTaosd
    $TDTEST_DIR/tdengineTest \
      -sql $TDTEST_DIR/q2.txt > $TDTESTQ2OUT

    Count10=`cat $TDTESTQ2OUT | grep "count" | grep "devgroup<10;" | awk '{print $3}'`
    totalCount10=`echo "scale=4; $totalCount10 + $Count10" | bc`
    Count20=`cat $TDTESTQ2OUT | grep "count" | grep "devgroup<20;" | awk '{print $3}'`
    totalCount20=`echo "scale=4; $totalCount20 + $Count20" | bc`
    Count30=`cat $TDTESTQ2OUT | grep count | grep "devgroup<30;" | awk '{print $3}'`
    totalCount30=`echo "scale=4; $totalCount30 + $Count30" | bc`
    Count40=`cat $TDTESTQ2OUT | grep count | grep "devgroup<40;" | awk '{print $3}'`
    totalCount40=`echo "scale=4; $totalCount40 + $Count40" | bc`
    Count50=`cat $TDTESTQ2OUT | grep count | grep "devgroup<50;" | awk '{print $3}'`
    totalCount50=`echo "scale=4; $totalCount50 + $Count50" | bc`
    Count60=`cat $TDTESTQ2OUT | grep count | grep "devgroup<60;" | awk '{print $3}'`
    totalCount60=`echo "scale=4; $totalCount60 + $Count60" | bc`
    Count70=`cat $TDTESTQ2OUT | grep count | grep "devgroup<70;" | awk '{print $3}'`
    totalCount70=`echo "scale=4; $totalCount70 + $Count70" | bc`
    Count80=`cat $TDTESTQ2OUT | grep count | grep "devgroup<80;" | awk '{print $3}'`
    totalCount80=`echo "scale=4; $totalCount80 + $Count80" | bc`
    Count90=`cat $TDTESTQ2OUT | grep count | grep "devgroup<90;" | awk '{print $3}'`
    totalCount90=`echo "scale=4; $totalCount90 + $Count90" | bc`
    Count100=`cat $TDTESTQ2OUT | grep count | grep "db.devices;" | awk '{print $3}'`
    totalCount100=`echo "scale=4; $totalCount100 + $Count100" | bc`

    Avg10=`cat $TDTESTQ2OUT | grep "avg" | grep "devgroup<10;" | awk '{print $3}'`
    totalAvg10=`echo "scale=4; $totalAvg10 + $Avg10" | bc`
    Avg20=`cat $TDTESTQ2OUT | grep "avg" | grep "devgroup<20;" | awk '{print $3}'`
    totalAvg20=`echo "scale=4; $totalAvg20 + $Avg20" | bc`
    Avg30=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<30;" | awk '{print $3}'`
    totalAvg30=`echo "scale=4; $totalAvg30 + $Avg30" | bc`
    Avg40=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<40;" | awk '{print $3}'`
    totalAvg40=`echo "scale=4; $totalAvg40 + $Avg40" | bc`
    Avg50=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<50;" | awk '{print $3}'`
    totalAvg50=`echo "scale=4; $totalAvg50 + $Avg50" | bc`
    Avg60=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<60;" | awk '{print $3}'`
    totalAvg60=`echo "scale=4; $totalAvg60 + $Avg60" | bc`
    Avg70=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<70;" | awk '{print $3}'`
    totalAvg70=`echo "scale=4; $totalAvg70 + $Avg70" | bc`
    Avg80=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<80;" | awk '{print $3}'`
    totalAvg80=`echo "scale=4; $totalAvg80 + $Avg80" | bc`
    Avg90=`cat $TDTESTQ2OUT | grep avg | grep "devgroup<90;" | awk '{print $3}'`
    totalAvg90=`echo "scale=4; $totalAvg90 + $Avg90" | bc`
    Avg100=`cat $TDTESTQ2OUT | grep avg | grep "db.devices;" | awk '{print $3}'`
    totalAvg100=`echo "scale=4; $totalAvg100 + $Avg100" | bc`

    Sum10=`cat $TDTESTQ2OUT | grep "sum" | grep "devgroup<10;" | awk '{print $3}'`
    totalSum10=`echo "scale=4; $totalSum10 + $Sum10" | bc`
    Sum20=`cat $TDTESTQ2OUT | grep "sum" | grep "devgroup<20;" | awk '{print $3}'`
    totalSum20=`echo "scale=4; $totalSum20 + $Sum20" | bc`
    Sum30=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<30;" | awk '{print $3}'`
    totalSum30=`echo "scale=4; $totalSum30 + $Sum30" | bc`
    Sum40=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<40;" | awk '{print $3}'`
    totalSum40=`echo "scale=4; $totalSum40 + $Sum40" | bc`
    Sum50=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<50;" | awk '{print $3}'`
    totalSum50=`echo "scale=4; $totalSum50 + $Sum50" | bc`
    Sum60=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<60;" | awk '{print $3}'`
    totalSum60=`echo "scale=4; $totalSum60 + $Sum60" | bc`
    Sum70=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<70;" | awk '{print $3}'`
    totalSum70=`echo "scale=4; $totalSum70 + $Sum70" | bc`
    Sum80=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<80;" | awk '{print $3}'`
    totalSum80=`echo "scale=4; $totalSum80 + $Sum80" | bc`
    Sum90=`cat $TDTESTQ2OUT | grep sum | grep "devgroup<90;" | awk '{print $3}'`
    totalSum90=`echo "scale=4; $totalSum90 + $Sum90" | bc`
    Sum100=`cat $TDTESTQ2OUT | grep sum | grep "db.devices;" | awk '{print $3}'`
    totalSum100=`echo "scale=4; $totalSum100 + $Sum100" | bc`

    Max10=`cat $TDTESTQ2OUT | grep "max" | grep "devgroup<10;" | awk '{print $3}'`
    totalMax10=`echo "scale=4; $totalMax10 + $Max10" | bc`
    Max20=`cat $TDTESTQ2OUT | grep "max" | grep "devgroup<20;" | awk '{print $3}'`
    totalMax20=`echo "scale=4; $totalMax20 + $Max20" | bc`
    Max30=`cat $TDTESTQ2OUT | grep max | grep "devgroup<30;" | awk '{print $3}'`
    totalMax30=`echo "scale=4; $totalMax30 + $Max30" | bc`
    Max40=`cat $TDTESTQ2OUT | grep max | grep "devgroup<40;" | awk '{print $3}'`
    totalMax40=`echo "scale=4; $totalMax40 + $Max40" | bc`
    Max50=`cat $TDTESTQ2OUT | grep max | grep "devgroup<50;" | awk '{print $3}'`
    totalMax50=`echo "scale=4; $totalMax50 + $Max50" | bc`
    Max60=`cat $TDTESTQ2OUT | grep max | grep "devgroup<60;" | awk '{print $3}'`
    totalMax60=`echo "scale=4; $totalMax60 + $Max60" | bc`
    Max70=`cat $TDTESTQ2OUT | grep max | grep "devgroup<70;" | awk '{print $3}'`
    totalMax70=`echo "scale=4; $totalMax70 + $Max70" | bc`
    Max80=`cat $TDTESTQ2OUT | grep max | grep "devgroup<80;" | awk '{print $3}'`
    totalMax80=`echo "scale=4; $totalMax80 + $Max80" | bc`
    Max90=`cat $TDTESTQ2OUT | grep max | grep "devgroup<90;" | awk '{print $3}'`
    totalMax90=`echo "scale=4; $totalMax90 + $Max90" | bc`
    Max100=`cat $TDTESTQ2OUT | grep max | grep "db.devices;" | awk '{print $3}'`
    totalMax100=`echo "scale=4; $totalMax100 + $Max100" | bc`

    Min10=`cat $TDTESTQ2OUT | grep "min" | grep "devgroup<10;" | awk '{print $3}'`
    totalMin10=`echo "scale=4; $totalMin10 + $Min10" | bc`
    Min20=`cat $TDTESTQ2OUT | grep "min" | grep "devgroup<20;" | awk '{print $3}'`
    totalMin20=`echo "scale=4; $totalMin20 + $Min20" | bc`
    Min30=`cat $TDTESTQ2OUT | grep min | grep "devgroup<30;" | awk '{print $3}'`
    totalMin30=`echo "scale=4; $totalMin30 + $Min30" | bc`
    Min40=`cat $TDTESTQ2OUT | grep min | grep "devgroup<40;" | awk '{print $3}'`
    totalMin40=`echo "scale=4; $totalMin40 + $Min40" | bc`
    Min50=`cat $TDTESTQ2OUT | grep min | grep "devgroup<50;" | awk '{print $3}'`
    totalMin50=`echo "scale=4; $totalMin50 + $Min50" | bc`
    Min60=`cat $TDTESTQ2OUT | grep min | grep "devgroup<60;" | awk '{print $3}'`
    totalMin60=`echo "scale=4; $totalMin60 + $Min60" | bc`
    Min70=`cat $TDTESTQ2OUT | grep min | grep "devgroup<70;" | awk '{print $3}'`
    totalMin70=`echo "scale=4; $totalMin70 + $Min70" | bc`
    Min80=`cat $TDTESTQ2OUT | grep min | grep "devgroup<80;" | awk '{print $3}'`
    totalMin80=`echo "scale=4; $totalMin80 + $Min80" | bc`
    Min90=`cat $TDTESTQ2OUT | grep min | grep "devgroup<90;" | awk '{print $3}'`
    totalMin90=`echo "scale=4; $totalMin90 + $Min90" | bc`
    Min100=`cat $TDTESTQ2OUT | grep min | grep "db.devices;" | awk '{print $3}'`
    totalMin100=`echo "scale=4; $totalMin100 + $Min100" | bc`

    Spread10=`cat $TDTESTQ2OUT | grep "spread" | grep "devgroup<10;" | awk '{print $3}'`
    totalSpread10=`echo "scale=4; $totalSpread10 + $Spread10" | bc`
    Spread20=`cat $TDTESTQ2OUT | grep "spread" | grep "devgroup<20;" | awk '{print $3}'`
    totalSpread20=`echo "scale=4; $totalSpread20 + $Spread20" | bc`
    Spread30=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<30;" | awk '{print $3}'`
    totalSpread30=`echo "scale=4; $totalSpread30 + $Spread30" | bc`
    Spread40=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<40;" | awk '{print $3}'`
    totalSpread40=`echo "scale=4; $totalSpread40 + $Spread40" | bc`
    Spread50=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<50;" | awk '{print $3}'`
    totalSpread50=`echo "scale=4; $totalSpread50 + $Spread50" | bc`
    Spread60=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<60;" | awk '{print $3}'`
    totalSpread60=`echo "scale=4; $totalSpread60 + $Spread60" | bc`
    Spread70=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<70;" | awk '{print $3}'`
    totalSpread70=`echo "scale=4; $totalSpread70 + $Spread70" | bc`
    Spread80=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<80;" | awk '{print $3}'`
    totalSpread80=`echo "scale=4; $totalSpread80 + $Spread80" | bc`
    Spread90=`cat $TDTESTQ2OUT | grep spread | grep "devgroup<90;" | awk '{print $3}'`
    totalSpread90=`echo "scale=4; $totalSpread90 + $Spread90" | bc`
    Spread100=`cat $TDTESTQ2OUT | grep spread | grep "db.devices;" | awk '{print $3}'`
    totalSpread100=`echo "scale=4; $totalSpread100 + $Spread100" | bc`

  done
  avgCount10=`echo "scale=4; x = $totalCount10 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount20=`echo "scale=4; x = $totalCount20 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount30=`echo "scale=4; x = $totalCount30 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount40=`echo "scale=4; x = $totalCount40 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount50=`echo "scale=4; x = $totalCount50 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount60=`echo "scale=4; x = $totalCount60 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount70=`echo "scale=4; x = $totalCount70 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount80=`echo "scale=4; x = $totalCount80 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount90=`echo "scale=4; x = $totalCount90 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgCount100=`echo "scale=4; x = $totalCount100 / $NUM_LOOP; if(x<1) print 0; x" | bc`

  avgAvg10=`echo "scale=4; x = $totalAvg10 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg20=`echo "scale=4; x = $totalAvg20 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg30=`echo "scale=4; x = $totalAvg30 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg40=`echo "scale=4; x = $totalAvg40 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg50=`echo "scale=4; x = $totalAvg50 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg60=`echo "scale=4; x = $totalAvg60 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg70=`echo "scale=4; x = $totalAvg70 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg80=`echo "scale=4; x = $totalAvg80 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg90=`echo "scale=4; x = $totalAvg90 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgAvg100=`echo "scale=4; x = $totalAvg100 / $NUM_LOOP; if(x<1) print 0; x" | bc`

  avgSum10=`echo "scale=4; x = $totalSum10 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum20=`echo "scale=4; x = $totalSum20 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum30=`echo "scale=4; x = $totalSum30 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum40=`echo "scale=4; x = $totalSum40 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum50=`echo "scale=4; x = $totalSum50 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum60=`echo "scale=4; x = $totalSum60 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum70=`echo "scale=4; x = $totalSum70 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum80=`echo "scale=4; x = $totalSum80 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum90=`echo "scale=4; x = $totalSum90 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSum100=`echo "scale=4; x = $totalSum100 / $NUM_LOOP; if(x<1) print 0; x" | bc`

  avgMax10=`echo "scale=4; x = $totalMax10 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax20=`echo "scale=4; x = $totalMax20 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax30=`echo "scale=4; x = $totalMax30 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax40=`echo "scale=4; x = $totalMax40 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax50=`echo "scale=4; x = $totalMax50 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax60=`echo "scale=4; x = $totalMax60 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax70=`echo "scale=4; x = $totalMax70 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax80=`echo "scale=4; x = $totalMax80 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax90=`echo "scale=4; x = $totalMax90 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMax100=`echo "scale=4; x = $totalMax100 / $NUM_LOOP; if(x<1) print 0; x" | bc`

  avgMin10=`echo "scale=4; x = $totalMin10 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin20=`echo "scale=4; x = $totalMin20 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin30=`echo "scale=4; x = $totalMin30 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin40=`echo "scale=4; x = $totalMin40 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin50=`echo "scale=4; x = $totalMin50 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin60=`echo "scale=4; x = $totalMin60 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin70=`echo "scale=4; x = $totalMin70 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin80=`echo "scale=4; x = $totalMin80 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin90=`echo "scale=4; x = $totalMin90 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgMin100=`echo "scale=4; x = $totalMin100 / $NUM_LOOP; if(x<1) print 0; x" | bc`

  avgSpread10=`echo "scale=4; x = $totalSpread10 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread20=`echo "scale=4; x = $totalSpread20 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread30=`echo "scale=4; x = $totalSpread30 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread40=`echo "scale=4; x = $totalSpread40 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread50=`echo "scale=4; x = $totalSpread50 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread60=`echo "scale=4; x = $totalSpread60 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread70=`echo "scale=4; x = $totalSpread70 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread80=`echo "scale=4; x = $totalSpread80 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread90=`echo "scale=4; x = $totalSpread90 / $NUM_LOOP; if(x<1) print 0; x" | bc`
  avgSpread100=`echo "scale=4; x = $totalSpread100 / $NUM_LOOP; if(x<1) print 0; x" | bc`

  echo "Latency, 10%, 20%, 30%, 40%, 50%, 60%, 70%, 80%, 90%, 100%"
  echo "Count, $avgCount10, $avgCount20, $avgCount30, $avgCount40, $avgCount50, $avgCount60, $avgCount70, $avgCount80, $avgCount90, $avgCount100"
  echo "Avg, $avgAvg10, $avgAvg20, $avgAvg30, $avgAvg40, $avgAvg50, $avgAvg60, $avgAvg70, $avgAvg80, $avgAvg90, $avgAvg100"
  echo "Sum, $avgSum10, $avgSum20, $avgSum30, $avgSum40, $avgSum50, $avgSum60, $avgSum70, $avgSum80, $avgSum90, $avgSum100"
  echo "Max, $avgMax10, $avgMax20, $avgMax30, $avgMax40, $avgMax50, $avgMax60, $avgMax70, $avgMax80, $avgMax90, $avgMax100"
  echo "Min, $avgMin10, $avgMin20, $avgMin30, $avgMin40, $avgMin50, $avgMin60, $avgMin70, $avgMin80, $avgMin90, $avgMin100"
  echo "Spread, $avgSpread10, $avgSpread20, $avgSpread30, $avgSpread40, $avgSpread50, $avgSpread60, $avgSpread70, $avgSpread80, $avgSpread90, $avgSpread100"
}

function restartTaosd {
  printTo "Stop taosd"
  systemctl stop taosd
  PID=`ps -ef|grep -w taosd | grep -v grep | awk '{print $2}'`
  while [ -n "$PID" ]
  do
    pkill -TERM -x taosd
    sleep 1
    PID=`ps -ef|grep -w taosd | grep -v grep | awk '{print $2}'`
  done

  printTo "Start taosd"
  $TAOSD_DIR/taosd > /dev/null 2>&1 &
  sleep 10
}

################ Main ################

master=false
develop=true
verbose=false

for arg in "$@"
do
  case $arg in
    -v)
      verbose=true
      ;;

    master)
      master=true
      develop=false
      ;;

    develop)
      master=false
      develop=true
      ;;
    *)
      ;;
  esac
done

if $master ; then
  echo "Test master branch.."
  cp /mnt/root/cfg/master/taos.cfg /etc/taos/taos.cfg
  WORK_DIR=/mnt/root/TDengine.master
else
  echo "Test develop branch.."
  cp /mnt/root/cfg/10billion/taos.cfg /etc/taos/taos.cfg
  WORK_DIR=/mnt/root/TDengine
fi

TAOSD_DIR=$WORK_DIR/debug/build/bin
TDTEST_DIR=$WORK_DIR/tests/comparisonTest/tdengine

runTest

echo "Test done!"
