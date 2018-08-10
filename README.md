#!/bin/bash
# IPC檢核
# 執行檔：run_IPCinfo.sh
# 設定檔：IPC_conf
# 名稱          版本    日期            作者            備註
# checkIPC      v0.1    20171212        arthur_lai      初版
#               v0.2    20180321        arthur_lai      改為2個檔，run 和conf設定檔
#               v0.3    20180323        arthur_lai      SSHD Check切為2個部份
# run_IPCinfo   v0.4    20180810        arthur_lai      改檔名方便識別，上傳至git(未來加上color)
# 待辦：加顏色(含fail後的建議)、首次使用環境建立、防呆(mkdir -p /sources/software)、跨平台
# color ok -> 綠色 、 fail -> 紅色 
# 不限定folder : IPC_conf 本地執行

#設定檔路徑
ConfFolder=/sources/software
#日期
Dat=$(date +%Y%m%d-%H%M)
#log名稱
LogName=IPC-$Dat.log
#執行
#./IPC_conf > $LogName
./IPC_conf 1> $LogName 2> IPCerror.log
