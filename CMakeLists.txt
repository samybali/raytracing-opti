cmake_minimum_required(VERSION 3.15)

project(raytracing-opti)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

file(GLOB_RECURSE SRCS "src/*.cpp" "src/*.cc")

add_executable(raytracer ${SRCS})

target_include_directories(raytracer PRIVATE ${CMAKE_SOURCE_DIR}/external/metal-cpp)

find_library(METAL_FRAMEWORK Metal)
find_library(FOUNDATION_FRAMEWORK Foundation)
find_library(QUARTZCORE_FRAMEWORK QuartzCore)

target_link_libraries(raytracer PRIVATE
    ${METAL_FRAMEWORK}
    ${FOUNDATION_FRAMEWORK}
    ${QUARTZCORE_FRAMEWORK}
)