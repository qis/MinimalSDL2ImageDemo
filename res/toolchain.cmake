# Determine vcpkg root directory.
if(NOT DEFINED VCPKG_ROOT)
  if(DEFINED ENV{VCPKG_ROOT})
    set(VCPKG_ROOT "$ENV{VCPKG_ROOT}")
  else()
    find_program(VCPKG vcpkg NO_CMAKE_PATH)
    get_filename_component(VCPKG_ROOT "${VCPKG}" DIRECTORY)
    if(NOT VCPKG_ROOT)
      message(FATAL_ERROR "Could not find executable: vcpkg")
    endif()
  endif()
endif()

# Determine vcpkg target triplet.
if(NOT VCPKG_TARGET_TRIPLET)
  if(DEFINED ENV{VCPKG_DEFAULT_TRIPLET})
    set(VCPKG_TARGET_TRIPLET "$ENV{VCPKG_DEFAULT_TRIPLET}" CACHE STRING "")
  else()
    if(WIN32)
      set(VCPKG_TARGET_TRIPLET "x64-windows" CACHE STRING "")
    else()
      set(VCPKG_TARGET_TRIPLET "x64-linux" CACHE STRING "")
    endif()
  endif()
endif()

# Include vcpkg triplet.
include("${VCPKG_ROOT}/triplets/${VCPKG_TARGET_TRIPLET}.cmake")

# Chainload internal vcpkg toolchain.
if(NOT VCPKG_CHAINLOAD_TOOLCHAIN_FILE)
  if(WIN32)
    set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${VCPKG_ROOT}/scripts/toolchains/windows.cmake")
  else()
    set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${VCPKG_ROOT}/scripts/toolchains/linux.cmake")
  endif()
endif()

# Include vcpkg toolchain.
include("${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
