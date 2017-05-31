# program bazowac bedzie na macierzy polaczen w grafie
# zakladamy, ze macierz ta jest kwadratowa, aby program mial sens
M = [[57, 0,48, 0, 0,95, 0],
     [87, 0, 0,70, 0, 0, 0],
     [ 0,96,74, 0,60, 0, 0],
     [75, 0, 0,81, 0, 0,90],
     [ 0,55, 0, 0, 0, 0,75],
     [ 0,85, 0, 0,26,60, 0],
     [ 0, 0,64, 0, 0, 0,88]]

# tworzymy program liniowy ze zmienna x
lp = MixedIntegerLinearProgram(maximization=True)
x = lp.new_variable(integer=False, nonnegative=True)
# x = lp.new_variable(integer=True, nonnegative=True)
# przypadek zrelaksowany i calkowitoliczbowy daja te same rozwiazanie

# tworzymy funkcje celu
obj = 0
n = len(M)
for i in range(n):
    for j in range(n):
        obj += M[i][j] * x[i, j]
lp.set_objective(obj)

# dodajemy nierownosci
for i in range(n):
    cons = 0
    for j in range(n):
        if M[i][j] != 0:
            cons += x[i, j]
    lp.add_constraint(cons <= 1)

for j in range(n):
    cons = 0
    for i in range(n):
        if M[i][j] != 0:
            cons += x[i, j]
    lp.add_constraint(cons <= 1)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val
