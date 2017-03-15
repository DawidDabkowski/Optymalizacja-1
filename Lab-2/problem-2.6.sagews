lp = MixedIntegerLinearProgram(maximization=True)
x = lp.new_variable(integer=True, nonnegative=True)

lp.set_objective(92*x[1]+91*x[2]+92*x[3]+44*x[4]+10*x[5]+94*x[6]+87*x[7]+93*x[8])

# dodajemy nierówności
lp.add_constraint(x[0] + x[1] + x[2] <= 1)
lp.add_constraint(x[3] + x[4] + x[5] <= 1)
lp.add_constraint(x[6] + x[7] + x[8] <= 1)
lp.add_constraint(x[0] + x[3] + x[6] <= 1)
lp.add_constraint(x[1] + x[4] + x[7] <= 1)
lp.add_constraint(x[2] + x[5] + x[8] <= 1)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val
