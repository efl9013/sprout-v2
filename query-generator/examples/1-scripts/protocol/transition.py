from __future__ import annotations
from dataclasses import dataclass, replace
from protocol.expr import Expr, Register, And, Prime


@dataclass(frozen=True)
class Transition:
    start: int
    end: int
    sender: str
    receiver: str
    payload: str | Register
    predicate: Expr

    def __str__(self) -> str:
        return f"({self.start}) {self.sender}->{self.receiver}:{self.payload}{{{self.predicate}}} ({self.end})"

    def frame(self, all_registers: set[Register]) -> Transition:
        updated = self.predicate.primed_registers()
        to_frame = all_registers - updated
        frame = And([Prime(r).eq(r) for r in to_frame])
        return replace(self, predicate=self.predicate & frame)
