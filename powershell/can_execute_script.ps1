# 現在のプロセスの実行ポリシーをRemoteSignedに変更
# こうしておけば、ローカルで作成したスクリプトは管理者権限でpsを立ち上げなくても実行できる

Set-ExecutionPolicy RemoteSigned -Scope Process

# スコープ
#
# Scope            ExecutionPolicy
# -----            ---------------
# MachinePolicy    Undefined
# UserPolicy       Undefined
# Process          Undefined
# CurrentUser      Undefined
# LocalMachine     Undefined

# ポリシー
#
# Restricted. 
# AllSigned. 
# RemoteSigned. 
# Unrestricted. 
# Bypass. 
# Undefined.