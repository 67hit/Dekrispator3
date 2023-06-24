ifeq ($(OS),Windows_NT)
  ifeq ($(shell uname -s),) # not in a bash-like shell
	CLEANUP = del /F /Q
	MKDIR = mkdir
  else # in a bash-like shell, like msys
	CLEANUP = rm -f
	MKDIR = mkdir -p
  endif
	TARGET_EXTENSION=exe
else
	CLEANUP = rm -f
	MKDIR = mkdir -p  # -p will add parent directories as needed
	TARGET_EXTENSION=out
endif

.PHONY: clean
.PHONY: test

TEST_PREFIX:=test_  # test files will be assumed to start with this string

PATH_UNITY = unity/src/
PATH_SRC = src/
PATH_TEST = test/
PATH_BUILD = build/
PATH_DEPS = build/depends/
PATH_OBJS = build/objs/
PATH_RESULTS = build/results/

BUILD_PATHS = $(PATH_BUILD) $(PATH_DEPS) $(PATH_OBJS) $(PATH_RESULTS)

SRC_TEST = $(wildcard $(PATH_TEST)*.c)

COMPILE = gcc -c
LINK = gcc
LINK_LIBS = -lm -lc # On the command line this needs to *FOLLOW* the object files!
DEPEND = gcc -MM -MG -MF
CFLAGS = -I. -I$(PATH_UNITY) -I$(PATH_SRC) -DTEST

RESULTS = $(patsubst $(PATH_TEST)$(TEST_PREFIX)%.c,$(PATH_RESULTS)$(TEST_PREFIX)%.txt,$(SRC_TEST) )

# -s will suppress messages about non-existent or unreadable files
PASSED = `grep -s PASS $(PATH_RESULTS)*.txt`
FAIL = `grep -s FAIL $(PATH_RESULTS)*.txt`
IGNORE = `grep -s IGNORE $(PATH_RESULTS)*.txt`

test: $(BUILD_PATHS) $(RESULTS)
	@echo "-----------------------\nIGNORES:\n-----------------------"
	@echo "$(IGNORE)"
	@echo "-----------------------\nFAILURES:\n-----------------------"
	@echo "$(FAIL)"
	@echo "-----------------------\nPASSED:\n-----------------------"
	@echo "$(PASSED)"
	@echo "\nDONE"

# run the test executables to obtain the test results
# also write the errors into the result files
$(PATH_RESULTS)%.txt: $(PATH_BUILD)%.$(TARGET_EXTENSION)
	-./$< > $@ 2>&1

$(PATH_BUILD)test_%.$(TARGET_EXTENSION): $(PATH_OBJS)$(TEST_PREFIX)%.o $(PATH_OBJS)%.o $(PATH_OBJS)unity.o $(PATH_DEPS)$(TEST_PREFIX)%.d
	$(LINK) -o $@ $^ $(LINK_LIBS)

## multiple "::" dependences for the same target will be treated in
$(PATH_OBJS)%.o:: $(PATH_TEST)%.c
	$(COMPILE) $(CFLAGS) $< -o $@

$(PATH_OBJS)%.o:: $(PATH_SRC)%.c
	$(COMPILE) $(CFLAGS) $< -o $@

$(PATH_OBJS)%.o:: $(PATH_UNITY)%.c $(PATH_UNITY)%.h
	$(COMPILE) $(CFLAGS) $< -o $@
## end of repeated same target

$(PATH_DEPS)%.d:: $(PATH_TEST)%.c
	$(DEPEND) $@ $<

$(PATH_BUILD):
	$(MKDIR) $(PATH_BUILD)

$(PATH_DEPS):
	$(MKDIR) $(PATH_DEPS)

$(PATH_OBJS):
	$(MKDIR) $(PATH_OBJS)

$(PATH_RESULTS):
	$(MKDIR) $(PATH_RESULTS)

clean:
	$(CLEANUP) $(PATH_OBJS)*.o
	$(CLEANUP) $(PATH_BUILD)*.$(TARGET_EXTENSION)
	$(CLEANUP) $(PATH_RESULTS)*.txt

## .PRECIOUS - do not delete intermediate files when make is interrupted by a signal
## (Other interruptions, like an error will still delete)
.PRECIOUS: $(PATH_BUILD)$(TEST_PREFIX)%.$(TARGET_EXTENSION)
.PRECIOUS: $(PATH_DEPS)%.d
.PRECIOUS: $(PATH_OBJS)%.o
.PRECIOUS: $(PATH_RESULTS)%.txt
