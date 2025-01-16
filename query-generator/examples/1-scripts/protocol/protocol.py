from __future__ import annotations
from abc import ABC, abstractmethod
from pathlib import Path
from protocol.expr import Register
from protocol.transition import Transition

class Protocol(ABC):

    @abstractmethod
    def initial_state(self) -> int:
        ...

    @abstractmethod
    def final_states(self) -> list[int]:
        ...

    @abstractmethod
    def registers(self) -> list[Register]:
        ...

    @abstractmethod
    def initial_values(self) -> list[int]:
        ...

    @abstractmethod
    def transitions(self) -> list[Transition]:
        ...

    def print(self, file: Path, add_frame: bool = False) -> None:
        with open(file, "w") as out:
            out.write(f"Initial state: ({self.initial_state()})\n")
            init = [f"{r} = {v}" for r, v in zip(self.registers(), self.initial_values())]
            out.write("Initial register assignments: " + ", ".join(init) + "\n")
            regs = set(self.registers())
            for t in self.transitions():
                if add_frame:
                    t = t.frame(regs)
                out.write(str(t))
                out.write("\n")
            out.write(f"Final states: {", ".join(f"({s})" for s in self.final_states())}\n")
