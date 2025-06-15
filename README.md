# SIR Model with Vaccination in R

This repository contains a simple implementation of the SIR (Susceptible-Infected-Recovered) model for infectious disease dynamics using **hypothetical data**. 
The goal is to explore how **vaccination** influences the spread of influenza. 
The project is intended for **learning purposes only** and will continue to evolve as new features are added.

---

## Project Overview

Two scenarios are simulated:

1. **Standard SIR model (without vaccination)**
2. **SIR model with vaccination**

Each model tracks how individuals move between three compartments:

* **S (Susceptible)**: People who can be infected
* **I (Infected)**: Currently infected individuals
* **R (Recovered)**: Individuals who have recovered or been vaccinated

---

## Model Equations

### SIR Model without Vaccination:

$\frac{dS}{dt} = -\beta \cdot \frac{S \cdot I}{N}$
$\frac{dI}{dt} = \beta \cdot \frac{S \cdot I}{N} - \gamma \cdot I$
$\frac{dR}{dt} = \gamma \cdot I$

### SIR Model with Vaccination:

$\frac{dS}{dt} = -\beta \cdot \frac{S \cdot I}{N} - \nu \cdot S$
$\frac{dI}{dt} = \beta \cdot \frac{S \cdot I}{N} - \gamma \cdot I$
$\frac{dR}{dt} = \gamma \cdot I + \nu \cdot S$

Where:

* **$\beta$**: Infection transmission rate
* **$\gamma$**: Recovery rate
* **$\nu$**: Vaccination rate
* **$N$**: Total population size ($N = S + I + R$)

---

## Model Diagrams

### Without Vaccination:

![SIR without Vaccination Plot](https://github.com/C-Nyakundi/Modelling-for-Influenza/blob/main/SIR_model_diagram.png)

### With Vaccination:

![SIR with Vaccination Plot](https://github.com/C-Nyakundi/Modelling-for-Influenza/blob/main/SIR_model_vaccination.png)

---

## How to Run the Code

### Requirements:

* R (>= 4.0.0)
* `deSolve` package


### Run:

```r
source("sir_model.R")  # or run line-by-line from the script
```

---

## Output Plots

### 1. SIR Model Without Vaccination

* The number of susceptible individuals decreases due to infection.
* Infected cases rise sharply then fall as people recover.
* Recovered population increases gradually.
![SIR without Vaccination Plot](https://github.com/C-Nyakundi/Modelling-for-Influenza/blob/main/SIR%20Model%20for%20influenza.jpeg)


### 2. SIR Model With Vaccination

* Susceptible group declines faster due to vaccination.
* Infection peak is lower and occurs earlier.
* Recovered group increases rapidly through both recovery and vaccination.

![SIR with Vaccination Plot](https://github.com/C-Nyakundi/Modelling-for-Influenza/blob/main/SIR%20Model%20with%20vaccination.jpeg)

*Note: All plots use hypothetical data and are generated purely for learning.*

---

## Assumptions

* Closed population (no births, deaths, or migration)
* Homogeneous mixing
* Instant and full immunity after recovery or vaccination
* Constant parameters ($\beta, \gamma, \nu$)
* Vaccination is randomly distributed among susceptibles

---

## Disclaimer

> This model uses **hypothetical data** and is intended **only for educational and learning purposes**. 

---

## What to do next

* Add **delayed or time-dependent vaccination**
* Model **waning immunity**
* Extend to **SEIR** or **age-structured models**
* Include **stochastic simulations**
* Include **data from literature sourcee** 

---

## Contributing

Feel free to fork this repository and contribute improvements. Incase of anything, please reach out to  \[[nyakundicaleb98@gmail.com](mailto:nyakundicaleb98@gmail.com)].
