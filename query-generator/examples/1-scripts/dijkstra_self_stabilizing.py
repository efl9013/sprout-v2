import typer
from typing_extensions import Annotated
from pathlib import Path
from itertools import chain


def dijkstra(n: Annotated[int, typer.Option(help="the number of processes")] = 3,
             k: Annotated[int, typer.Option(help="k ≥ n")] = 4,
             file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    """
    Dijkstra's self stabilizing algorithm [CACM 1974]
    """
    assert n >= 3, "At least 3 processes are required"
    assert k >= n
    with open(file, "w") as out:
        out.write("Initial state: (0)\n")
        out.write("Initial register assignments:\n")
        def frame(i: int) -> str:
            return "/\\".join(f"s_{i}'=s_{i}" for i in chain(range(0,i), range(i+1,n)))
        for i in range(n-1):
            out.write(f"({i}) p{i}->p{i+1}:s_{i}{{s_{i+1}'=s_{i}/\\{frame(i+1)}}} ({i+1})\n")
        out.write(f"({n-1}) p{n-1}->p0:s_{n-1}{{((s_{n-1}=s_0/\\s_0'=(s_0+1)%{k})\\//(s_{n-1}!=s_0/\\s_0'=s_0))/\\{frame(0)}}} (0)\n")
        out.write(f"Final states: (0)\n") # NOTE: final state does not really make sense here


if __name__ == "__main__":
    typer.run(dijkstra)
