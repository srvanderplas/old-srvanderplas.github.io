# Essential R packages

# Read in package list
pkgs <- read.csv("https://raw.githubusercontent.com/srvanderplas/srvanderplas.github.io/master/Data/Packages.csv", stringsAsFactors = F)
# pkgs <- read.csv("Data/Packages.csv", stringsAsFactors = F)

# Separate out github packages
gh <- subset(pkgs, Location=="github")
cran <- subset(pkgs, Location=="CRAN")

# Install cran packages
install.packages(cran$Name, Ncpus = 4, dependencies = c('Suggests', 'Depends', 'Imports', 'Enhances'))

# Install github packages
library(devtools)
install_github(sprintf("%s/%s", gh$Author, gh$Name), dependencies = c('Suggests', 'Depends'))
