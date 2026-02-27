# Kasper et al. (2026) *Diversity and Distributions*
"Who’s afraid of the big bad human? Multi-scale niche partitioning among wolves and mesocarnivores in a human-dominated landscape"

> **Katharina Kasper**, Stephanie Kramer-Schadt, Elise Say-Sallaz, Anna J. Kirsch, Monika Gehrke, Paulina A. Szafrańska, Marcin Churski, Maciej Szewczyk, Dries P. J. Kuijper, & **Aimara Planillo** (2026):
Who’s afraid of the big bad human? Multi-scale niche partitioning among wolves and mesocarnivores in a human-dominated landscape.
Submitted to *Diversity and Distributions*. 

## Abstract

Multi-predator communities in anthropogenic landscapes face novel constraints and opportunities that challenge behavioral flexibility. Recolonizing large carnivores remain sensitive to human presence while imposing renewed top-down pressure on mesocarnivores. Consequently, coexistence emerges from a hierarchical navigation of risk and reward, where landscape-scale distributions are constrained by environmental filters and fine-scale behaviors mediate realized interactions. However, the multi-scale architecture of such sympatry remains unresolved, as previous research has largely relied on single-scale perspectives that may conflate landscape constraints with local adjustments. We investigated how carnivores (gray wolves (Canis lupus), red foxes (Vulpes vulpes), European badgers (Meles meles), and martens (Martes spp.)) partition spatiotemporal niches in a human-dominated forest in Poland using a nested, multi-scale camera-trap design and joint species distribution models (JSDMs) integrated with diel activity analysis. Our design includes coarse landscape (10 km) and fine local (5 km) resolutions to capture landscape-level distributions across multiple home ranges and local-scale adjustments within home ranges. Wolves, the only large carnivore, were primarily constrained by humans at the landscape scale but closely tracked ungulate prey at local scales. Mesocarnivores experienced weakened suppression, instead, exploiting human-modified areas along with free-ranging domestic cats. This suggests that human influence can decouple traditional predator-prey suppression. Fine-scale human risk avoidance was achieved through increased nocturnality, with species exhibiting flexible spatiotemporal offsets rather than strict segregation. Our findings reveal that human-dominated landscapes do more than constrain carnivore recovery: they actively reshape the architecture of trophic interactions. Coexistence in the Anthropocene is a negotiated process in which humans act as both participants and modulators of ecological networks. By maintaining predictable and legible activity patterns, humans can actively steward the dynamics of recovering multi-predator communities.

## Data

* predictor_matrix.csv: aggregated species record counts by camera-trap station and diel phase + environmental gradients
* response_matrix.csv: aggregated species record counts by camera-trap station (randomnized ID) and diel phase
* camera_info.csv: camera-trap station coordinates and trapping effort
* trait.csv: body mass of carnivores, included as a trait in the model

## Scripts 

* JSDM.R: models joint species distribution of carnivores and plots predicted results
