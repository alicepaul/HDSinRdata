## R CMD check results

## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking CRAN incoming feasibility ... [25s] NOTE
  Maintainer: 'Alice Paul <alice_paul@brown.edu>'
  
  New maintainer:
    Alice Paul <alice_paul@brown.edu>
  Old maintainer(s):
    Joanna Walsh <joanna_walsh@brown.edu>
  
  Found the following (possibly) invalid URLs:
    URL: https://www.cdc.gov/tobacco/data_statistics/surveys/nyts/data/index.html
      From: man/nyts.Rd
      Status: Error
      Message: libcurl error code 6:
        	Could not resolve host: www.cdc.gov

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'

❯ On ubuntu-gcc-release (r-release)
  checking CRAN incoming feasibility ... [8s/51s] NOTE
  Maintainer: ‘Alice Paul <alice_paul@brown.edu>’
  
  New maintainer:
    Alice Paul <alice_paul@brown.edu>
  Old maintainer(s):
    Joanna Walsh <joanna_walsh@brown.edu>

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

❯ On fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... [9s/53s] NOTE
  Maintainer: ‘Alice Paul <alice_paul@brown.edu>’
  
  New maintainer:
    Alice Paul <alice_paul@brown.edu>
  Old maintainer(s):
    Joanna Walsh <joanna_walsh@brown.edu>

0 errors ✔ | 0 warnings ✔ | 5 notes ✖
