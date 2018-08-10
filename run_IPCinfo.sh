#!/bin/bash
mkdir -p /sources/software
#設定檔路徑
ConfFolder=/sources/software
#日期
Dat=$(date +%Y%m%d-%H%M)
#log名稱
LogName=IPC-$Dat.log
#執行
cd $ConfFolder
./IPC_conf > $LogName

