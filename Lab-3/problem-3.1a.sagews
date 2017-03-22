# dane zadania

A = [(2,5),(2,6),(3,4),(4,5),(5,6),(6,5),(7,6)]
B = [(3,1),(5,2),(6,4),(7,3),(8,2),(6,4)]

# program liniowy

lp = MixedIntegerLinearProgram(maximization=True)
p = lp.new_variable(nonnegative=False)

a, b, d = p['a'], p['b'], p['d']

lp.set_objective(d)

for i in A:
    lp.add_constraint(i[0]*a + b + d <= i[1])
for j in B:
    lp.add_constraint(j[0]*a + b >= j[1] + d)

lp.add_constraint(d >= 0)

# wynik optymalizacji
print lp.solve()

val = lp.get_values(p)
print val

var ('x')
P = list_plot(A, color='blue', size=15)
R = list_plot(B, color='black', size=15)
D = plot(val['a']*x + val['b'], (x, 1, 9), color='orange', figsize=6)
show(P + R + D)
