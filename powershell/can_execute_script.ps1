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
# Restricted. Does not load configuration files or run scripts. Restricted is the default execution policy.
# AllSigned. Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on the local computer.
# RemoteSigned. Requires that all scripts and configuration files downloaded from the Internet be signed by a trusted publisher.
# Unrestricted. Loads all configuration files and runs all scripts. If you run an unsigned script that was downloaded from the Internet, you are prompted for permission before it runs.
# Bypass. Nothing is blocked and there are no warnings or prompts.
# Undefined. Removes the currently assigned execution policy from the current scope. This parameter will not remove an execution policy that is set in a Group Policy scope.