import typer
from typing import Optional
from typing_extensions import Annotated
from pathlib import Path
from itertools import chain

BUY=-1
PASS=-2
EXIT=-3


def dutch(start_price: Annotated[Optional[int], typer.Option(help="The auction's starting price")] = None,
          n: Annotated[int, typer.Option(help="the number of buyers")] = 3,
          file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    """
    Dutch auction with 1 seller and n buyers.
    """
    assert start_price is None or start_price > 0
    assert n >= 2, "At least 2 buyers are required"
    with open(file, "w") as out:
        out.write("Initial state: (0)\n")
        out.write("Initial register assignments: ")
        if start_price is not None:
            out.write(f" price ={start_price}\n")
        else:
            out.write("\n")

        def frame(i: Optional[int] = None) -> str:
            r = range(n) if i is None else chain(range(0,i), range(i+1,n))
            return "/\\".join(f"bid_{i}'=bid_{i}" for i in r)
        bframe = "/\\".join(f"bid_{i}'=bid_{i}" for i in range(n))

        end = 3 * n
        def turn(i: int) -> int:
            return n + 2 * i

        # initialize the bids
        for i in range(n):
            out.write(f"({i}) s->b{i}:x{{bid_{i}'>0/\\{frame(i)}}}({i+1})\n")

        # main loop
        for i in range(n):
            s = turn(i)
            out.write(f"({s}) s->b{i}:price{{{frame()}}} ({s+1})\n")
            s += 1
            out.write(f"({s}) b{i}->s:buy{{buy={BUY}/\\price<=bid_{i}/\\{frame()}}} ({end})\n")
            if i < n-1:
                out.write(f"({s}) b{i}->s:pass{{pass={PASS}/\\price>bid_{i}/\\{frame()}}} ({s+1})\n")
            else:
                out.write(f"({s}) b{i}->s:pass{{pass={PASS}/\\price>bid_{i}/\\price'=price-1/\\price>1/\\{bframe}}} ({turn(0)})\n")
                out.write(f"({s}) b{i}->s:pass{{pass={PASS}/\\price>bid_{i}/\\price'=0/\\price<=1/\\{bframe}}} ({end})\n")
        # tells everbody the auction is over
        for i in range(n):
            out.write(f"({end+i}) s->b{i}:exit{{exit={EXIT}/\\{frame()}}} ({end+i+1})\n")
        out.write(f"Final states: ({end+n})\n")


if __name__ == "__main__":
    typer.run(dutch)

