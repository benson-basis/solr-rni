#!/bin/bash
bt_root=/data/root_java_46032
ehcache=/data/solr+rni/ehcache.xml

jmx="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dbt.rni.ehcache.jmx=true"

gcopts="-XX:NewRatio=3 -XX:SurvivorRatio=4 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=8 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ConcGCThreads=4 -XX:ParallelGCThreads=4 -XX:+CMSScavengeBeforeRemark -XX:PretenureSizeThreshold=64m -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=50 -XX:CMSMaxAbortablePrecleanTime=6000 -XX:+CMSParallelRemarkEnabled -XX:+ParallelRefProcEnabled -XX:CMSFullGCsBeforeCompaction=1 -XX:CMSTriggerPermRatio=80 -verbose:gc -XX:+PrintHeapAtGC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintTenuringDistribution -XX:+PrintGCApplicationStoppedTime -Xloggc:logs/solr_gc.log -XX:OnOutOfMemoryError=/data/solr-4.10.3/bin/oom_solr.sh"

solropts="-DSTOP.PORT=7983 -DSTOP.KEY=solrrocks -Djetty.port=8983 -Dsolr.solr.home=/data/solr+rni/cloud_solr_home -Dsolr.install.dir=/data/solr-4.10.3 -Duser.timezone=UTC -Djava.net.preferIPv4Stack=true"

rniopts="-Dbt.root=/data/root_java_46032 -Dbt.rni.ehcacheConfig=/data/solr+rni/ehcache.xml"

echo bt_root: $bt_root
DIR=$PWD
cd ../solr-4.10.3/example
nohup java -Xmx200g $jmx $gcopts $rniopts $solropts -DzkRun -jar start.jar > $DIR/logs/console.log 2>&1 & echo $! > $DIR/sharded.pid


