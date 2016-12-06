# Library to update R packages in windows
library(installr)

# Command to update R to the latest version on Windows
# Also copies all packages from the previous version
updateR()

# Update all packages
pkgs <- installed.packages()
update.packages(pkgs)
