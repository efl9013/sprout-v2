import typer
from typing_extensions import Annotated
from pathlib import Path
from itertools import chain
from protocol.expr import Expr, Register, Or, And
from protocol.transition import Transition
from protocol.protocol import Protocol

NO_LEADER = -1
TRUE = 1
FALSE = 0


class ChangRobertsLeaderElection(Protocol):
    """
    Chang and Roberts leader election algorithm [CACM 1979]


    The algorithm keeps the following state:
    - id_i: ...
    - leader_i: ...
    - highest_i: ...
    """

    def __init__(self, n: int) -> None:
        assert n >= 3, "At least 3 processes are required"
        self.n = n

    def initial_state(self) -> int:
        return 0

    def final_states(self) -> list[int]:
        return [self.done(self.n)]

    def id(self, i) -> Register:
        return Register("id", i)

    def leader(self, i) -> Register:
        return Register("leader", i)

    def highest(self, i) -> Register:
        return Register("highest", i)

    def registers(self) -> list[Register]:
        i = [self.id(i) for i in range(self.n)]
        l = [self.leader(i) for i in range(self.n)]
        h = [self.highest(i) for i in range(self.n)]
        return i + l + h

    def initial_values(self) -> list[int]:
        return [NO_LEADER for _ in self.registers()]

    def all_different(self, i: int) -> Expr:
        return And(list(self.id(i).prime().neq(self.id(j)) for j in chain(range(i), range(i+1, self.n))))

    def loop(self, i: int) -> int:
        return self.n + i + 1

    def done(self, i: int) -> int:
        return 2*self.n + i + 1

    def update(self, msg: Register, j: int) -> Expr:
        ij = self.id(j)
        hj = self.highest(j)
        hjp = hj.prime()
        less1 = hj.eq(NO_LEADER) & (ij < msg) & hjp.eq(msg)
        greater1 = hj.eq(NO_LEADER) & (ij > msg) & hjp.eq(ij)
        less2 = hj.neq(NO_LEADER) & (hj < msg) & hjp.eq(msg)
        greater2 = hj.neq(NO_LEADER) & (hj > msg) & hjp.eq(ij)
        return less1 | greater1 | less2 | greater2

    def transitions(self) -> list[Transition]:
        p = [f"p{i}" for i in range(self.n)]
        x = Register("x")
        transition = []
        # initialize ids
        for i in range(self.n):
            j = (i+1) % self.n
            init = Transition(i, i+1, p[i], p[j], x, (self.id(j).prime() >= 0) & self.all_different(j))
            transition.append(init)
        # trigger
        trigger = Transition(self.n, self.loop(0), p[0], p[1], self.id(
            0), self.highest(0).prime().eq(self.id(0)) & self.update(self.id(0), 1))
        transition.append(trigger)
        # main loop
        for i in range(self.n):
            j = (i+1) % self.n
            hi = self.highest(i)
            hj = self.highest(j)
            li = self.loop(i)
            loop = Transition(li, self.loop(j), p[i], p[j], hi, self.update(hi, j))
            done = Transition(li, self.done(j), p[i], p[j], hi, hj.eq(hi) & self.leader(j).prime().eq(hj))
            transition.extend([loop, done])
        # done
        exit = self.final_states()[0]
        for i in range(self.n):
            j = (i+1) % self.n
            lj = self.leader(j)
            update1 = x.eq(NO_LEADER) & lj.eq(NO_LEADER) & lj.prime().eq(self.highest(j))
            done1 = Transition(self.done(i), self.done(j), p[i], p[j], x, update1)
            update2 = x.eq(NO_LEADER) & lj.neq(NO_LEADER)
            done2 = Transition(self.done(i), exit, p[i], p[j], x, update2)
            transition.extend([done1, done2])
        return transition


def cr(n: Annotated[int, typer.Option(help="the number of processes")] = 3,
       file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    protocol = ChangRobertsLeaderElection(n)
    protocol.print(file, True)
    # protocol.print(file, False)


if __name__ == "__main__":
    typer.run(cr)
