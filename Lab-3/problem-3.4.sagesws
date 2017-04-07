# ZAŁOŻENIA ZADANIA
# 1. Na wejściu program otrzymuje:
#    -macierz współczynników A wymiaru mxn, wektor
#    -wektor znaku nierówności z wymiaru mx1 ("<=" to -1, "=" to 0, a ">=" to 1)
#    -wektor prawej strony b wymiaru mx1
#    -wektor współczynników funkcji celu c wymiaru nx1
#    -wektor czynnikow ktore maja byc nieujemne (domyslnie wszystkie) wymiaru nx1
#    -czy funkcja ma maksymalizowac czy minimalizowac
# 2. Funkcja celu jest ograniczona na wielościanie.
# 3. Program dokonuje zamiany na postać normalną, a następnie wykonuje
#    algorytm przeglądania wszystkich wierzchołków.
# 4. Wynikiem programu jest wartość maksymalizująca (lub minimalizująca) funkcję celu.
#    Argumenty, dla których wartość ta jest osiągana nie są przeliczane (nie było to
#    celem zadania, w razie potrzeby można zmodyfikować).

import numpy
import numpy.linalg
import itertools

A = numpy.array([[-1, 1], [1, 0], [0, 1]])
z = numpy.array([-1, -1, -1,])
b = numpy.array([1, 3, 2])
c = numpy.array([1, 1])
nonnegative = numpy.array([1, 1])

# 1. ZAMIANA NA POSTAĆ NORMALNĄ

def normalize(A, z, b, c):
    m = A.shape[0]
    n = A.shape[1]
    for i in range(len(z)):
        if z[i] != 0:
            newcol = numpy.zeros((m, 1))
            newcol[i] -= z[i]
            A = numpy.append(A, newcol, axis=1)
            c = numpy.append(c, 0)
    for j in range(n):
        if nonnegative[j] == 0:
            newcol = numpy.transpose(numpy.array([-A[:,j]]))
            A = numpy.append(A, newcol, axis=1)
            c = numpy.append(c, -c[j])
    return (A, c)

# 2. TWORZENIE LISTY WIERZCHOŁKÓW

def findvalues(A, z, b, c):
    m = A.shape[0]
    n = A.shape[1]
    indices = set(itertools.combinations(range(n),m))
    values = []
    for i in indices:
        Ai = A[:,i]
        if numpy.linalg.det(Ai) != 0:
            sol = numpy.linalg.solve(Ai, b)
            if (sol>0).all():
                x = []
                k = 0
                for j in range(n):
                    if j in i:
                        x.append(sol[k])
                        k += 1
                    else:
                        x.append(0)
                values.append(numpy.dot(x, c))
    return values

# 3. PROGRAM LINIOWY PRZESZUKIWANIA WIERZCHOŁKÓW

def linearprogram(A, z, b, c, domax):
    (A, c) = normalize(A, z, b, c)
    if domax == False:
        c = -c
    return max(findvalues(A, z, b, c))

print "Optimal value is", linearprogram(A, z, b, c, True)


# sprawdzenie poprawności rozwiązania przykładu

lp = MixedIntegerLinearProgram(maximization=True)
x = lp.new_variable(nonnegative=True)

lp.set_objective(x[0] + x[1])

# dodajemy nierówności
lp.add_constraint(-x[0] + x[1] <= 1)
lp.add_constraint(x[0] <= 3)
lp.add_constraint(x[1] <= 2)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val
