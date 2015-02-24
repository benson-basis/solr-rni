#!/bin/bash
bt_root=/data/root_java_46032
ehcache=/data/solr+rni/ehcache.xml
echo bt_root: $bt_root
#jmx="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dbt.rni.ehcache.jmx=true"
/data/solr-4.10.3/bin/solr start -m 200g -s $PWD/solr_home -a "-Dbt.root=$bt_root -Dbt.rni.ehcacheConfig=$ehcache $jmx" "$@"

