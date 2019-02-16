# 下はなんちゃってテスト駆動開発
# 最初にインターフェースを決めてテストを書き、そのテストをパスするようなメソッドを実装
# ということは、メソッドがどういうインターフェースを持ちうるのかをよく知る必要がある

import pyautogui

delete(amount=5)
delete(amount='all')

def delete(amount='all'):

    if amount == 'all':
        pyautogui.hotkey('ctrl', 'a')
        pyautogui.press('backspace')
    elif isinstance(amount, int):
        for n in amount:
            pyautogui.press('backspace')
    else:
        print('cannot delete....')

delete(amount=5, mode='some')
delete(mode='all')

def delete(amount=0, mode='all'):

    if mode == 'all':
        pyautogui.hotkey('ctrl', 'a')
        pyautogui.press('backspace')
    elif mode == 'some':
        for n in amount:
            pyautogui.press('backspace')
    else:
        print('cannot delete....')
