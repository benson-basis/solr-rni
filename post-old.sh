#!/bin/bash
java  -Durl=http://localhost:8983/solr/old-plugin/update -classpath ../solr-4.10.3/dist/solr-core-4.10.3.jar org.apache.solr.util.SimplePostTool ../root_7.12.0_7.12.1/rlpnc/data/rnm/sample/solr4x_home_old/shakespeare.xml
