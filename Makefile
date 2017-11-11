SRC := src
INC := include
TEST_DIR := unittest
OBJ := obj

INCLUDES := -Iinlcude \

TARGET := libhash_sathesh.a
UT_BIN := ut_bin

CFLAGS := -Wall -Werror

all: $(TARGET) $(UNIT_TEST)

$(OBJ):
	mkdir $(OBJ)

$(OBJ)/%.o: $(SRC)/%.c | $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(TARGET): $(OBJ)/%.o
	ar rcs $@ $^ 

$(TEST_OBJ)/%.o: $(TEST_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(UNIT_TEST): $(TARGET) $(TEST_OBJ)
	$(CC) $(CFLAGS) -o $@ $^
