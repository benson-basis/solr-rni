#!/bin/bash
/opt/solr-4.10.3/example/scripts/cloud-scripts/zkcli.sh -zkhost localhost:9983 -cmd upconfig -solrhome $PWD/cloud_solr_home/ -confdir cloud_conf -confname rni
