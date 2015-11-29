(* This file shows various ways of computation using mathematica, exact/approximate answers for questions given in examplesQ.md *)
(* 1. *)
(* Exact answer, using generating functions *)
(Series[Sum[x^i, {i, 1, 8}]^2, {x, 0, 10}] // 
   Coefficient[#, x, 3] &)/(Series[
    Sum[x^i, {i, 1, 8}]^3, {x, 0, 10}] // Coefficient[#, x, 6] &)

(* Answer using enumeration *)
(Cases[#, {3, _, _} -> 1] // Total)/Length[#] &@
 Select[Tuples[Range[8], 3], Total[#] == 6 &]

(* By simulation *)
n = 1000000;
(Cases[#, {3, _, _} -> 1] // Total)/Length[#] &@
  Select[RandomInteger[{1, 8}, {n, 3}], Total[#] == 6 &] // N


(* 2. *)
(* Exact answer by enumeration *)
(Select[Subsets[ConstantArray[Range[1, 13], 4] // Flatten, {5}], 
    Length[Union[#]] == 5 &] // Length)/Binomial[52, 5]

(* Exact answer using generating function *)
k = 13;
Coefficient[Expand[(1 + 4 x)^k], x, 5]/
 Coefficient[Expand[Sum[Binomial[4, i] x^i, {i, 0, 5}]^k], x, 5]

(* Generalizing the anaswer for any number of kinds (e.g. if we remove four 2's, then k=12) *)
Coefficient[Series[(1 + 4 x)^k, {x, 0, 5}], x, 5]/
 Coefficient[Series[(1 + x)^(4 k), {x, 0, 5}], x, 5]

(* One more way is to use the probability distribution itself, but would take too long, I aborted after a minute --
k = 13;
\[ScriptCapitalD] = 
  MultivariateHypergeometricDistribution[5, ConstantArray[4, k]];
Probability[Max[Array[x, k]] == 1, 
  Array[x, k] \[Distributed] \[ScriptCapitalD]] *)

(* By simulation *)
lst = ConstantArray[Range[1, 13], 4] // Flatten;
f[n_] := (RandomSample[lst, n] // Union // Length) == n // Boole;
f /@ ConstantArray[5, 1000000] // Mean


(* 3. *)
(* The answer *)
d = ProductDistribution[DiscreteUniformDistribution[{1, 6}], 
  DiscreteUniformDistribution[{1, 6}], DiscreteUniformDistribution[{1, 6}]];
Probability[Max[Array[x, 3]] == 5, Array[x, 3] \[Distributed] d]

(* Simulation *)
k = 1000000;
(Select[RandomInteger[{1, 6}, {k, 3}], Max[#] == 5 &] // Length)/k // N



