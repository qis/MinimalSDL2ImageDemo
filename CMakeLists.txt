cmake_minimum_required(VERSION 3.5)
project(MinimalExample CXX)

set(CMAKE_CXX_STANDARD 11) 

set(SOURCE_FILES src/main.cpp)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)

find_package(SDL2 REQUIRED)
find_package(SDL2_image REQUIRED)

include_directories(${SDL2_INCLUDE_DIR})
include_directories(${SDL2_IMAGE_INCLUDE_DIRS})

add_executable(MinimalExample ${SOURCE_FILES})
target_link_libraries(MinimalExample ${SDL2_LIBRARY}  ${SDL2_IMAGE_LIBRARIES})


add_custom_command( TARGET MinimalExample POST_BUILD
					COMMAND ${CMAKE_COMMAND} -E copy_directory
				${CMAKE_SOURCE_DIR}/data/ $<TARGET_FILE_DIR:MinimalExample>/data/)