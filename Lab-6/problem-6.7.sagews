# ZAŁOŻENIA ZADANIA
# 1. Dla prostoty zakładam, że przyjmujemy postać normalną (zamianę na postać
#    normalną zaimplementowałem już w poprzedniej pracy domowej).
# 2. Na wejściu program otrzymuje czteroelementowy zbiór:
#    -macierz współczynników A wymiaru mxn
#    -wektor prawej strony b wymiaru mx1
#    -wektor współczynników funkcji celu c wymiaru nx1
#    -zmienną logiczna m, mowiaca czy funkcja ma byc maksymalizowana
# 3. Na wyjściu program zwraca (zgodnie z poleceniem) program pomocniczy, a więc
#    zmieniony czteroelementowy zbiór: {A*, b*, c*, m}

import numpy
import numpy.linalg
import itertools

# dane z zadania 6.4
data1 = {'A': numpy.array([[1, 3, 1], [0, 2, 1]]), 'b': numpy.array([4, 2]), 'c': numpy.array([1, 2, 0]), 'm': True}
# dane z zadania 6.5
data2 = {'A': numpy.array([[1, 2, -5, -1, 0, 0], [1, -4, -5, 0, -1, 0], [1, -4, -6, 0, 0, 1]]), 'b': numpy.array([3, 4, 5]), 'c': numpy.array([1, -4, 7, 0, 0, 0]), 'm': True}
# dane z zadania 6.6
data3 = {'A': numpy.array([[8, 3, -5, 1], [3, 1, -2, -1]]), 'b': numpy.array([4, 1]), 'c': numpy.array([7, 2, 3, -1]), 'm': True}

def secondary(data):
    m = data['A'].shape[0]
    data['c'] *= 0
    for i in range(m):
        newcol = numpy.zeros((m, 1))
        newcol[i] += 1
        data['A'] = numpy.append(data['A'], newcol, axis=1)
        data['c'] = numpy.append(data['c'], -1)
    return data

print "Przykład 1\n", data1, "\n", secondary(data1), "\n"
print "Przykład 2\n", data2, "\n", secondary(data2), "\n"
print "Przykład 3\n", data3, "\n", secondary(data3), "\n"
