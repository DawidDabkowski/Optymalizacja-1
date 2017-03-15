d = 0.01

A = [[2,5],[2,6],[3,4],[4,5],[5,6],[6,5],[7,6]]
B = [[3,1],[5,2],[6,4],[7,3],[8,2],[6,4]]

lp = MixedIntegerLinearProgram(maximization=True)
a = lp.new_variable(nonnegative=False)

lp.set_objective(0)

# dodajemy nierówności
lp.add_constraint(2*a[0] + 5*a[1] + a[2] >= d)
lp.add_constraint(2*a[0] + 6*a[1] + a[2] >= d)
lp.add_constraint(3*a[0] + 4*a[1] + a[2] >= d)
lp.add_constraint(4*a[0] + 5*a[1] + a[2] >= d)
lp.add_constraint(5*a[0] + 6*a[1] + a[2] >= d)
lp.add_constraint(6*a[0] + 5*a[1] + a[2] >= d)
lp.add_constraint(7*a[0] + 6*a[1] + a[2] >= d)

lp.add_constraint(3*a[0] + 1*a[1] + a[2] <= d)
lp.add_constraint(5*a[0] + 2*a[1] + a[2] <= d)
lp.add_constraint(6*a[0] + 4*a[1] + a[2] <= d)
lp.add_constraint(7*a[0] + 3*a[1] + a[2] <= d)
lp.add_constraint(8*a[0] + 2*a[1] + a[2] <= d)
lp.add_constraint(6*a[0] + 4*a[1] + a[2] <= d)

lp.add_constraint(a[0] >= -100)
lp.add_constraint(a[1] >= -100)
lp.add_constraint(a[2] >= -100)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(a)
print val

P=list_plot(A, color='blue', size=15)
R=list_plot(B, color='black', size=15)
D=plot(-val[0]/val[1]*x-val[2]/val[1], (x,1,9), color='orange', figsize=6)
show(P+R+D)
