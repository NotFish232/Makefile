COMPILER := g++
FLAGS := -O3
COMPILE := $(COMPILER) $(FLAGS)

SRC := ./src
BIN := ./bin


SOURCE_FILES := $(shell find $(SRC)/ -type f -name '*.cpp')
OBJ_FILES := $(patsubst $(SRC)/%.cpp, $(BIN)/%.o, $(SOURCE_FILES))

MAIN_FILE := main.cpp
TEST_FILE := tests.cpp 


all: build run;


build: $(BIN)/main.out $(BIN)/tests.out;


run: $(BIN)/main.out
	$(BIN)/main.out


test: $(BIN)/tests.out
	$(BIN)/tests.out

clean: 
	rm -rf ./bin/*


$(BIN)/main.out: $(OBJ_FILES) $(MAIN_FILE) 
	$(COMPILE) $(MAIN_FILE) $(OBJ_FILES) -o $(BIN)/main.out


$(BIN)/tests.out: $(OBJ_FILES) $(TEST_FILE)
	$(COMPILE) $(TEST_FILE) $(OBJ_FILES) -o $(BIN)/tests.out


$(BIN)/%.o: $(SRC)/%.cpp | $(BIN) 
	$(COMPILE) -c $^ -o $@


$(BIN): 
	mkdir $(BIN)


.PHONY: all build run test clean;
