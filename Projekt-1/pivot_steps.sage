import random
import operator
from copy import deepcopy
import numpy as np
from numpy import linalg as LA

#
# Rozne implementacje pivot rules
#

# [0] Wybor zmiennej wejsciowej o najwiekszym wspolczynniku funkcji celu

def coefficient_entering(self):
    coefficients = {}
    for variable in self.possible_entering():
        index = list(self.nonbasic_variables()).index(variable)
        coefficients[variable] = self.objective_coefficients()[index]
    return coefficients

def largest_coefficient_entering(self):
    coefficients = coefficient_entering(self)
    return max(coefficients.iteritems(), key=operator.itemgetter(1))[0]

def largest_coefficient_leaving(self):
    return self.possible_leaving()[0]

# [1] Wybor zmiennej o najmniejszym wspolczynniku funkcji celu

def smallest_coefficient_entering(self):
    coefficients = coefficient_entering(self)
    return min(coefficients.iteritems(), key=operator.itemgetter(1))[0]

def smallest_coefficient_leaving(self):
    return self.possible_leaving()[0]

# [2] Wybor zmiennej, ktory prowadzi do najwiekszego wzrostu funkcji celu

#Implementacja wykorzystujaca cofanie sie po wierzchołkach (obecnie nie dziala poprawnie)
#def objective_values(self):
#    values = {}
#    for variable1 in self.possible_entering():
#        self.enter(variable1)
#        for variable2 in self.possible_leaving():
#            self.leave(variable2)
#            self.update()
#            values[(variable1, variable2)] = self.objective_value()
#            self.enter(variable2)
#            self.leave(variable1)
#            self.update()
#            self.enter(variable1)
##        self.enter(None)
#    print values
#    return values        

#Implementacja wykorzystujaca kopiowanie calego obiektu klasy InteractiveLPProgram
def objective_values(self):
    values = {}
    for variable1 in self.possible_entering():
        new_problem = deepcopy(self)
        new_problem.enter(variable1)
        for variable2 in new_problem.possible_leaving():
            new_problem2 = deepcopy(new_problem)
            new_problem2.leave(variable2)
            new_problem2.update()
            values[(variable1, variable2)] = new_problem2.objective_value()
    #print values
    return values

def largest_increase_entering(self):
    values = objective_values(self)
    return max(values.iteritems(), key=operator.itemgetter(1))[0][0]
    
def largest_increase_leaving(self):
    values = objective_values(self)
    return max(values.iteritems(), key=operator.itemgetter(1))[0][1]

# [3] Wybor zmiennej, ktory prowadzi do najmniejszego wzrostu funkcji celu

def smallest_increase_entering(self):
    values = objective_values(self)
    return min(values.iteritems(), key=operator.itemgetter(1))[0][0]
    
def smallest_increase_leaving(self):
    values = objective_values(self)
    return min(values.iteritems(), key=operator.itemgetter(1))[0][1]

# [4] Wybor zmiennej, ktory prowadzi do wierzcholka w kierunku najblizszym wektorowi c (gradientowi funkcji celu)

def steepness_values(self):
    values = {}
    for variable1 in self.possible_entering():
        new_problem = deepcopy(self)
        new_problem.enter(variable1)
        for variable2 in new_problem.possible_leaving():
            new_problem2 = deepcopy(new_problem)
            new_problem2.leave(variable2)
            new_problem2.update()
            x_delta = new_problem2.basic_solution()-self.basic_solution()
            values[(variable1, variable2)] = np.dot(self.objective_coefficients(), x_delta/np.linalg.norm(x_delta))
    #print values
    return values

def steepest_edge_entering(self):
    values = steepness_values(self)
    return max(values.iteritems(), key=operator.itemgetter(1))[0][0]

def steepest_edge_leaving(self):
    values = steepness_values(self)
    return max(values.iteritems(), key=operator.itemgetter(1))[0][1]

# [5] Wybor zmiennej, ktory prowadzi do wierzcholka w kierunku najdalszym wektorowi c (gradientowi funkcji celu)

def flattest_edge_entering(self):
    values = steepness_values(self)
    return min(values.iteritems(), key=operator.itemgetter(1))[0][0]

