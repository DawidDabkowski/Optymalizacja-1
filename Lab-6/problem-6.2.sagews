A = ([1,-5,3], [2,-9,7], [-1,6,7])
b = (3, 8, 2)
c = (2, -3, -2)

P = InteractiveLPProblem(A, b, c, constraint_type="<=", variable_type=">=")
show(P)
show(P.standard_form().run_simplex_method())

print "\n"

PD = P.dual()
show(PD)
show(PD.standard_form().run_simplex_method())
