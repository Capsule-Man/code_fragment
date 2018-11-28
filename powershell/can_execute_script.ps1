# 現在のプロセスの実行ポリシーをRemoteSignedに変更
# こうしておけば、ローカルで作成したスクリプトは管理者権限でpsを立ち上げなくても実行できる

Set-ExecutionPolicy RemoteSigned -Scope Process

# 実行ポリシー
#
# Scope            ExecutionPolicy
# -----            ---------------
# MachinePolicy    Undefined
# UserPolicy       Undefined
# Process          Undefined
# CurrentUser      Undefined
# LocalMachine     Undefined

# スコープ
#
# Process: The execution policy affects only the current PowerShell
# CurrentUser: The execution policy affects only the current user.
# LocalMachine: The execution policy affects all users of the computer.