def flattest_edge_leaving(self):
    values = steepness_values(self)
    return min(values.iteritems(), key=operator.itemgetter(1))[0][1]

  
# [6] Wybor zmiennej wchodacej i wychodzacej o najwiekszym indeksie

def lexicographical_max_entering(self):
	return max(self.possible_entering())

def lexicographical_max_leaving(self):
	return max(self.possible_leaving())

# [7] Wybor zmiennej wchodacej i wychodzacej o najmniejszym indeksie

def lexicographical_min_entering(self):
	return min(self.possible_entering())

def lexicographical_min_leaving(self):
	return min(self.possible_leaving())

# [8] Wybor losowej krawedzi (prawdopodobienstwo jednostajne)

def edge_names(self):
    names = []
    for variable1 in self.possible_entering():
        new_problem = deepcopy(self)
        new_problem.enter(variable1)
        for variable2 in new_problem.possible_leaving():
            new_problem2 = deepcopy(new_problem)
            new_problem2.leave(variable2)
            new_problem2.update()
            names.append((variable1, variable2))
    #print values
    return names

global_edge = None
count = 0

def random_edge_entering(self):
    global count
    global global_edge
    if count%2 == 0:
        names = edge_names(self)
        global_edge = random.choice(names)
    count += 1
    return global_edge[0]

def random_edge_leaving(self):
    global count
    global global_edge
    if count%2 == 0:
        names = edge_names(self)
        global_edge = random.choice(names)
    count += 1
    return global_edge[1]

# [9] Wybor losowej zmiennej

def random_variable_entering(self):
    return random.choice(self.possible_entering())
  
def random_variable_leaving(self):
    return random.choice(self.possible_leaving())

#
# Wybor funkcji pivot
#

pivot_functions = [("largest_coefficient_entering(self)", "largest_coefficient_leaving(self)"),  #0 OK
                  ("smallest_coefficient_entering(self)", "smallest_coefficient_leaving(self)"), #1 OK
                  ("largest_increase_entering(self)", "largest_increase_leaving(self)"),         #2 OK
                  ("smallest_increase_entering(self)", "smallest_increase_leaving(self)"),       #3 OK
                  ("steepest_edge_entering(self)", "steepest_edge_leaving(self)"),               #4 OK
                  ("flattest_edge_entering(self)", "flattest_edge_leaving(self)"),               #5 OK
                  ("lexicographical_max_entering(self)", "lexicographical_max_leaving(self)"),   #6 OK
                  ("lexicographical_min_entering(self)", "lexicographical_min_leaving(self)"),   #7 OK
                  ("random_edge_entering(self)", "random_edge_leaving(self)"),                   #8 OK
                  ("random_variable_entering(self)", "random_variable_leaving(self)")]           #9 OK


def my_entering(self):
    return eval(pivot_functions[method][0])

def my_leaving(self):
    return eval(pivot_functions[method][1])

#
# Definicja problemu
#

LP = \
"""
Maximize
obj:  10 x1 + 7 x2 + 9 x3 + 14.5 y1 + 13.5 y2 + 16 y3 + 5 z1 + 9 z2 + 6 z3

Subject To
w1: x1 + y1 + z1 <= 250
w2: x2 + y2 + z2 <= 310
w3: x3 + y3 + z3 <= 390
v1: x1 + x2 + x3 <= 360
v2: y1 + y2 + y3 <= 400
v3: z1 + z2 + z3 <= 500

Bounds
x1 => 0
x2 => 0
x3 => 0
y1 => 0
y2 => 0
y3 => 0
z1 => 0
z2 => 0
z3 => 0

End
"""

#with open('problem.lp', 'r') as lpfile:
#    LP=lpfile.read()

##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################

from sage.misc.html import HtmlFragment
import types

def my_run_simplex_method(self):
    output = []
    while not self.is_optimal():
        self.pivots += 1
        if self.entering() is None:
            self.enter(self.pivot_select_entering())
        if self.leaving() is None:
            if self.possible_leaving():
                self.leave(self.pivot_select_leaving())

        output.append(self._html_())
        if self.leaving() is None:
            output.append("The problem is unbounded in $()$ direction.".format(latex(self.entering())))
            break
        output.append(self._preupdate_output("primal"))
        self.update()
    if self.is_optimal():
        output.append(self._html_())
    return HtmlFragment("\n".join(output))

