def f(a,b,i,j):
    return [3,2,0,0,-3][i]*a+[3,2,0,0,-3][j]*b

A = matrix([[2,-1,1,0,-2],[-1,-3,0,1,1]])
b = vector([4,-5])

for i in range(5):
    for j in range(i,5):
        print "B = {", i, ",", j, "}, ",
        AB = matrix([A.column(i),A.column(j)]); 
        print "det =", AB.determinant(), ", ",
        if AB.determinant() != 0:
            xB = AB.solve_right(b);
            print "sol =", xB, ", ",
            print "f =", f(xB[0],xB[1],i,j)
        else:
            print "no solution"
