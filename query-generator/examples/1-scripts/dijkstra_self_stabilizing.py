import typer
from typing_extensions import Annotated
from pathlib import Path
from protocol.expr import Register
from protocol.transition import Transition
from protocol.protocol import Protocol


class DijkstraSelfStabilizing(Protocol):
    """
    Dijkstra's self stabilizing algorithm [CACM 1974]
    """

    def __init__(self, n: int, k: int) -> None:
        assert n >= 3, "At least 3 processes are required"
        assert k >= n
        self.n = n
        self.k = k

    def s(self, i: int) -> Register:
        return Register("s", i)

    def registers(self) -> list[Register]:
        return [self.s(i) for i in range(self.n)]

    def initial_state(self) -> int:
        return 0

    def final_states(self) -> list[int]:
        return []

    def initial_values(self) -> list[int]:
        return [0 for _ in range(self.n)]

    def transitions(self) -> list[Transition]:
        s = "s"
        p = [f"p{i}" for i in range(self.n)]
        x = Register("x")
        transition = []
        # Intialize the registers
        for i in range(self.n):
            init = Transition(i, i+1, s, p[i], x, (x >= 0) & (x < self.k) & self.s(i).prime().eq(x))
            transition.append(init)
        # main loop
        for i in range(self.n - 1):
            j = i + 1
            si = self.s(i)
            sjp = self.s(j).prime()
            loop = Transition(self.n + i, self.n + j,
                              p[i], p[j], x, x.eq(si) & sjp.eq(x))
            transition.append(loop)
        i = self.n - 1
        j = 0
        si = self.s(i)
        sj = self.s(j)
        sjp = sj.prime()
        update1 = x.eq(sj) & sjp.eq((sj + 1) % self.k)
        update2 = x.neq(sj) & sjp.eq(sj)
        loop_back = Transition(self.n + i, self.n + j,
                               p[i], p[j], x, x.eq(si) & (update1 | update2))
        transition.append(loop_back)
        return transition


def dijkstra(n: Annotated[int, typer.Option(help="the number of processes")] = 3,
             k: Annotated[int, typer.Option(help="k ≥ n")] = 4,
             file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    protocol = DijkstraSelfStabilizing(n, k)
    protocol.print(file, True)


if __name__ == "__main__":
    typer.run(dijkstra)
