class Foo:

    def __init__(self):
        self.counter = 0

    def plus_one(self):
        self.counter += 1
        return self


class Bar:

    def __init__(self):
        self.counter = 0

    def plus_one(self):
        self.counter += 1
        return


class Bee:

    def plus_one(self, counter):
        return counter + 1


if __name__ == '__main__':

    foo = Foo()

    foo.plus_one()\
       .plus_one()\
       .plus_one()

    print(foo.counter)

    bar = Bar()

    bar.plus_one()
    bar.plus_one()
    bar.plus_one()

    print(bar.counter)

    bee = Bee()
    counter = 0
    counter = bee.plus_one(counter)
    counter = bee.plus_one(counter)
    counter = bee.plus_one(counter)

    print(counter)

    
