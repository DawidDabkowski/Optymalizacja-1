Minimize
obj:  75 F1 + 75 F2 + 24 P1 +24 P2 + 24 P3 + 24 P4 + 24 P5 + 24 P6 + 24 P7 + 24 P8 + 24 P9 + 24 P10 + 24 P11

Subject To
w1: F1 + P1 => 2
w2: F1 + P1 + P2 => 3
w3: F1 + P1 + P2 + P3 => 5
w4: F1 + P1 + P2 + P3 + P4 => 10
w5: F1 + P2 + P3 + P4 + P5 => 13
w6: F1 + P3 + P4 + P5 + P6 => 16
w7: F1 + F2 + P4 + P5 + P6 + P7 => 20
w8: F1 + F2 + P5 + P6 + P7 + P8 => 22
w9: F2 + P6 + P7 + P8 + P9 => 21
w10: F2 + P7 + P8 + P9 + P10 => 18
w11: F2 + P8 + P9 + P10 + P11 => 15
w12: F2 + P9 + P10 + P11 => 10
w13: F2 + P10 + P11 => 8
w14: F2 + P11 => 5
v1: 4 P1 + 4 P2 + 4 P3 + 4 P4 + 4 P5 + 4 P6 + 4 P7 + 4 P8 + 4 P9 + 4 P10 + 4 P11 <= 100


Bounds
F1 => 0
F2 => 0
P1 => 0
P2 => 0
P3 => 0
P4 => 0
P5 => 0
P6 => 0
P7 => 0
P8 => 0
P9 => 0
P10 => 0
P11 => 0
F1 <= 10
F2 <= 10

Generals
P1
P2
P3
P4
P5
P6
P7
P8
P9
P10
P11
F1
F2

End