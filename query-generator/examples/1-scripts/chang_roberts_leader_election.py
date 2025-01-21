import typer
from typing_extensions import Annotated
from pathlib import Path
from protocol.expr import Expr, Register, And
from protocol.transition import Transition
from protocol.protocol import Protocol

NO_LEADER = -1
TRUE = 1
FALSE = 0


class ChangRobertsLeaderElection(Protocol):
    """
    Chang and Roberts leader election algorithm [CACM 1979]


    The algorithm keeps the following state:
    - i[i]: the process id
    - h[i]: the highest seen id
    - l[i]: the leader
    """

    def __init__(self, n: int) -> None:
        assert n >= 3, "At least 3 processes are required"
        self.n = n

    def initial_state(self) -> int:
        return 0

    def final_states(self) -> list[int]:
        return [self.done(self.n)]

    def id(self, i) -> Register:
        return Register("i", i)

    def leader(self, i) -> Register:
        return Register("l", i)

    def highest(self, i) -> Register:
        return Register("h", i)

    def registers(self) -> list[Register]:
        i = [self.id(i) for i in range(self.n)]
        l = [self.leader(i) for i in range(self.n)]
        h = [self.highest(i) for i in range(self.n)]
        return i + l + h

    def initial_values(self) -> list[int]:
        return [NO_LEADER for _ in self.registers()]

    def different(self, x, i: int) -> Expr:
        return And(list(x.neq(self.id(j)) for j in range(i)))

    def trigger(self, i: int) -> int:
        return self.n + i + 1

    def loop(self, i: int) -> int:
        return self.trigger(self.n) + i

    def done(self, i: int) -> int:
        return self.loop(self.n) + i

    def update(self, msg: Register, j: int) -> Expr:
        ij = self.id(j)
        hj = self.highest(j)
        hjp = hj.prime()
        # hj <= ij <= msg
        # ij <= hj <= msg
        msg_max = (hj <= msg) & (ij <= msg) & hjp.eq(msg)
        # hj <= msg <= ij
        # msg <= hj <= ij
        ij_max = (hj <= ij) & (ij >= msg) & hjp.eq(ij)
        # ij <= msg <= hj
        # msg <= ij <= hj
        hj_max = (hj >= msg) & (ij <= hj) & hjp.eq(hj)
        return msg_max | ij_max | hj_max

    def transitions(self) -> list[Transition]:
        init = "init"
        null = "null"
        p = [f"p{i}" for i in range(self.n)]
        x = Register("x")
        transition = []
        # initialize ids
        for i in range(self.n):
            it = Transition(i, i+1, init, p[i], x, (x > 0) & self.id(i).prime().eq(x) & self.different(x, i))
            transition.append(it)
        # trigger: the init process non-deterministically pick the process starting the election
        for i in range(self.n):
            t1 = Transition(self.n, self.trigger(i), init, p[i], x, x.eq(0))
            j = (i+1) % self.n
            id = self.id(i)
            t2 = Transition(self.trigger(i), self.loop(j), p[i], p[j],
                            x, x.eq(id) & self.highest(i).prime().eq(id) & self.update(id, j))
            transition.extend([t1,t2])
        # main loop
        for i in range(self.n):
            j = (i+1) % self.n
            hi = self.highest(i)
            li = self.loop(i)
            loop = Transition(li, self.loop(j), p[i], p[j], x, x.eq(hi) & self.id(i).neq(hi) & self.update(hi, j))
            done = Transition(li, self.done(j), p[i], p[j], x, x.eq(0 - hi) & self.id(i).eq(hi) & self.leader(i).prime().eq(hi))
            transition.extend([loop, done])
        # done
        exit = self.final_states()[0]
        for i in range(self.n):
            j = (i+1) % self.n
            hi = self.highest(i)
            li = self.leader(i)
            done1 = Transition(self.done(i), self.done(j), p[i], p[j],
                               x, x.eq(0 - hi) & li.neq(hi) & li.prime().eq(hi))
            done2 = Transition(self.done(i), exit, p[i], null,
                               x, x.eq(0 - hi) & li.eq(hi))
            transition.extend([done1, done2])
        return transition


def cr(n: Annotated[int, typer.Option(help="the number of processes")] = 3,
       file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    protocol = ChangRobertsLeaderElection(n)
    protocol.print(file, True)
    # protocol.print(file, False)


if __name__ == "__main__":
    typer.run(cr)
