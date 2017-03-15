# problem w postaci niemodyfikowanej

lp = MixedIntegerLinearProgram(maximization=True)
x = lp.new_variable()

lp.set_objective(3*x[0] - 2*x[1])

# dodajemy nierówności
lp.add_constraint(2*x[0] - x[1] <= 4)
lp.add_constraint(x[0] + 3*x[1] >= 5)
lp.add_constraint(x[1] >= 0)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val


# problem w postaci normalnej

lp = MixedIntegerLinearProgram(maximization=True)
x = lp.new_variable(nonnegative=True)

lp.set_objective(3*x[0]-3*x[1] - 2*x[2])

# dodajemy nierówności
lp.add_constraint(2*x[0]-2*x[1] - x[2] == 4)
lp.add_constraint(x[0]-x[1] + 3*x[2] == 5)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val







