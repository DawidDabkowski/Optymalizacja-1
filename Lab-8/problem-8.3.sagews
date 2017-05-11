# dane zadania

import numpy as np

# S = 6
# Strategie: (2, 2, 2), (1, 2, 3), (1, 1, 4)

M = np.array([[0, 0, 1], [0, 0, 0], [-1, 0, 0]])
m = M.shape[0]
n = M.shape[1]

print M

c = [0]*m
c.append(1)
b = [0]*n
b.append(1)

newcol = [[-1]]*n
newrow = np.append([[1]*m], [[0]], axis=1)
A = M.transpose()
A = np.append(A, newcol, axis=1)
A = np.append(A, newrow, axis=0)

# program liniowy

con_type = [">="]*n
con_type.append("==")
var_type = [">="]*m
var_type.append("")

P = InteractiveLPProblem(A, b, c, constraint_type = con_type, variable_type = var_type)
show(P)

# wynik optymalizacji

show(P.standard_form().run_simplex_method())
