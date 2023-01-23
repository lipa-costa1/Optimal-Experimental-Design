# Optimal-Experimental-Design 
Optimal Experimental Design Project for the course (Applied Mathematics and Computer Science)

### Description
1) Linearize the model and compute the regressor vector. Use nominal values for the model parameters θ(0) and
define the design region χ (specify your choice in the report).
2) Compute the information matrix for a one single point design.
3) Compute the D−optimal approximate design and check GET (using OptimalDesign R package).
4) Compute the saturated D−optimal exact design (it is an exact design with the same number of design points
than model parameters number; use OptimalDesign R package).


The project is done considering the following model:
y(x) = θ3[exp(−θ2x) − exp(−θ1x)] + ε(x), ε ∼ N(0, σ2)

