import typer
from typing_extensions import Annotated
from pathlib import Path
from itertools import chain

NO_LEADER=-1
TRUE=1
FALSE=0


def cr(n: Annotated[int, typer.Option(help="the number of processes")] = 3,
       file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    """
    Chang and Roberts leader election algorithm [CACM 1979]


    The algorithm keeps the following state:
    - id_i: ...
    - leader_i: ...
    - highest_i: ...
    """
    assert n >= 3, "At least 3 processes are required"
    with open(file, "w") as out:
        out.write("Initial state: (0)\n")
        out.write("Initial register assignments: ")
        for i in range(n):
            if i > 0:
                out.write(", ")
            out.write(f"leader_{i}={NO_LEADER}, highest_{i}={NO_LEADER}")
        out.write("\n")
        def loop(i: int) -> int:
            return n+i+1
        def done(i: int) -> int:
            return 2*n+i+1
        def frame(*args: int) -> str:
            acc = []
            avoid = set(args)
            for i in range(n):
                if i not in avoid:
                    acc.append(f"highest_{i}'=highest_{i}/\\leader_{i}'=leader_{i}")
            return "/\\".join(acc)
        # initialization
        all_different = "/\\".join(f"id_{i}'!=id_{j}" for i in range(n) for j in chain(range(i), range(i+1,n)))
        for i in range(0, n):
            j = (i+1) % n
            out.write(f"({i}) p{i}->p{j}:x{{id_{j}'>0/\\{all_different}/\\highest_{j}'=highest_{j}/\\leader_{j}'=leader_{j}/\\{frame(j)}}} ({loop(1)})\n")
        # trigger
        out.write(f"({loop(0)}) p0->p1:id_0{{highest_0'=id_0/\\highest_0<id_0/\\id_1>id_0/\\highest_1'=id_1/\\leader_0'=leader_0/\\leader_1'=leader_1/\\{frame(0,1)}}} ({loop(1)})\n")
        # loop
        for i in range(0,n):
            j = (i+1) % n
            out.write(f"({loop(i)}) p{i}->p{j}:highest_{i}{{highest_{i}>highest_{j}/\\highest_{i}<id_{j}/\\highest_{j}'=id_{j}/\\leader_{j}'=leader_{j}/\\{frame(j)}}} ({loop(j)})\n")
            out.write(f"({loop(i)}) p{i}->p{j}:highest_{i}{{highest_{i}>highest_{j}/\\highest_{i}>id_{j}/\\highest_{j}'=highest_{i}/\\leader_{j}'=leader_{j}/\\{frame(j)}}} ({loop(j)})\n")
            out.write(f"({loop(i)}) p{i}->p{j}:highest_{i}{{highest_{i}=highest_{j}/\\/\\highest_{j}'=highest_{j}/\\leader_{j}'=highest_{i}/\\{frame(j)}}} ({done(j)})\n")
        # done
        for i in range(n):
            j = (i+1) % n
            out.write(f"({done(i)}) p{i}->p{j}:highest_{i}{{highest_{i}=highest_{j}/\\leader_{j}={NO_LEADER}/\\leader_{j}'=highest_{i}/\\highest_{j}'=highest_{j}/\\{frame(j)}}} ({done(j)})\n")
            out.write(f"({done(i)}) p{i}->p{j}:highest_{i}{{highest_{i}=highest_{j}/\\leader_{j}!={NO_LEADER}/\\{frame()}}} ({done(n)})\n")
        out.write(f"Final states: ({done(n)})\n")


if __name__ == "__main__":
    typer.run(cr)
