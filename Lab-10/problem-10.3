# program bazowac bedzie na macierzy polaczen w grafie
# zakladamy, ze macierz ta jest kwadratowa, aby program mial sens
M = [[1,0,1,0,0,1,0],
     [1,0,0,1,0,0,0],
     [0,1,1,0,1,0,0],
     [1,0,0,1,0,0,1],
     [0,1,0,0,0,0,1],
     [0,1,0,0,1,1,0],
     [0,0,1,0,0,0,1]]

# tworzymy program liniowy ze zmienna x
lp = MixedIntegerLinearProgram(maximization=True)
x = lp.new_variable(integer=True, nonnegative=True)

# tworzymy funkcje celu
obj = 0
n = len(M)
for i in range(n):
    for j in range(n):
        if M[i][j] == 1:
            obj += x[i, j]
lp.set_objective(obj)

# dodajemy nierownosci
for i in range(n):
    cons = 0
    for j in range(n):
        if M[i][j] == 1:
            cons += x[i, j]
    lp.add_constraint(cons <= 1)

for j in range(n):
    cons = 0
    for i in range(n):
        if M[i][j] == 1:
            cons += x[i, j]
    lp.add_constraint(cons <= 1)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val


# zbudujemy teraz program dualny
# zauwazmy, ze w programie wyjsciowym kazda nierownosc odpowiadala jednemu wierzcholkowi

# tworzymy program liniowy ze zmienna y
lp2 = MixedIntegerLinearProgram(maximization=False)
y = lp2.new_variable(integer=True, nonnegative=True)

# tworzymy funkcje celu
obj = 0
for i in range(2):
    for j in range(n):
        obj += y[i, j]
lp2.set_objective(obj)

# dodajemy nierownosci
for i in range(n):
    for j in range(n):
        if M[i][j] == 1:
            lp2.add_constraint(y[0, i] + y[1, j] >= 1)

# wynik optymalizacji
print lp2.solve()

# wartosci zmiennych
val = lp2.get_values(y)
print val


# istotnie, program dualny daje problem minimalnego pokrycia wierzcholkowego:
# funkcja celu minimalizuje ilosc wybranych wierzcholkow, a ograniczenia
# daja nam warunek, by dla kazdej krawedzi jeden wierzcholek wystapil co najmniej raz
