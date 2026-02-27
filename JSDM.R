# Multi-scale carnivore niche partitioning

# Journal: Diversity and Distributions

# R script author: Katharina Kasper

# 2026-02-27


# Necessary files: 
# * predictor_matrix.csv
# * response_matrix.csv
# * camera_info.csv
# * trait.csv


# R packages 

library(dplyr)
library(tibble)
library(Hmsc)

### upload model variables

# humanG = human land modification gradient
# forestG = tree stand age gradient

pred <- read.csv("predictor_matrix.csv")
resp <- read.csv("response_matrix.csv")


### filter by camera-trap grid

# we run separate models for each of our nested grids
# we indicate whether a camera-trap station was part of each coarse and fine grid by annotating yes (y) or no (n)
# here, we filter exemplary for the coarse grid

cams <- read.csv("camera_info.csv")
C_cams <- cams %>% filter(coarse_grid == "y")

C_pred <- pred %>% inner_join(C_cams %>% filter(coarse_grid == "y"), by = c("station")) %>%
  select(X, station, red_deer, fallow_deer, cat, vehicles, pedestrian, humanG, forestG)

C_resp <- resp %>% inner_join(C_cams %>% filter(coarse_grid == "y"), by = c("station")) %>%
  select(X, station, wolf, fox, badger, marten)


### make spatially explicit

studyDesign <- data.frame(station = as.factor(pred$station))

## get the coordinates
xyData <- C_cams %>% select(station, xcoord, ycoord) %>% column_to_rownames("station")

# assign the coordinates to a random variable
rL <- HmscRandomLevel(sData = xyData)


### define and run the model

# What may interact with period: distance-based and human-related variables

XFormula = ~ red_deer + fallow_deer + cat + period * (humanG + forestG + motorized + pedestrian)

# include carnivore body mass as a trait

trait <- read.csv("trait.csv")
trait <- trait %>% mutate(species = colnames(C_resp)) %>% column_to_rownames("species")
TrFormula = ~body_mass

# define model parameters

thin <- 150
samples <- 150000
transient <- 5000
nChains <- 3
verbose <- 3000 

# define model formula

m <- Hmsc(Y = C_resp, 
          XData = C_pred, 
          XFormula = XFormula, 
          TrData = trait, TrFormula = TrFormula,
          studyDesign = studyDesign, 
          ranLevels = list(station = rL),
          distr = "poisson") 

# run model

m <- sampleMcmc(m, thin = thin, samples = samples, transient = transient, 
                nChains = nChains, verbose = verbose, nParallel = nChains)
