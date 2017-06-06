Minimize
obj:  N11 + N12 + N13 + N21 + N22 + N23 + N31 + N32 + N33 + N41 + N42 + N43 + N51 + N52 + N53 + N61 + N62 + N63 + N71 + N72 + N73

Subject To
w1: N11 + N12 + N13 + N21 + N22 + N23 + N31 + N32 + N33 + N41 + N42 + N43 + N51 + N52 + N53 + N61 + N62 + N63 + N71 + N72 + N73 <= 60
monday1: N11 + N71 + N61 + N51 >= 5
monday2: N12 + N72 + N62 + N52 >= 7
monday3: N13 + N73 + N63 + N53 >= 9
tuesday1: N11 + N71 + N61 + N21 >= 3
tuesday2: N12 + N72 + N62 + N22 >= 8
tuesday3: N13 + N73 + N63 + N23 >= 10
wednesday1: N11 + N71 + N31 + N21 >= 2
wednesday2: N12 + N72 + N32 + N22 >= 9
wednesday3: N13 + N73 + N33 + N23 >= 10
thursday1: N11 + N41 + N31 + N21 >= 4
thursday2: N12 + N42 + N32 + N22 >= 5
thursday3: N13 + N43 + N33 + N23 >= 7
friday1: N51 + N41 + N31 + N21 >= 3
friday2: N52 + N42 + N32 + N22 >= 7
friday3: N53 + N43 + N33 + N23 >= 11
saturday1: N51 + N41 + N31 + N61 >= 2
saturday2: N52 + N42 + N32 + N62 >= 2
saturday3: N53 + N43 + N33 + N63 >= 2
sunday1: N51 + N41 + N71 + N61 >= 2
sunday2: N52 + N42 + N72 + N62 >= 5
sunday3: N53 + N43 + N73 + N63 >= 2
Bounds
N11 => 0
N21 => 0
N31 => 0
N41 => 0
N51 => 0
N61 => 0
N71 => 0
N12 => 0
N22 => 0
N32 => 0
N42 => 0
N52 => 0
N62 => 0
N72 => 0
N13 => 0
N23 => 0
N33 => 0
N43 => 0
N53 => 0
N63 => 0
N73 => 0

Generals
N11
N21
N31
N41
N51
N61
N71
N12
N22
N32
N42
N52
N62
N72
N13
N23
N33
N43
N53
N63
N73
End

