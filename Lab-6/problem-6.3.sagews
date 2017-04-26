A = ([-1,1,1], [1,1,-1], [0,0,1])
b = (10, 2, 3)
c = (1, -2, -1)

P = InteractiveLPProblem(A, b, c, constraint_type="<=")
show(P)
show(P.standard_form().run_simplex_method())

print "\n"

PD = P.dual()
show(PD)
show(PD.standard_form().run_simplex_method())
