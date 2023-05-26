.SILENT:
SHELL=/bin/bash
RED=\033[0;31m
GRN=\033[0;32m
YLW=\033[0;33m
BLU=\033[0;34m
STP=\e[0m
DAT="%H:%M:%S.%3N"
pass=(echo -e "$(shell date +$(DAT)): INFO: $1 $(GRN)PASSED!$(STP)")
fail=(echo -e "$(shell date +$(DAT)): $(RED)** ERROR ** :$(STP) $1 $(RED)FAILED!$(STP)")
start=(echo -e "$(shell date +$(DAT)): INFO: $1 $(BLU)START$(STP)")
inf=(echo -e "$(shell date +$(DAT)): INFO: $1")
warn=(echo -e "$(shell date +$(DAT)): $(YLW)WARNING:$(STP) $1")
err=(echo -e "$(shell date +$(DAT)): $(RED)** ERROR ** :$(STP) $1")
pdat=(echo -e "$(shell date +$(DAT)): INFO: Starting build on $(shell \
        date +"%A %B %d, %Y") at $(shell date +"%H:%M %Z") ")



help:
	printf "Available targets:\n\n" ;
	awk '/^[a-zA-Z\-_0-9%:\\]+/ { \
      helpMessage = match(lastLine, /^## (.*)/) ; \
      if (helpMessage) { \
        helpCommand = $$1 ; \
        helpMessage = substr(lastLine, RSTART + 3, RLENGTH) ; \
        gsub("\\\\", "", helpCommand) ; \
        gsub(":+$$", "", helpCommand) ; \
        if (length(helpCommand)>$(help_target_name_limit)) \
          helpCommand=substr(helpCommand,0,$(help_target_name_limit))"←" ; \
        printf " \x1b[32;01m%-$(help_target_desc_start)s\x1b[0m |%s\n", helpCommand, helpMessage ; \
      } \
    } \
    { lastLine = $$0 }' $(MAKEFILE_LIST) ;
