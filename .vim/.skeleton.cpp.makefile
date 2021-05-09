PROJECT = Project3

EXE = p3
SRC_DIR = src
EXT_DIR = external
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# Compilation configuration
REQUIRED_WARNINGS = -Wall -Werror

# https://github.com/lefticus/cppbestpractices/blob/master/02-Use_the_Tools_Available.md#gcc--clang
EXTRA_WARNINGS = -Wextra -Wshadow -Wnon-virtual-dtor -Wold-style-cast -Wcast-align -Wunused
EXTRA_WARNINGS += -Woverloaded-virtual -Wpedantic -Wconversion -Wsign-conversion
EXTRA_WARNINGS += -Wnull-dereference -Wdouble-promotion -Wformat=2

# Detect if CXX is clang++ or g++ (order matters)
# https://stackoverflow.com/a/55320310/14737755
ifneq '' '$(findstring clang++, $(CXX))'
    # clang
else ifneq '' '$(findstring g++, $(CXX))'
    # gcc
    EXTRA_WARNINGS += -Wmisleading-indentation -Wduplicated-cond -Wduplicated-branches
    EXTRA_WARNINGS += -Wlogical-op -Wuseless-cast
endif


FLAGS = -std=c++2a -pthread
CXXFLAGS += $(REQUIRED_WARNINGS) $(EXTRA_WARNINGS)

# Configure release vs debug build targets
DEBUG_FLAGS = -O0 -g
RELEASE_FLAGS = -O3 -DNDEBUG -s

ifeq ($(BUILD), debug)
	CXXFLAGS += $(DEBUG_FLAGS)
else
	CXXFLAGS += $(RELEASE_FLAGS)
endif

# Makefile recipes
all: project

project: $(SOURCES)
	$(CXX) $(FLAGS) $(CXXFLAGS) $(EXT_DIR:%=-isystem%) $(SOURCES) -o $(EXE)

debug:
	make "BUILD=debug"

clean:
	$(RM) $(EXE) $(TEST_EXE)

.PHONY = all project debug clean