#
# Parsowanie danych
#

class Matrix:
    """ output matrix class """
    
    class Objective:
        def __init__(self, expression, sense, name):
            if name:
                self.name = name[int(0)]
            else:
                self.name = ""
            self.sense = sense # 1 is minimise, -1 is maximise
            self.expression = expression # a dict with variable names as keys, and coefficients as values

    class Constraint:
        def __init__(self, expression, sense, rhs, name):
            if name:
                self.name = name[int(0)]
            else:
                self.name = ""
            self.sense = sense # 1 is geq, 0 is eq, -1 is leq
            self.rhs = rhs
            self.expression = expression
    
    class Variable:
        def __init__(self, bounds, category, name):
            self.name = name
            self.bounds = (bounds["lb"], bounds["ub"]) # a tuple (lb, ub)
            self.category = category # 1 for int, 0 for linear

    def __init__(self, parserObjective, parserConstraints, parserBounds, parserGenerals, parserBinaries):

        self.objective = Matrix.Objective(varExprToDict(parserObjective.varExpr), objSenses[parserObjective.objSense], parserObjective.name)
        
        self.constraints = [Matrix.Constraint(varExprToDict(c.varExpr), constraintSenses[c.sense], c.rhs, c.name) for c in parserConstraints]
        
        boundDict = getBoundDict(parserBounds, parserBinaries) # can't get parser to generate this dict because one var can have several bound statements
        
        allVarNames = set()
        allVarNames.update(self.objective.expression.keys())
        for c in self.constraints:
            allVarNames.update(c.expression.keys())
        allVarNames.update(parserGenerals)
        allVarNames.update(boundDict.keys())
        
        self.variables = [Matrix.Variable(boundDict[vName], ((vName in list(parserGenerals)) or (vName in list(parserBinaries))), vName) for vName in allVarNames]

    def __repr__(self):
        return "Objective%s\n\nConstraints (%d)%s\n\nVariables (%d)%s" \
        %("\n%s %s %s"%(self.objective.sense, self.objective.name, str(self.objective.expression)), \
          len(self.constraints), \
          "".join(["\n(%s, %s, %s, %s)"%(c.name, str(c.expression), c.sense, c.rhs) for c in self.constraints]), \
          len(self.variables), \
          "".join(["\n(%s, %s, %s)"%(v.name, str(v.bounds), v.category) for v in self.variables]))

    def getInteractiveLPProblem(self):
        A = [[0 for x in range(len(self.variables))] for y in range(len(self.constraints))]
        b = [0] * len(self.constraints)
        c = [0] * len(self.variables)

        for i, constraint in enumerate(self.constraints):
            for v, a in constraint.expression.iteritems():
                if constraint.sense == 1:
                    A[i][map(lambda x: x.name, self.variables).index(v)] = -a
                else:
                    A[i][map(lambda x: x.name, self.variables).index(v)] = a

                if constraint.sense == 1:		
                    b[i] = -constraint.rhs
                else:
                    b[i] = constraint.rhs 

        for v, a in self.objective.expression.iteritems():
            if self.objective.sense == 1:
                c[map(lambda x: x.name, self.variables).index(v)] = -a
            else:
                c[map(lambda x: x.name, self.variables).index(v)] = a

        AA = ()
        bb = ()
        cc = ()

        for a in A:
            aaa=[]
            for aa in a:
                aaa.append(aa*int(10000))        
            AA = AA + (list(aaa),)
        for b in b:
            bb = bb + (b*int(10000),)
        for c in c:
            cc = cc + (c*int(10000),)

        lpp = InteractiveLPProblemStandardForm(AA,bb,cc)

        for i, v in enumerate(self.variables):
            if v.bounds[int(1)] < infinity:
                coef = [0,] * len(self.variables)
                coef[i] = 1
                lpp = lpp.add_constraint((coef), v.bounds[int(1)]*int(10000))
            if v.bounds[int(0)] > -infinity:
                coef = [0,] * len(self.variables)
                coef[i] = -1
                lpp = lpp.add_constraint((coef), -v.bounds[int(0)]*int(10000))

        return lpp

