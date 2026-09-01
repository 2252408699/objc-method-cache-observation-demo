CC := clang
CFLAGS := -fobjc-arc -O0 -Wall -Wextra -Werror
TARGET := build/method_cache_demo
SOURCE := Sources/main.m
.PHONY: all run clean
all: $(TARGET)
$(TARGET): $(SOURCE)
	mkdir -p build
	$(CC) $(CFLAGS) $(SOURCE) -framework Foundation -o $(TARGET)
run: $(TARGET)
	./$(TARGET)
clean:
	rm -rf build
