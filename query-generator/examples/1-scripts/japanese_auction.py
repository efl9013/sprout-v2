import typer
from typing import Optional
from typing_extensions import Annotated
from pathlib import Path
from itertools import chain
from protocol.expr import Expr, Register, Or, And
from protocol.transition import Transition
from protocol.protocol import Protocol

STAY = -1
LEAVE = -2
WIN = -3
TRUE = 1
FALSE = 0


class JapaneseAuction(Protocol):
    """
    Japanese auction with 1 seller and n buyers.
    """

    def __init__(self, buyers: int, bids: Optional[list[int]]) -> None:
        assert buyers >= 2, "At least 2 buyers are required"
        self.buyers = buyers
        self.bids = bids

    def get_init_bids(self) -> list[int]:
        if self.bids is None:
            return [0 for _ in range(self.buyers)]
        else:
            assert len(self.bids) == self.buyers, "every buyer needs a bid"
            return self.bids

    def initial_state(self) -> int:
        return 0

    def end(self) -> int:
        if self.bids is None:
            return 3 * self.buyers
        else:
            return 2 * self.buyers

    def turn(self, i: int) -> int:
        if self.bids is None:
            return self.buyers + 2 * i
        else:
            return 2 * i

    def final_states(self) -> list[int]:
        return [self.end() + 1]

    def bid(self, buyer: int) -> Register:
        return Register("b", buyer)

    def price(self) -> Register:
        return Register("price")

    def present(self, buyer: int) -> Register:
        return Register("present", buyer)

    def registers(self) -> list[Register]:
        return [self.price()] + [self.bid(b) for b in range(self.buyers)] + [self.present(b) for b in range(self.buyers)]

    def initial_values(self) -> list[int]:
        return [0] + self.get_init_bids() + [TRUE for _ in range(self.buyers)]

    def alone(self, i: int) -> Expr:
        return And(list(self.present(j).eq(FALSE) for j in chain(range(0, i), range(i+1, self.buyers))))

    def not_alone(self, i: int) -> Expr:
        return Or(list(self.present(j).eq(TRUE) for j in chain(range(0, i), range(i+1, self.buyers))))

    def transitions(self) -> list[Transition]:
        seller = "s"
        buyer = [f"b{i}" for i in range(self.buyers)]
        null = "null"
        need_bid_init = self.bids is None
        transitions = []
        x = Register("x")
        # initialize bids and price
        if need_bid_init:
            for i in range(self.buyers):
                t = Transition(
                    i, i+1, seller, buyer[i], x, self.bid(i).prime() > 0)
                transitions.append(t)
        # main loop
        update = self.price().prime().eq(self.price() + 1)
        for i in range(self.buyers):
            s = self.turn(i)
            tell_price = Transition(
                s, s+1, seller, buyer[i], self.price(), self.present(i).eq(TRUE) & self.not_alone(i))
            won = Transition(s, self.end(), seller,
                             buyer[i], x, x.eq(WIN) & self.alone(i))
            # skip buyers that have left, since we don't have silent transition a dummy message is sent
            if i < self.buyers-1:
                skip = Transition(s, s+2, seller, null,
                                  self.price(), self.present(i).eq(FALSE))
            else:
                skip = Transition(s, self.turn(0), seller, null,
                                  self.price(), self.present(i).eq(FALSE) & update)
            # buyer stays or leaves
            s += 1
            if i < self.buyers-1:
                stay = Transition(
                    s, s+1, buyer[i], seller, x, x.eq(STAY) & (self.price() <= self.bid(i)))
                leave = Transition(
                    s, s+1, buyer[i], seller, x, x.eq(LEAVE) & (self.price() > self.bid(i)))
            else:
                stay = Transition(s, self.turn(0), buyer[i], seller, x, x.eq(
                    STAY) & (self.price() <= self.bid(i)) & update)
                leave = Transition(s, self.turn(0), buyer[i], seller, x, x.eq(
                    LEAVE) & (self.price() > self.bid(i)) & update)
            transitions.extend([tell_price, won, skip, stay, leave])
        # inform dummy process that it is over
        done = Transition(self.end(), self.end() + 1,
                          seller, null, x, x.eq(WIN))
        transitions.append(done)
        return transitions


def japanese(n: Annotated[int, typer.Option(help="the number of buyers")] = 3,
             bids: Annotated[Optional[list[int]], typer.Option(help="initial bids")] = None,
             file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    protocol = JapaneseAuction(n, bids)
    protocol.print(file, True)


if __name__ == "__main__":
    typer.run(japanese)
