lp = MixedIntegerLinearProgram(maximization=True)
p = lp.new_variable(nonnegative=False)

lp.set_objective(p[2])

# p[0]: x
# p[1]: y
# p[2]: r

# dodajemy nierówności
lp.add_constraint(p[2] <= (p[1]-(-2)*p[0]-(5))*(1/sqrt((-2)^2+1)))
lp.add_constraint(p[2] >= (p[1]-(-2)*p[0]-(11))*(1/sqrt((-2)^2+1)))
lp.add_constraint(p[2] <= (p[1]-(1)*p[0]-(-2))*(1/sqrt((1)^2+1)))
lp.add_constraint(-p[2] >= (p[1]-(0)*p[0]-(3))*(1/sqrt((0)^2+1)))

lp.add_constraint(p[2] >= 0)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(p)
print val

A = plot(-2*x+5, (x,0.8,6))
B = plot(-2*x+11, (x,3.8,4.5))
C = plot(x-2, (x,2.1,4.6))
D = plot(3, (x,0.5,4.4))
E = disk((val[0], val[1]), val[2], (0, 2*pi), thickness=1.5, fill=False, color='black')
F = disk((val[0], val[1]), 0.05, (0, 2*pi), color='red')
show(A+B+C+D+E+F, xmin=0,xmax=5,ymin=0,ymax=4)
