︠e4b5415a-6915-4b42-8520-982eaa11320d︠
%typeset_mode True

A = ([-1, 1], [1, 0], [0, 1])
b = (1, 3, 2)
c = (1, 1)
P
plot(P)
P = InteractiveLPProblemStandardForm(A, b, c, ["C", "B"])
#P.run_simplex_method()
D = P.initial_dictionary()
D
︡71ad45cb-c65d-4bfd-ac31-56a8fc3bd6db︡{"html":"<div align='center'>$\\displaystyle \\begin{array}{l}\n\\begin{array}{lcrcrcl}\n \\max \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} B \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} \\\\\n \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} B \\mspace{-6mu}&amp;\\mspace{-6mu} \\leq \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\\\\n \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} \\leq \\mspace{-6mu}&amp;\\mspace{-6mu} 3 \\\\\n \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} B \\mspace{-6mu}&amp;\\mspace{-6mu} \\leq \\mspace{-6mu}&amp;\\mspace{-6mu} 2 \\\\\n\\end{array} \\\\\nC, B \\geq 0\n\\end{array}$</div>"}︡{"file":{"filename":"/projects/91e2656d-9bc2-4b34-b059-9b7bf15d0516/.sage/temp/compute3-us/10248/tmp_j14KNP.svg","show":true,"text":null,"uuid":"19d2c258-8c00-4cdc-940e-4282da31e705"},"once":false}︡{"html":"<div align='center'>$\\displaystyle \\renewcommand{\\arraystretch}{1.5} %notruncate\n\\begin{array}{|rcrcrcr|}\n\\hline\nx_{3} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} B\\\\\nx_{4} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 3 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} \\\\\nx_{5} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 2 \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} B\\\\\n\\hline\nz \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 0 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} B\\\\\n\\hline\n\\end{array}$</div>"}︡{"done":true}︡
︠f8ba36f8-7bfe-43ef-8d33-4d4014abb1d0s︠
D.is_feasible()
D.is_optimal()
D.basic_variables()
D.basic_solution()
D.objective_value()

D
︡e1e9802e-aed0-4844-8a88-fca3fd8069ff︡{"html":"<div align='center'>$\\displaystyle \\mathrm{True}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\mathrm{False}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(x_{3},\\,x_{4},\\,x_{5}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(0,\\,0\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle 0$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\renewcommand{\\arraystretch}{1.5} %notruncate\n\\begin{array}{|rcrcrcr|}\n\\hline\nx_{3} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} B\\\\\nx_{4} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 3 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} \\\\\nx_{5} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 2 \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} B\\\\\n\\hline\nz \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 0 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} B\\\\\n\\hline\n\\end{array}$</div>"}︡{"done":true}︡
︠2d154084-b487-481c-a3f8-f879e2607c8bs︠

D.possible_entering()
D.enter("B")
D.possible_leaving()
D.leave(3)
D.update()

D.is_feasible()
D.is_optimal()
D.basic_variables()
D.basic_solution()
D.objective_value()

D
︡cfd2c382-3ca2-4f8c-87f4-508a80c9b3f7︡{"html":"<div align='center'>[$\\displaystyle C$, $\\displaystyle B$]</div>"}︡{"html":"<div align='center'>[$\\displaystyle x_{3}$]</div>"}︡{"html":"<div align='center'>$\\displaystyle \\mathrm{True}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\mathrm{False}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(B,\\,x_{4},\\,x_{5}\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(0,\\,1\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle 1$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\renewcommand{\\arraystretch}{1.5} %notruncate\n\\begin{array}{|rcrcrcr|}\n\\hline\nB \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} x_{3}\\\\\nx_{4} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 3 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} \\\\\nx_{5} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} C \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} x_{3}\\\\\n\\hline\nz \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} 2 C \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} x_{3}\\\\\n\\hline\n\\end{array}$</div>"}︡{"done":true}︡
︠c68b719c-dc85-494e-95b9-793744b0e092s︠
D.possible_entering()
D.enter("C")
D.possible_leaving()
D.leave(5)
D.update()

D.is_feasible()
D.is_optimal()
D.basic_variables()
D.basic_solution()
D.objective_value()

D
︡1ed2258e-deb9-4584-be1c-6cd8672722a4︡{"html":"<div align='center'>[$\\displaystyle C$]</div>"}︡{"html":"<div align='center'>[$\\displaystyle x_{5}$]</div>"}︡{"html":"<div align='center'>$\\displaystyle \\mathrm{True}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\mathrm{False}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(B,\\,x_{4},\\,C\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(1,\\,2\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle 3$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\renewcommand{\\arraystretch}{1.5} %notruncate\n\\begin{array}{|rcrcrcr|}\n\\hline\nB \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 2 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} x_{5} \\mspace{-6mu}&amp;\\mspace{-6mu}  \\mspace{-6mu}&amp;\\mspace{-6mu} \\\\\nx_{4} \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 2 \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} x_{5} \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} x_{3}\\\\\nC \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 1 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} x_{5} \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} x_{3}\\\\\n\\hline\nz \\mspace{-6mu}&amp;\\mspace{-6mu} = \\mspace{-6mu}&amp;\\mspace{-6mu} 3 \\mspace{-6mu}&amp;\\mspace{-6mu} - \\mspace{-6mu}&amp;\\mspace{-6mu} 2 x_{5} \\mspace{-6mu}&amp;\\mspace{-6mu} + \\mspace{-6mu}&amp;\\mspace{-6mu} x_{3}\\\\\n\\hline\n\\end{array}$</div>"}︡{"done":true}︡
︠16aca4d4-fba6-467d-a168-9e4a7a1bfb5fs︠
D.possible_entering()
D.enter(3)
D.possible_leaving()
D.leave(4)
D.update()

D.is_feasible()
D.is_optimal()
D.basic_variables()
D.basic_solution()
D.objective_value()

D
