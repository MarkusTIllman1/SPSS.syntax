* Encoding: UTF-8.

MIXED pain WITH age STAI_trait pain_cat cortisol_serum mindfulness Female
  /CRITERIA=CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=age STAI_trait pain_cat cortisol_serum mindfulness Female | SSTYPE(3)
  /METHOD=REML
  /PRINT=SOLUTION
  /RANDOM=INTERCEPT | SUBJECT(hospital) COVTYPE(VC)
  /SAVE=FIXPRED.

DESCRIPTIVES VARIABLES=FXPRED_1
  /STATISTICS=MEAN STDDEV VARIANCE MIN MAX.

COMPUTE Prediction=2.23 + age * -0.02 + STAI_trait * -0.01 + pain_cat * 0.08 + cortisol_serum * 0.53 + 
    mindfulness * -0.23 + Female * -0.38.
EXECUTE.

DESCRIPTIVES VARIABLES=pain
  /STATISTICS=MEAN STDDEV MIN MAX.

COMPUTE Pain_squared=(pain - 4.9) * (pain - 4.9).
EXECUTE.

COMPUTE Pain_prediction=pain - Prediction.
EXECUTE.

COMPUTE Residuals_squared=Pain_prediction * Pain_prediction.
EXECUTE.

DESCRIPTIVES VARIABLES=Pain_squared Residuals_squared
  /STATISTICS=MEAN SUM STDDEV MIN MAX.
