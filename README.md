# IPCinfo
IPC檢核
<pre>
執行檔：run_IPCinfo.sh
設定檔：IPC_conf
日期                備註
20171212            初版
20180321            改為2個檔，run 和conf設定檔
20180323            SSHD Check切為2個部份
20180810            改檔名方便識別，上傳至git(未來加上color)
20180811            另拉branch,直接在CONSOLE SHOW (含色彩)不再產出檔案
20180815            加顏色(fail後的建議為yellow)
20180816            fix GreenOK
20180822            Gray change HighLight (you must do變亮了)
		    Pcscd check 
# 待辦：首次使用環境建立、防呆(mkdir -p /sources/software)、pcscd檔判別、跨平台
# 不限定folder : IPC_conf 本地執行

# 設定檔路徑
ConfFolder=/sources/software
# 日期
Dat=$(date +%Y%m%d-%H%M)
# log名稱
LogName=IPC-$Dat.log
# 執行
./IPC_conf 1> $LogName 2> IPCerror.log
</pre>