def varExprToDict(varExpr):
    return dict((v.name[int(0)], v.coef) for v in varExpr)

def getBoundDict(parserBounds, parserBinaries):
    boundDict = defaultdict(lambda: {"lb": -infinity, "ub": infinity}) # need this versatility because the lb and ub can come in separate bound statements

    for b in parserBounds:
        bName = b.name[int(0)]
        
        # if b.free, default is fine

        if b.leftbound:
            if constraintSenses[b.leftbound.sense] >= 0: # NUM >= var
                boundDict[bName]["ub"] = b.leftbound.numberOrInf

            if constraintSenses[b.leftbound.sense] <= 0: # NUM <= var
                boundDict[bName]["lb"] = b.leftbound.numberOrInf
        
        if b.rightbound:
            if constraintSenses[b.rightbound.sense] >= 0: # var >= NUM
                boundDict[bName]["lb"] = b.rightbound.numberOrInf

            if constraintSenses[b.rightbound.sense] <= 0: # var <= NUM
                boundDict[bName]["ub"] = b.rightbound.numberOrInf
    
    for bName in parserBinaries:
        boundDict[bName]["lb"] = 0
        boundDict[bName]["ub"] = 1

    return boundDict
    

def multiRemove(baseString, removables):
    """ replaces an iterable of strings in removables 
        if removables is a string, each character is removed """
    for r in removables:
        try:
            baseString = baseString.replace(r, "")
        except TypeError:
            raise TypeError, "Removables contains a non-string element"
    return baseString

from pyparsing import *
from sys import argv, exit
from collections import defaultdict

MINIMIZE = 1
MAXIMIZE = -1

objSenses = {"max": MAXIMIZE, "maximum": MAXIMIZE, "maximize": MAXIMIZE, \
             "min": MINIMIZE, "minimum": MINIMIZE, "minimize": MINIMIZE}

GEQ = 1
EQ = 0
LEQ = -1

constraintSenses = {"<": LEQ, "<=": LEQ, "=<": LEQ, \
                    "=": EQ, \
                    ">": GEQ, ">=": GEQ, "=>": GEQ}

infinity = 1E30

