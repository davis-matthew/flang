#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#

########## Make rule for test pre10  ########


pre10: run
FFLAGS += -Mpreprocess
	

build:  $(SRC)/pre10.f90
	-$(RM) pre10.$(EXESUFFIX) core *.d *.mod FOR*.DAT FTN* ftn* fort.*
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/check.c -o check.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/pre10.f90 -o pre10.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) pre10.$(OBJX) check.$(OBJX) $(LIBS) -o pre10.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test pre10
	pre10.$(EXESUFFIX)

verify: ;

pre10.run: run

