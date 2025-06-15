
# Building a simple SIR model to simulate influenza spread ----------------
# The above model is used to simulate the spread of influenza in a population.

# Load necessary libraries
library(pacman)
pacman::p_load(deSolve, # for solving differential equations,
               ggplot2, # for plotting,
               dplyr) # for data manipulation

# Step 1: Define the SIR model function
sir_model <- function(time, state, parameter){
  with(as.list(c(state, parameter)), { # Unpack the state and parameters
    # Calculate the derivatives
    # S = Susceptible, I = Infected, R = Recovered
    dS <- -beta * S * I / N  # Change in susceptible individuals
    dI <- beta * S * I / N - gamma * I  # Change in infected individuals
    dR <- gamma * I  # Change in recovered individuals
    
    # Return the derivatives
    return(list(c(dS, dI, dR)))
  })
}

# Step 2: Set the initial state, parameters and times
N <- 1000  # Total population
initial_state <- c(S = 999, I = 1, R = 0)  # Initial state: 999 susceptible, 1 infected, 0 recovered

parameters <- c(beta = 0.3, # Define the transmission (Infection) rate
                gamma = 0.1)  # Define the recovery rate 

times <- seq(0, # Start time
             160, # End time
             by = 1) # Time steps

# Step 3: Solve the differential equations using ode function
sir_out <- ode(y = initial_state, # Initial state
               times = times, # Time sequence
               func = sir_model, # SIR model function
               parms = c(parameters, N=N)) # Parameters
# Convert the output to a data frame for easier manipulation
sir_out_df <- as.data.frame(sir_out)

# Step 4: Plot the results
ggplot(sir_out_df, aes(x = time)) + # 
  geom_line(aes(y = S, color = "Susceptible")) + 
  geom_line(aes(y = I, color = "Infected")) +
  geom_line(aes(y = R, color = "Recovered")) +
  labs(title = "SIR Model of Influenza Spread",
       x = "Time (days)",
       y = "Number of Individuals") +
  scale_color_manual(values = c("Susceptible" = "blue", "Infected" = "red", "Recovered" = "green")) +
  theme_minimal() +
  theme(legend.title = element_blank()) # Remove legend title




# Simulating the model with Vaccination -----------------------------------
# This section extends the SIR model to include vaccination, which reduces the number of susceptible individuals and increases the no of recovered
# Assumptions made
# 1. Homogenous mixing -> Everyone in the pop has the same chance of meeting any otheeer peron
# 2. Fixed total population -> the tota pop remains constant (I+R+S)
# 3. Immediatee and full immunity afterr recovery or vaccination & the vaccination is 100% effective
# 4. The vaccine acts immediately 
# 5. Consstant parameter -> transmission, recovery and vaccination rate remain constant over time
# 6. There is no latent phase (no expoed or asymptomatic state)
# 7. Every susceptible person has the samee chance of being vaccinated.

# Step 1: Define the SIR model function with vaccination
sir_vaccination <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
       dS <- -beta * S * I/N - nu * S # Susceptible changes
       dI <- beta * S * I/N - gamma * I # Infected changes
       dR <- gamma * I + nu * S # Recovered changes + vaccinated casess
       
       list(c(dS, dI, dR))
       })
}

# Step 2: Setting paramaters, intial state and time
# Parameters
parameters <- c(
  beta = 0.3, # Transmission rates
  gamma = 0.1, # recovery ratess 
  nu = 0.05 # Vaccination rates
)

# Intial state values
intial_state <- c(
  S = 990, # Intial no of susceptible individuals
  I = 10, # Intial no of infected individuals
  R = 0 # Intial no of recovered individuals
)

# Total populations
parameters["N"] <- sum(initial_state)

# Time
time <- seq(0, # Starting time
            100, # End time
            by = 3 # time steps
            )
# Ste 3: Running the simulation using ordinary differential equations
vac_out <- ode(
  y = intial_state,
  times = time,
  func = sir_vaccination,
  parms = parameters
)

# Saving the output as dataframe
vacc_out_df <- as.data.frame(vac_out)

# Step 4: Plotting the output
ggplot(vacc_out_df, aes(x=time)) +
  geom_line(aes(y=S, color = "Susceptible")) +
  geom_line(aes(y=I, color = "Infected")) +
  geom_line(aes(y=R, color = "Recovered")) +
  labs(title = "SIR Model with vaccination",
       x = "Time(Day)",
       y = "Number of people") +
  scale_color_manual(values = c("Susceptible" = "blue", "Infected" = "red", "Recovered" = "green")) +
  theme_minimal() +
  theme(legend.title = element_blank()) # Remove the legend 
  
