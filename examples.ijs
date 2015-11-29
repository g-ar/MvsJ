NB. This file comprises mostly simulations in J, since it can't do symbolic computations like Mathematica. Anyway, J's good enough to do quick numerical stuff.

NB. 1.
    n=:1e6 
    a=: (n,3) $ 1+?(3*n)#8
    b=:(I.(+/"1 a)=6){a
    (0{+/b=3)%#b

NB. 2.
    sim=: 3 : '5=+/~:(5?52){4#i.y'
    (+/%#)(sim"0)1e5#13

NB. 3.
    k=:1e6
    (+/%#)5=>./(3,k)$1+?(k*3)#6