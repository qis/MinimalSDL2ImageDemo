cmake_minimum_required(VERSION 3.14 FATAL_ERROR)
project(MinimalExample VERSION 0.1.0 LANGUAGES CXX)

file(GLOB_RECURSE sources src/*.[hc]pp)
add_executable(MinimalExample ${sources} src/main.manifest)
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)

find_package(SDL2 CONFIG REQUIRED)
target_link_libraries(MinimalExample PRIVATE SDL2::SDL2 SDL2::SDL2main)

find_package(sdl2-image CONFIG REQUIRED)
target_link_libraries(MinimalExample PRIVATE SDL2::SDL2_image)

find_package(PNG REQUIRED)
target_link_libraries(MinimalExample PRIVATE PNG::PNG)

add_custom_command(TARGET MinimalExample POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory
  ${CMAKE_SOURCE_DIR}/data/ $<TARGET_FILE_DIR:MinimalExample>/data/)
