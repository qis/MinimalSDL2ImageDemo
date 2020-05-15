config = debug
target = MinimalExample

all: build/linux/$(config)/rules.ninja
	@cmake --build build/linux/$(config)

run: build/linux/$(config)/rules.ninja
	@cmake --build build/linux/$(config)
	@cmake -E chdir build/linux/$(config) ./$(target)

install: build/linux/release/rules.ninja
	@cmake --build build/linux/release --target install

format:
	@cmake -P res/format.cmake

clean:
	@cmake -E remove_directory build/linux

build/linux/debug/rules.ninja: CMakeLists.txt
	@cmake -GNinja -DCMAKE_BUILD_TYPE=Debug \
	  -DCMAKE_INSTALL_PREFIX="$(CURDIR)/build/install" \
	  -DCMAKE_TOOLCHAIN_FILE="$(CURDIR)/res/toolchain.cmake" \
	  -B build/linux/debug

build/linux/release/rules.ninja: CMakeLists.txt
	@cmake -GNinja -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX="$(CURDIR)/build/install" \
	  -DCMAKE_TOOLCHAIN_FILE="$(CURDIR)/res/toolchain.cmake" \
	  -B build/linux/release
