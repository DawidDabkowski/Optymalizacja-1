# przyblizenie w l1 (metoda najmniejszych kwadratow)

import numpy as np 
import numpy.linalg 
 
A=np.array([[3,1], [4,1], [5,1], [6,1], [10,1], [11,1]]); 
B=np.array([3.5,4.07,3.7,4,5.2,4.8]); 
print A 
print B
 
X=np.linalg.lstsq(A,B)[0] 
print X 
 
var ( 'x' ) 
P=list_plot(zip(A[:,0],B)) 
C=plot(X[0]*x+X[1],(x,1,15), color='red', figsize=4) 

# przyblizenie w l2

lp = MixedIntegerLinearProgram(maximization=False)
x = lp.new_variable()

# a=x[5]
# b=x[6]
lp.set_objective(x[0]+x[1]+x[2]+x[3]+x[4]+x[5]+x[6])

# dodajemy nierówności
lp.add_constraint(x[0] >= 3*x[5] + x[6] - 3.5)
lp.add_constraint(x[0] >= -3*x[5] - x[6] + 3.5)
lp.add_constraint(x[1] >= 4*x[5] + x[6] - 4.07)
lp.add_constraint(x[1] >= -4*x[5] - x[6] + 4.07)
lp.add_constraint(x[2] >= 5*x[5] + x[6] - 3.7)
lp.add_constraint(x[2] >= -5*x[5] - x[6] + 3.7)
lp.add_constraint(x[3] >= 6*x[5] + x[6] - 4)
lp.add_constraint(x[3] >= -6*x[5] - x[6] + 4)
lp.add_constraint(x[4] >= 10*x[5] + x[6] - 5.2)
lp.add_constraint(x[4] >= -10*x[5] - x[6] + 5.2)
lp.add_constraint(x[5] >= 11*x[5] + x[6] - 4.8)
lp.add_constraint(x[5] >= -11*x[5] - x[6] + 4.8)

# wynik optymalizacji
print lp.solve()

# wartosci zmiennych
val = lp.get_values(x)
print val

print val[5]*5+val[6]

var('x')
D=plot(val[5]*x+val[6], (x,1,15), color='orange', figsize=4)
show(P+C+D) 
