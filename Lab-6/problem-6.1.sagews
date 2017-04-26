A = ([1,2,-3], [1,8,-4], [2,-3,-7])
b = (3, 8, 9)
c = (3, 2, -7)

P = InteractiveLPProblem(A, b, c, constraint_type="<=", variable_type=">=")
show(P)
show(P.standard_form().run_simplex_method())

print "\n"

PD = P.dual()
show(PD)
show(PD.standard_form().run_simplex_method())
