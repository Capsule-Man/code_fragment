# 関数のインターフェースを決める(Python)
# - 関数  -> 名前
# - 引数  -> 名前、デフォルト値
# - 戻値  -> 返す値


# ふつうの引数
def fib(n):
    return


# デフォルト引数（省略可）
def ask_ok(prompt, retries=4, reminder='Please try again'):
    return


# タプル引数
def receive_tuple(*args):
    for arg in args:
        print(arg)


# 辞書引数
def receive_dict(**kwargs):
    for key in kwargs.keys():
        print("{key}: {value}".format(key=key, value=kwargs[key]))


# 型ヒント
def test(name: str) -> str:
    return name
