#version 450

layout(binding = 0) readonly buffer InBuffer {
   int inbuffer[ ];
};

layout(binding = 1) buffer OutBuffer {
   int outbuffer[ ];
};

layout (local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

void main()
{
    uint index = gl_GlobalInvocationID.x;

    outbuffer[index] = inbuffer[index] * inbuffer[index];
}