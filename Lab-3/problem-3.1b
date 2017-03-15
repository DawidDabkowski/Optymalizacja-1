lp = MixedIntegerLinearProgram(maximization=True)
p = lp.new_variable(nonnegative=False)

lp.set_objective(p[2])

# p[0]: x
# p[1]: y
# p[2]: r

# dodajemy nierówności
lp.add_constraint(p[2] <= (p[1]-(-2)*p[0]-(5))*(1/sqrt((-2)^2+1)))
lp.add_constraint(p[2] <= (p[1]-(1)*p[0]-(-2))*(1/sqrt((1)^2+1)))
lp.add_constraint(-p[2] >= (p[1]-(0)*p[0]-(3))*(1/sqrt((0)^2+1)))

lp.add_constraint(p[2] >= 0)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(p)
print val

A = plot(-2*x+5, (x,0,6))
B = plot(x-2, (x,0,6))
C = plot(3, (x,0,6))
D = disk((val[0], val[1]), val[2], (0, 2*pi), color='black')
show(A+B+C+D, xmin=0,xmax=6,ymin=0,ymax=6)
