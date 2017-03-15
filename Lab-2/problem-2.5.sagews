lp = MixedIntegerLinearProgram(maximization=False)
x = lp.new_variable(integer=True, nonnegative=True)

lp.set_objective(x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6] + x[7] + x[8] + x[9] + x[10] + x[11])

# a: 105, b: 108, c: 93, d: 42
# x[0]: a,a,d,d
# x[1]: a,b,d,d
# x[2]: a,c,c
# x[3]: a,c,d,d
# x[4]: a,d,d,d,d
# x[5]: b,b,d,d
# x[6]: b,c,c
# x[7]: b,c,d,d
# x[8]: c,c,c
# x[9]: c,c,d,d
# x[10]: c,d,d,d,d
# x[11]: d,d,d,d,d,d,d

# dodajemy nierówności (a,b,c,d)
lp.add_constraint(2*x[0] + x[1] + x[2] + x[3] + x[4] >= 97)
lp.add_constraint(x[1] + 2*x[5] + x[6] >= 610)
lp.add_constraint(2*x[2] + x[3] + 2*x[6] + x[7] + 3*x[8] + 2*x[9] + x[10] >= 395)
lp.add_constraint(2*x[0] + 2*x[1] + 2*x[3] + 4*x[4] + 2*x[5] + 2*x[7] + 2*x[9] + 4*x[10] + 7*x[11] >= 211)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val
