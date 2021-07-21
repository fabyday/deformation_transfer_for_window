
# Hunter stuff must be included before project()
if (WIN32)
  set(HUNTER_ENABLED_DEFAULT ON)
else()
  set(HUNTER_ENABLED_DEFAULT OFF)
endif()
option(HUNTER_ENABLED "Enable Hunter package manager support" ${HUNTER_ENABLED_DEFAULT})
include("cmake/HunterGate.cmake")
HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.244.tar.gz"
    SHA1 "2c0f491fd0b80f7b09e3d21adb97237161ef9835"
)
cmake_minimum_required(VERSION 3.1)
project(deformation_transfer C)



include(CheckLanguage)
check_language(Fortran)
if(CMAKE_Fortran_COMPILER)
  enable_language(Fortran)
else()
  # if there are undefined references like "undefined reference to '_gfortran_st_write'"
  # try to install a fortran compiler like gfortran
  message(STATUS "No Fortran support. If there are link errors try installing gfortran (or similar)")
endif()

# ------------------------------------------------------------------
# Detect SuiteSparse libraries:
# Either tell Hunter to provide SuiteSparse for you or manually
# define where SuiteSparse and LAPACK can be found.
# To activate Hunter use the following commandline
# cmake -S . -B _build -DHUNTER_ENABLED=ON
#
# In the manual case, if not found automatically, set SuiteSparse_DIR
# in CMake to the directory containing suitesparse-config.cmake located
# in the installed directory.
# for example use the following command line
# cmake -S . -B _build -DSuiteSparse_DIR=../../_install/lib/cmake/suitesparse-5.1.0
# ------------------------------------------------------------------

hunter_add_package(SuiteSparse)
find_package(SuiteSparse CONFIG REQUIRED)


# add_subdirectory(ext/suitesparse-metis-for-windows)

find_package(OpenGL REQUIRED )
#find_package(freeglut REQUIRED freeglut-3.2.1.tar/freeglut-3.2.1 )
add_subdirectory(freeglut-3.2.1.tar/freeglut-3.2.1)
#set(GLUT_INCLUDE_DIR freeglut-3.2.1.tar/freeglut-3.2.1/includec
include_directories(freeglut-3.2.1.tar/freeglut-3.2.1/include)


# find_package(GLUT REQUIRED)
if(OPENGL_FOUND)
    include_directories(${OPENGL_INCLUDE_DIRS})
    link_libraries(${OPENGL_LIBRARIES})
endif()
add_subdirectory(corres_resolve)
add_subdirectory(dtrans)
add_subdirectory(modelviz)
add_subdirectory(corrstool)
