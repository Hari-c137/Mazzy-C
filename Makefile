CC = gcc

SRC_DIR = ./src
INC_DIR = ./inc
LIB_DIR = ./lib
OBJ_DIR = ./obj
BIN_DIR = ./bin
TEX_DIR = ./tex

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))

all: release

COMMON_FLAGS = -I$(INC_DIR) -I$(SRC_DIR)
RELEASE_CFLAGS = -Wall -O3 $(COMMON_FLAGS)
DEBUG_CFLAGS   = -Wall -Og -g -DDEBUG -fno-omit-frame-pointer -fno-inline -fno-eliminate-unused-debug-types $(COMMON_FLAGS)

LDFLAGS = -L$(LIB_DIR) -lraylib -lm -ldl -lpthread -lGL 

RELEASE_BIN = $(BIN_DIR)/game
DEBUG_BIN   = $(BIN_DIR)/game_debug

release: CFLAGS=$(RELEASE_CFLAGS)
release: $(RELEASE_BIN) copy_tex
debug: CFLAGS=$(DEBUG_CFLAGS)
debug: $(DEBUG_BIN) copy_tex

$(RELEASE_BIN): $(OBJ_FILES) | $(BIN_DIR)
	$(CC) $(OBJ_FILES) -o $@ $(LDFLAGS)
	strip $@  
$(DEBUG_BIN): $(OBJ_FILES) | $(BIN_DIR)
	$(CC) $(OBJ_FILES) -o $@ $(LDFLAGS)
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

copy_tex: | $(BIN_DIR)
	cp -r $(TEX_DIR) $(BIN_DIR)/

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all release debug clean copy_tex

