#!/bin/bash
bt_root=/data/root_7.12.0_7.12.1
libdir=$bt_root/rlp/lib/amd64-glibc25-gcc41
ehcache=/data/solr+rni/ehcache.xml
echo bt_root: $bt_root
echo libdir: $libdir
/data/solr-4.10.3/bin/solr start -m 200g -s $PWD/solr_home -a "-Djava.library.path=$libdir -Dbt.root=$bt_root -Dbt.rni.ehcacheConfig=$ehcache -Dbt.rni.ehcache.jmx=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=9167 -Dcom.sun.management.jmxremote.ssl=false" "$@"

