import pandas as pd


def good():
    paths = ["a.csv", "b.csv"]
    dfs = [pd.read_csv(path) for path in paths]
    data = pd.concat(dfs)
    print(data)


def bad():
    data = pd.DataFrame()
    paths = ["a.csv", "b.csv"]

    for path in paths:
        if data.shape == (0, 0):
            data = pd.read_csv(path)
        else:
            data = pd.concat([data, pd.read_csv(path)])
