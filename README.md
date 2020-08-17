# suma_lp
# To create the final HTML output
# Download the corrisponding lifecycle-data-sle-module-live-patching-<version>.noarch.rpm from SCC.
# Examples: 
  # lifecycle-data-sle-module-live-patching-1-10.67.1.noarch.rpm -- for SLE15
  # lifecycle-data-sle-module-live-patching-15-4.33.1.noarch.rpm -- for SLE12
  
# Extract the RPM files
# Example:
# rpm2cpio lifecycle-data-sle-module-live-patching-15-4.33.1.noarch.rpm | cpio -ivd ./usr/share/lifecycle/data/sle-module-live-patching.lifecycle
# rpm2cpio lifecycle-data-sle-module-live-patching-1-10.67.1.noarch.rpm | cpio -ivd ./var/lib/lifecycle/data/sle-live-patching.lifecycle

# Download the 2 script files in this project
# chmod and run the mk_html.sh as with the following example:
# ./mk_html.sh /srv/www/htdocs/pub/lifecycle/12sp5_var/lib/lifecycle/data/sle-live-patching.lifecycle /srv/www/htdocs/pub/lifecycle/SLES12_LP.csv SLES12
# The first argument is the path for the lifecycle data, the second is for the cleaned up csv file, and the third is the OS version this lifecycle data is for.
