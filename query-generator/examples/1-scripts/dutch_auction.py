import typer
from typing import Optional
from typing_extensions import Annotated
from pathlib import Path
from protocol.expr import Register, Literal
from protocol.transition import Transition
from protocol.protocol import Protocol

BUY = -1
PASS = -2
EXIT = -3


class DutchAuction(Protocol):
    """
    Dutch auction with 1 seller and n buyers.
    """

    def __init__(self, start_price: Optional[int], buyers: int, bids: Optional[list[int]]) -> None:
        assert start_price is None or start_price > 0
        assert buyers >= 2, "At least 2 buyers are required"
        self.start_price = start_price
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

    def final_states(self) -> list[int]:
        need_bid_init = self.bids is None
        need_price_init = self.start_price is None
        offset = 1 if need_price_init else 0
        offset += self.buyers if need_bid_init else 0
        return [offset + 3 * self.buyers]

    def bid(self, buyer: int) -> Register:
        return Register("b", buyer)

    def price(self) -> Register:
        return Register("price")

    def registers(self) -> list[Register]:
        return [self.price()] + [self.bid(b) for b in range(self.buyers)]

    def initial_values(self) -> list[int]:
        if self.start_price is None:
            return [0] + self.get_init_bids()
        else:
            return [self.start_price] + self.get_init_bids()

    def transitions(self) -> list[Transition]:
        seller = "s"
        buyer = [f"b{i}" for i in range(self.buyers)]
        need_bid_init = self.bids is None
        need_price_init = self.start_price is None

        def turn(i: int) -> int:
            offset = 1 if need_price_init else 0
            offset += self.buyers if need_bid_init else 0
            return offset + 2 * (i % self.buyers)
        end = turn(0) + 2*self.buyers
        transitions = []
        x = Register("x")
        # initialize bids and price
        if need_bid_init:
            for i in range(self.buyers):
                t = Transition(
                    i, i+1, seller, buyer[i], x, self.bid(i).prime() > 0)
                transitions.append(t)
        if need_price_init:
            t = Transition(turn(0)-1, turn(0),
                           buyer[0], seller, x, self.price().prime() > 0)
            transitions.append(t)
        # main loop
        for i in range(self.buyers):
            s = turn(i)
            price = self.price()
            bid_i = self.bid(i)
            send_price = Transition(
                s, s+1, seller, buyer[i], price, Literal(True))
            transitions.append(send_price)
            buy = Transition(
                s+1, end, buyer[i], seller, x, x.eq(BUY) & (price <= bid_i))
            transitions.append(buy)
            if i < self.buyers-1:
                nope = Transition(
                    s+1, turn(i+1), buyer[i], seller, x, x.eq(PASS) & (price > bid_i))
                transitions.append(nope)
            else:
                next_round = Transition(
                    s+1, turn(0), buyer[i], seller, x, x.eq(PASS) & (price > 1) & (price.prime().eq(price - 1)))
                done = Transition(
                    s+1, end, buyer[i], seller, x, x.eq(PASS) & (price <= 1) & (price.prime().eq(0)))
                transitions.extend([next_round, done])
        # tell everbody the auction is over
        for i in range(self.buyers):
            over = Transition(end+i, end+i+1, seller, buyer[i], x, x.eq(EXIT))
            transitions.append(over)
        return transitions


def dutch(start_price: Annotated[Optional[int], typer.Option(help="The auction's starting price")] = None,
          n: Annotated[int, typer.Option(help="the number of buyers")] = 3,
          bids: Annotated[Optional[list[int]], typer.Option(help="initial bids")] = None,
          file: Annotated[Path, typer.Option(help="destination file")] = Path("/dev/stdout")):
    protocol = DutchAuction(start_price, n, bids)
    protocol.print(file, True)


if __name__ == "__main__":
    typer.run(dutch)
