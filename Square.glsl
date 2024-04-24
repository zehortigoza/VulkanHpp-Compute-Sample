#version 450

layout(binding = 0) readonly buffer InBuffer {
   int inbuffer[ ];
};

layout(binding = 1) buffer OutXBuffer {
   int outxbuffer[ ];
};

layout(binding = 2) buffer OutYBuffer {
   int outybuffer[ ];
};

layout(binding = 3) buffer OutZBuffer {
   int outzbuffer[ ];
};

layout (local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

void main()
{
   uint index_x = gl_GlobalInvocationID.x;
   uint index_y = gl_GlobalInvocationID.y;
   uint index_z = gl_GlobalInvocationID.z;
   uint num_work_groups_x = gl_NumWorkGroups.x;
   uint workgroup_id_x = gl_WorkGroupID.x;
   uint out_index = (index_x + (index_y * 1) + (index_z * (1 * 1)));

   //outbuffer[index] = (inbuffer[index] * inbuffer[index]) + 0;
   //outbuffer[index_x] = int(index_x) + int(index_y);
   //outbuffer[index_x] = int(num_work_groups_x);

   outxbuffer[out_index] = int(index_x);
   outybuffer[out_index] = int(index_y);
   outzbuffer[out_index] = int(index_z);
}