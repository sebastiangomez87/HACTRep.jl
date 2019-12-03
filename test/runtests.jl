using HACTRep
using Test

results=HJBequation(0.03,0.5)

@test size(results.A)[1]==length(results.a)*length(results.z)
@test results.c[1]≈0.0955
#@test results.c[500]≈0.35751765597047436
@test (results.c[500]>=0.2) & (results.c[500]<=0.4)
#@test results.c[1000]≈0.3612279938702292
@test (results.c[1000]>=0.2) & (results.c[1000]<=0.4)
@test results.c[200]≈0.24780538173577077
@test results.v[1]≈-143.49029922114445
@test results.v[500]≈-69.22947350451497
@test results.v[1000]≈-68.54369002729676
@test results.v[200]≈-97.12267792948414

resultsKF=KF(results.a, results.z, results.A)

@test resultsKF[1]<=0.01
@test resultsKF[10]≈1.4366548720872103
@test resultsKF[200]≈0.0
@test resultsKF[500]≈0.0
@test resultsKF[510]≈1.0320935781711122
@test resultsKF[550]≈0.6793836305961967
@test resultsKF[700]≈-0.0

@test equilibriumR(0.5)≈0.021091194152832025
@test equilibriumR(0.05)≈0.03619252443313599
@test equilibriumR(0.8)≈0.026094157079133797
@test equilibriumR(1.0)≈0.03117997884750366
@test equilibriumR(1.2)≈0.034192388057708745
@test equilibriumR(1.5)≈0.037621619701385514

results3=TimeHJBequation(0.03*ones(100),results,100,0.5)

@test results3.v[1,1]≈-143.4902993264915
@test results3.v[200,10]≈-97.12267792838718
@test results3.s[300,50]≈-0.11604803029950189

results4=TimeKF(results3.a,results3.z,results3.A,resultsKF,0.03*ones(100),20)

@test results4[20,20]≈1.337443770972458
@test results4[20,50]≈1.3374437709723683
@test results4[10,20]≈1.436654872087002
@test results4[40,30]≈0.5845834701237425

resultsh=HJBequationHousing(0.03,0.5)

@test resultsh.h[200]≈2.3927855711422845
@test resultsh.h[1]≈0.0
@test resultsh.h[500]≈5.6126932999996875
@test resultsh.v[250]≈-76.42190579246638

#@testset "Heterogeneous-Agents-Continuous-Time.jl" begin
    # Write your own tests here.

#end
