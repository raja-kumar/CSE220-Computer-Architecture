#!/bin/sh 
ESESC_BIN=${1:-../main/esesc}
export ESESC_ReportFile="rhsort_final"

## change the prefetch algo
export ESESC_tradCORE_prefetcher="PrefetchEngine_boom3"

## improve the L2 cache
export ESESC_PrivL2_numBanks=2
export ESESC_PrivL2_maxRequests=256
export ESESC_PrivL2_bsize=64

## set aligned fetch to false 
export ESESC_tradCORE_alignedFetch=false

## improve brDelay
export ESESC_tradCORE_fetchWidth=4
export ESESC_tradCORE_issueWidth=4
export ESESC_tradCORE_retireWidth=6

export ESESC_BenchName="./rhsort.rv"
if [ -f $ESESC_BIN ]; then
  $ESESC_BIN 
else
  $ESESC_BenchName 
fi
exit 0
