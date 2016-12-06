# Essential R packages

# Read in package list
# This is my list of essential packages. I probably don't update it enough... :(
pkgs <- read.csv(
  "https://raw.githubusercontent.com/srvanderplas/srvanderplas.github.io/master/Data/Packages.csv",
  stringsAsFactors = F, comment.char = "#")

# Don't reinstall packages that are already installed
installed.pkgs <- installed.packages()
pkgs <- pkgs[!pkgs$Name %in% installed.pkgs,]

# Separate out github packages
gh <- subset(pkgs, Location == "github")
cran <- subset(pkgs, Location == "CRAN")

# Install cran packages (if any are not already installed)
if (nrow(cran) > 0) {
  install.packages(cran$Name, Ncpus = 4,
                   dependencies = c('Suggests', 'Depends', 'Imports', 'Enhances'))
}


# Install github packages
library(devtools)
library(httr)
set_config(config( ssl_verifypeer = 0L))
# set_config(use_proxy("161.201.0.0", port = 8080))
install_github(sprintf("%s/%s", gh$Author, gh$Name),
               dependencies = c('Suggests', 'Depends', 'Imports', 'Enhances'))

# Install other packages
# Requires perl installation
install.packages("WriteXLS", dependencies = T)

# RSheets packages -- still very much in alpha/beta
install_github(c("rsheets/linen", "rsheets/rexcel", "rsheets/jailbreakr"))
