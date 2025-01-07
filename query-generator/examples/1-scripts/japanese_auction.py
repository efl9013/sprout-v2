import typer
from typing import Optional
from typing_extensions import Annotated
from pathlib import Path
from itertools import chain

STAY=-1
LEAVE=-2
WIN=-3
TRUE=1
FALSE=0

def japanese(n: Annotated[int, typer.Option(help="the number of buyers")] = 3,
             file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    """
    Japanese auction with 1 seller and n buyers.
    """
    assert n >= 2, "At least 2 buyers are required"
    with open(file, "w") as out:
        out.write("Initial state: (0)\n")
        out.write("Initial register assignments: price=0")
        for i in range(n):
            out.write(f", bid_{i}>0, present_{i}={TRUE}")
        out.write("\n")
        def frame(i: Optional[int] = None, p: bool = True) -> str:
            r = range(n) if i is None else chain(range(0,i), range(i+1,n))
            bid = "/\\".join(f"bid_{i}'=bid_{i}" for i in range(n))
            present = "/\\".join(f"present_{j}'=present_{j}" for j in r) 
            if p:
                return "price'=price/\\" + bid + "/\\" + present
            else:
                return bid + "/\\" + present
        end = 2 * n
        # main loop
        def alone(i: int) -> str:
            return "/\\".join(f"present_{j}={FALSE}" for j in chain(range(0,i), range(i+1, n)))
        def not_alone(i: int) -> str:
            return "(" + "\\/".join(f"present_{j}={TRUE}" for j in chain(range(0,i), range(i+1, n))) + ")"
        for i in range(n):
            s = 2 * i
            # tell the buyer the price or that it won
            out.write(f"({s}) s->b{i}:price{{present_{i}={TRUE}/\\{not_alone(i)}/\\{frame()}}} ({s+1})\n")
            out.write(f"({s}) s->b{i}:win{{win={WIN}/\\present_{i}={TRUE}/\\{alone(i)}/\\{frame()}}} ({end})\n")
            # skip buyers that have left, since we don't have silent transition a dummy message is sent
            if i < n-1:
                out.write(f"({s}) s->null:price{{present_{i}={FALSE}/\\{frame()}}} ({s+2})\n")
            else:
                out.write(f"({s}) s->null:price{{present_{i}={FALSE}/\\price'=price+1/\\{frame(p=False)}}} (0)\n")
            # buyer stays or leaves
            s += 1
            if i < n-1:
                out.write(f"({s}) b{i}->s:stay{{stay={STAY}/\\price<=bid{i}/\\{frame()}}} ({s+1})\n")
                out.write(f"({s}) b{i}->s:leave{{leave={LEAVE}/\\price>bid{i}/\\present_{i}={FALSE}/\\{frame(i)}}} ({s+1})\n")
            else:
                out.write(f"({s}) b{i}->s:stay{{stay={STAY}/\\price<=bid{i}/\\price'=price+1/\\{frame(p=False)}}} (0)\n")
                out.write(f"({s}) b{i}->s:leave{{leave={LEAVE}/\\price>bid{i}/\\price'=price+1/\\present_{i}={FALSE}/\\{frame(i,False)}}} (0)\n")
        # inform dummy process that it is over
        out.write(f"({end}) s->null:win{{win={WIN}/\\{frame()}}} ({end+1})\n")
        out.write(f"Final states: ({end+1})\n")


if __name__ == "__main__":
    typer.run(japanese)