def read(fullDataString):
    #name char ranges for objective, constraint or variable
    allNameChars = alphanums + "!\"#$%&()/,.;?@_'`{}|~"
    firstChar = multiRemove(allNameChars, nums + "eE.") #<- can probably use CharsNotIn instead
    name = Word(firstChar, allNameChars, max=255)
    keywords = ["inf", "infinity", "max", "maximum", "maximize", "min", "minimum", "minimize", "s.t.", "st", "bound", "bounds", "bin", "binaries", "binary", "gen",  "general", "end"]
    pyKeyword = MatchFirst(map(CaselessKeyword, keywords))
    validName = ~pyKeyword + name
    validName = validName.setResultsName("name")

    colon = Suppress(oneOf(": ::"))
    plusMinus = oneOf("+ -")
    inf = oneOf("inf infinity", caseless=True)
    number = Word(nums+".")
    sense = oneOf("< <= =< = > >= =>").setResultsName("sense")

    # section tags
    objTagMax = oneOf("max maximum maximize", caseless=True)
    objTagMin = oneOf("min minimum minimize", caseless=True)
    objTag = (objTagMax | objTagMin).setResultsName("objSense")

    constraintsTag = oneOf(["subj to", "subject to", "s.t.", "st"], caseless=True)

    boundsTag = oneOf("bound bounds", caseless=True)
    binTag = oneOf("bin binaries binary", caseless=True)
    genTag = oneOf("gen general", caseless=True)

    endTag = CaselessLiteral("end")

    # coefficient on a variable (includes sign)
    firstVarCoef = Optional(plusMinus, "+") + Optional(number, "1")
    firstVarCoef.setParseAction(lambda tokens: eval("".join(tokens))) #TODO: can't this just be eval(tokens[0] + tokens[1])?

    coef = plusMinus + Optional(number, "1")
    coef.setParseAction(lambda tokens: eval("".join(tokens))) #TODO: can't this just be eval(tokens[0] + tokens[1])?

    # variable (coefficient and name)
    firstVar = Group(firstVarCoef.setResultsName("coef") + validName)
    var = Group(coef.setResultsName("coef") + validName)

    # expression
    varExpr = firstVar + ZeroOrMore(var)
    varExpr = varExpr.setResultsName("varExpr")

    # objective
    objective = objTag + Optional(validName + colon) + varExpr
    objective = objective.setResultsName("objective")

    # constraint rhs
    rhs = Optional(plusMinus, "+") + number
    rhs = rhs.setResultsName("rhs")
    rhs.setParseAction(lambda tokens: eval("".join(tokens)))

    # constraints
    constraint = Group(Optional(validName + colon) + varExpr + sense + rhs)
    constraints = ZeroOrMore(constraint)
    constraints = constraints.setResultsName("constraints")

    # bounds
    signedInf = (plusMinus + inf).setParseAction(lambda tokens:(tokens[int(0)] == "+") * infinity)
    signedNumber = (Optional(plusMinus, "+") + number).setParseAction(lambda tokens: eval("".join(tokens)))  # this is different to previous, because "number" is mandatory not optional
    numberOrInf = (signedNumber | signedInf).setResultsName("numberOrInf")
    ineq = numberOrInf & sense
    sensestmt = Group(Optional(ineq).setResultsName("leftbound") + validName + Optional(ineq).setResultsName("rightbound"))
    freeVar = Group(validName + Literal("free"))

    boundstmt = freeVar | sensestmt 
    bounds = boundsTag + ZeroOrMore(boundstmt).setResultsName("bounds")

    # generals
    generals = genTag + ZeroOrMore(validName).setResultsName("generals") 

    # binaries
    binaries = binTag + ZeroOrMore(validName).setResultsName("binaries")

    varInfo = ZeroOrMore(bounds | generals | binaries)

    grammar = objective + constraintsTag + constraints + varInfo + endTag

    # commenting
    commentStyle = Literal("\\") + restOfLine
    grammar.ignore(commentStyle)

    # parse input string
    parseOutput = grammar.parseString(fullDataString)

    # create generic output Matrix object
    m = Matrix(parseOutput.objective, parseOutput.constraints, parseOutput.bounds, parseOutput.generals, parseOutput.binaries)

    return m

#
# Parsowanie danych
#

method = 0
#method = 9
repeats = 0
limit = 10
#limit = 100
steps = 0

while method <= 9:
    m = read(LP)
    P = m.getInteractiveLPProblem()

    #
    # Ustawienie wlasnej funkcji pivot
    #

    D = P.initial_dictionary()

    if not D.is_feasible():
        #print "The initial dictionary is infeasible, solving auxiliary problem."
        # Phase I
        AD = P.auxiliary_problem().initial_dictionary()
        AD.enter(P.auxiliary_variable())
        AD.leave(min(zip(AD.constant_terms(), AD.basic_variables()))[int(1)])
        AD.run_simplex_method()
        if AD.objective_value() < 0:
            #print "The original problem is infeasible."
            P._final_dictionary = AD
        else:
            #print "Back to the original problem."
            D = P.feasible_dictionary(AD)


    D.run_simplex_method = types.MethodType(my_run_simplex_method, D)
    D.pivots = 0

    D.pivot_select_entering = types.MethodType(my_entering, D)
    D.pivot_select_leaving = types.MethodType(my_leaving, D)

    #
    # Algorytm sympleks
    #

    if D.is_feasible():
        D.run_simplex_method()

    #print "Number of pivot steps: ", D.pivots
    

    #print D.objective_value()
    #print P.optimal_solution()
    if method in [8,9]:
        steps += D.pivots
        if repeats == limit:
            print float(steps/limit),
            method += 1
            repeats = 0
            steps = 0
        else:
            repeats += 1
    else:
        print D.pivots,
        method += 1
        
#    if method in [8,9]:
#        print pivot_functions[method][0][:-15], "21", D.pivots
#        if repeats == limit-1:
#            method += 1
#            repeats = 0
#        else:
#            repeats += 1
#    else:
#        print D.pivots,
#        method += 1
