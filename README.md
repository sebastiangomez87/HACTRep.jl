# HACTRep

[![Build Status](https://travis-ci.com/sebastiangomez87/HACTRep.jl.svg?branch=master)](https://travis-ci.com/sebastiangomez87/HACTRep.jl)
[![Codecov](https://codecov.io/gh/sebastiangomez87/HACTRep.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/sebastiangomez87/HACTRep.jl)

Please see the folder Explanation for a document with a detailed explanation of the model and some graphs with the results.

In this repository I replicate most of the paper "Income and wealth distribution in macroeconomics: a continuous-time approach" by Achdou et al. This papers has basic algorithms to solve heterogeneous agents models in continuous time. I focus in 3 parts: i) a Huggett economy, for which I calculate the policy functions and the equilibrium interest rate, ii) MIT shocks in the context of the Huggett model, and iii) the Huggett model including housing, which introduces non-convexities.

Most of the functions have two inputs: interest rate and the probability of keeping high income. This is a list of the functions:
- HJBequation(r0, lambda2): calculates the policy functions for a Huggett economy
- KF(a,z,A): after calculating the policy functions, KF takes as arguments the state variables and the matrix A to calculate the stationary distribution
- AssetSupply(): calculates the net supply of bonds for an interval of interest rates
- equilibriumR(lambda2): calculates the equilibrium interest rate (net supply = 0) for a given value of the parameter lambda2

Now the functions to estimate the transition dynamics of a MIT shock:
- TimeHJBequation(rl, resultsT,T,lambda2): calculates the policy functions for each period between 0 and T, given the policy functions for the new steady state (resultsT) and a path for the interest rate (rl)
- TimeKF(a,z,A,g0,rl,T): calculates the distributions for each period between 0 and T. Takes as arguments the state variables, the matrices A for each period, the path of interest rate and the maximum time (T) to consider
- shockSim(): estimates the transition dynamics between to moments when lambda2 changes.

Finally, the model with housing has two functions:
- HJBequationHousing(r0, lambda2): calculates the policy functions
- KFHousing(a,z,A): calculates the distribution in steady state
