from __future__ import annotations
from abc import ABC, abstractmethod
from dataclasses import dataclass


class Expr(ABC):

    @abstractmethod
    def registers(self) -> set[Register]:
        ...

    @abstractmethod
    def primed_registers(self) -> set[Register]:
        ...

    @abstractmethod
    def precedence(self) -> int:
        ...

    def p(self, other: Expr) -> str:
        if other.precedence() <= self.precedence():
            return f"({other})"
        else:
            return str(other)

    def __add__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Add(self, rhs)

    def __radd__(self, lhs: int) -> Expr:
        return Add(Literal(lhs), self)

    def __sub__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Sub(self, rhs)

    def __rsub__(self, lhs: int) -> Expr:
        return Sub(Literal(lhs), self)

    def __mul__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Mul(self, rhs)

    def __rmul__(self, lhs: int) -> Expr:
        return Mul(Literal(lhs), self)

    def __truediv__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Div(self, rhs)

    def __rtruediv__(self, lhs: int) -> Expr:
        return Div(Literal(lhs), self)

    def __mod__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Mod(self, rhs)

    def __rmod__(self, lhs: int) -> Expr:
        return Mod(Literal(lhs), self)

    def eq(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Eq(self, rhs)

    def neq(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Neq(self, rhs)

    def __le__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Leq(self, rhs)

    def __ge__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Geq(self, rhs)

    def __lt__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Lt(self, rhs)

    def __gt__(self, rhs: Expr | int) -> Expr:
        if isinstance(rhs, int):
            rhs = Literal(rhs)
        return Gt(self, rhs)

    def __and__(self, rhs: Expr | bool) -> Expr:
        if isinstance(rhs, bool):
            if rhs:
                return self
            else:
                return Literal(False)
        elif isinstance(rhs, And):
            return And([self] + rhs.children)
        else:
            return And([self, rhs])

    def __or__(self, rhs: Expr | bool) -> Expr:
        if isinstance(rhs, bool):
            if rhs:
                return Literal(True)
            else:
                return self
        elif isinstance(rhs, Or):
            return Or([self] + rhs.children)
        else:
            return Or([self, rhs])


@dataclass(frozen=True)
class Literal(Expr):
    value: int | bool

    def precedence(self) -> int:
        return 20

    def __str__(self) -> str:
        return str(self.value)

    def registers(self) -> set[Register]:
        return set()

    def primed_registers(self) -> set[Register]:
        return set()

    def __and__(self, rhs: Expr | bool) -> Expr:
        if self.value == True:
            return rhs
        else:
            return super().__and__(rhs)

    def __or__(self, rhs: Expr | bool) -> Expr:
        if self.value == False:
            return rhs
        else:
            return super().__or__(rhs)


@dataclass(frozen=True)
class Register(Expr):
    name: str
    index: int | None = None

    def precedence(self) -> int:
        return 20

    def registers(self) -> set[Register]:
        return {self}

    def primed_registers(self) -> set[Register]:
        return set()

    def prime(self) -> Prime:
        return Prime(self)

    def __str__(self) -> str:
        if self.index is None:
            return self.name
        else:
            match self.index:
                case 0:
                    return self.name + "zero"
                case 1:
                    return self.name + "one"
                case 2:
                    return self.name + "two"
                case 3:
                    return self.name + "three"
                case 4:
                    return self.name + "four"
                case 5:
                    return self.name + "five"
                case 6:
                    return self.name + "six"
                case 7:
                    return self.name + "seven"
                case _:
                    raise NotImplementedError()


@dataclass(frozen=True)
class Prime(Expr):
    register: Register

    def precedence(self) -> int:
        return 20

    def __str__(self) -> str:
        return str(self.register) + "'"

    def registers(self) -> set[Register]:
        return set()

    def primed_registers(self) -> set[Register]:
        return {self.register}


@dataclass(frozen=True)
class BinOp(Expr, ABC):
    lhs: Expr
    rhs: Expr

    @abstractmethod
    def op(self) -> str:
        ...

    def __str__(self) -> str:
        return f"{self.p(self.lhs)} {self.op()} {self.p(self.rhs)}"

    def registers(self) -> set[Register]:
        return self.lhs.registers() | self.rhs.registers()

    def primed_registers(self) -> set[Register]:
        return self.lhs.primed_registers() | self.rhs.primed_registers()


@dataclass(frozen=True)
class Add(BinOp):

    def precedence(self) -> int:
        return 10

    def op(self) -> str:
        return "+"


@dataclass(frozen=True)
class Sub(BinOp):

    def precedence(self) -> int:
        return 10

    def op(self) -> str:
        return "-"


@dataclass(frozen=True)
class Mul(BinOp):

    def precedence(self) -> int:
        return 15

    def op(self) -> str:
        return "*"


@dataclass(frozen=True)
class Div(BinOp):

    def precedence(self) -> int:
        return 15

    def op(self) -> str:
        return "/"


@dataclass(frozen=True)
class Mod(BinOp):

    def precedence(self) -> int:
        return 15

    def op(self) -> str:
        return "%"


@dataclass(frozen=True)
class Eq(BinOp):

    def precedence(self) -> int:
        return 5

    def op(self) -> str:
        return "="


@dataclass(frozen=True)
class Neq(BinOp):

    def precedence(self) -> int:
        return 5

    def op(self) -> str:
        return "!="


@dataclass(frozen=True)
class Leq(BinOp):

    def precedence(self) -> int:
        return 5

    def op(self) -> str:
        return "<="


@dataclass(frozen=True)
class Lt(BinOp):

    def precedence(self) -> int:
        return 5

    def op(self) -> str:
        return "<"


@dataclass(frozen=True)
class Geq(BinOp):

    def precedence(self) -> int:
        return 5

    def op(self) -> str:
        return ">="


@dataclass(frozen=True)
class Gt(BinOp):

    def precedence(self) -> int:
        return 5

    def op(self) -> str:
        return ">"


@dataclass(frozen=True)
class VariadicOp(Expr, ABC):
    children: list[Expr]

    def precedence(self) -> int:
        return 0

    @abstractmethod
    def op(self) -> str:
        ...

    def registers(self) -> set[Register]:
        r = set()
        for c in self.children:
            r |= c.registers()
        return r

    def primed_registers(self) -> set[Register]:
        r = set()
        for c in self.children:
            r |= c.primed_registers()
        return r

    def __str__(self) -> str:
        cs = [self.p(x) for x in self.children]
        return f" {self.op()} ".join(cs)


@dataclass(frozen=True)
class And(VariadicOp):
    children: list[Expr]

    def op(self) -> str:
        return "/\\"

    def __and__(self, rhs: Expr | bool) -> Expr:
        if isinstance(rhs, And):
            return And(self.children + rhs.children)
        elif rhs == True:
            return self
        elif rhs == False:
            return Literal(False)
        else:
            return And(self.children + [rhs])


@dataclass(frozen=True)
class Or(VariadicOp):
    children: list[Expr]

    def op(self) -> str:
        return "\\/"

    def __or__(self, rhs: Expr | bool) -> Expr:
        if isinstance(rhs, Or):
            return Or(self.children + rhs.children)
        elif rhs == True:
            return Literal(True)
        elif rhs == False:
            return self
        else:
            return Or(self.children + [rhs])
