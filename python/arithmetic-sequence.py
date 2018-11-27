# seq = range(0, 84, 30)
# print(list(seq))
# ☓ [0, 30, 60] ◯ [0, 30, 60, 84]

a = list(range(0, 84, 30)) + [84]

b = list()
x = 0
while True:
    b.append(x)
    if x + 30 > 84:
        b.append(84)
        break
    else:
        x += 30

c = [i for i in range(0, 84 + 1) if i % 30 == 0 or i == 84]

print(a)
print(b)
print(c)