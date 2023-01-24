COMPILER := g++
FLAGS := -O3
COMPILE := $(COMPILER) $(FLAGS)

INCLUDE := ./include
SRC := ./src
BIN := ./bin

SOURCE_FILES := $(notdir $(shell find $(SRC) -name "*.cpp"))
DEP_FILES := $(patsubst %.cpp, %.o, $(SOURCE_FILES))

vpath %.hpp $(INCLUDE)
vpath %.cpp $(SRC)
vpath %.o $(BIN)

all: build run;


build: ./bin/main.out;


run: ./bin/main.out
	./bin/main.out


./bin/main.out: $(BIN) $(DEP_FILES) main.cpp
	$(COMPILE) main.cpp $(patsubst %, $(BIN)/%, $(DEP_FILES)) -o ./bin/main.out


%.o: %.cpp 
	$(COMPILE) -c $^ -o $(BIN)/$@


$(BIN):
	mkdir $(BIN)


clean: 
	rm -rf ./bin/*


.PHONY: all build run clean;
