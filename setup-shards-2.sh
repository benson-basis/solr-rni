#!/bin/bash
curl 'http://localhost:8983/solr/admin/collections?action=CREATE&name=rni&numShards=8&replicationFactor=1&collection.configName=rni&maxShardsPerNode=8'
