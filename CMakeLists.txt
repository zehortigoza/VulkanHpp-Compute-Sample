cmake_minimum_required(VERSION 3.16)

project(VulkanCompute)

find_package(Vulkan REQUIRED)

add_custom_command(
	OUTPUT "${CMAKE_BINARY_DIR}/Square.spv"
	COMMAND glslc -fshader-stage=compute -o ${CMAKE_BINARY_DIR}/Square.spv Square.glsl
	DEPENDS "Square.glsl"
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	COMMENT "Buiding Shaders"
)
add_custom_target(ComputeShader DEPENDS "${CMAKE_BINARY_DIR}/Square.spv")

add_executable(VulkanCompute "main.cpp")
target_link_libraries(VulkanCompute PRIVATE Vulkan::Vulkan)
add_dependencies(VulkanCompute ComputeShader)

