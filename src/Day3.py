# Part 2
# adapted from https://math.stackexchange.com/a/1105125
class D3(object):
    def __init__(self):
        self.pos = (0, 0)
        self.n = 1
        self.l = {(0,0): 1}
        self.dirs = {self.move_east: self.move_north,
                     self.move_north: self.move_west,
                     self.move_west: self.move_south,
                     self.move_south: self.move_east}
        self.dir = self.move_east

    @staticmethod
    def move_east((x, y)):
        return (x + 1, y)

    @staticmethod
    def move_west((x, y)):
        return (x - 1, y)

    @staticmethod
    def move_north((x, y)):
        return (x, y + 1)

    @staticmethod
    def move_south((x,y)):
        return (x, y - 1)

    @property
    def neighbors(self):
        x, y = self.pos
        return ((x - 1, y),
                (x - 1, y - 1),
                (x - 1, y + 1),
                (x, y - 1),
                (x, y + 1),
                (x + 1, y),
                (x + 1, y - 1),
                (x + 1, y + 1))

    def go(self):
        self.pos = self.dir(self.pos)
        self.n = sum(self.l.get(neighb, 0) for neighb in self.neighbors)
        self.l[self.pos] = self.n
        right_dir = self.dirs[self.dir]
        to_right = right_dir(self.pos)
        if to_right not in self.l:
            self.dir = right_dir

def main():
    d3 = D3()
    while d3.n < 368078:
        d3.go()
    return d3.n
