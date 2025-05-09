RSRC                    VisualShader            ��1��Y�\                                            j      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports    linked_parent_graph_frame    parameter_name 
   qualifier    default_value_enabled    default_value    script    input_name    hint    min    max    step 	   operator    op_type 	   function    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/2/node    nodes/vertex/2/position    nodes/vertex/3/node    nodes/vertex/3/position    nodes/vertex/4/node    nodes/vertex/4/position    nodes/vertex/5/node    nodes/vertex/5/position    nodes/vertex/6/node    nodes/vertex/6/position    nodes/vertex/7/node    nodes/vertex/7/position    nodes/vertex/8/node    nodes/vertex/8/position    nodes/vertex/9/node    nodes/vertex/9/position    nodes/vertex/10/node    nodes/vertex/10/position    nodes/vertex/11/node    nodes/vertex/11/position    nodes/vertex/12/node    nodes/vertex/12/position    nodes/vertex/13/node    nodes/vertex/13/position    nodes/vertex/14/node    nodes/vertex/14/position    nodes/vertex/15/node    nodes/vertex/15/position    nodes/vertex/16/node    nodes/vertex/16/position    nodes/vertex/17/node    nodes/vertex/17/position    nodes/vertex/18/node    nodes/vertex/18/position    nodes/vertex/19/node    nodes/vertex/19/position    nodes/vertex/20/node    nodes/vertex/20/position    nodes/vertex/21/node    nodes/vertex/21/position    nodes/vertex/22/node    nodes/vertex/22/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        ,   local://VisualShaderNodeVec3Parameter_lmors B      $   local://VisualShaderNodeInput_xh45h �      $   local://VisualShaderNodeInput_0xdi0 �      $   local://VisualShaderNodeInput_hp646 �      $   local://VisualShaderNodeInput_t62cd 4      $   local://VisualShaderNodeInput_yfmrk m      -   local://VisualShaderNodeFloatParameter_dsosu �      -   local://VisualShaderNodeFloatParameter_sop5a �      /   local://VisualShaderNodeTransformVecMult_cvgmr /      -   local://VisualShaderNodeVectorDistance_eoc0q `      )   local://VisualShaderNodeSmoothStep_4ylgk �      .   local://VisualShaderNodeVectorDecompose_vug0r �      (   local://VisualShaderNodeFloatFunc_c2rcd �      '   local://VisualShaderNodeVectorOp_nf80k        '   local://VisualShaderNodeVectorOp_0uj8d U      )   local://VisualShaderNodeVectorFunc_fxeat �      /   local://VisualShaderNodeTransformVecMult_vaqr6 �      '   local://VisualShaderNodeVectorOp_i6q02 .      '   local://VisualShaderNodeVectorOp_2jwj5 c      '   local://VisualShaderNodeVectorOp_fis5g �      '   local://VisualShaderNodeVectorOp_7kvqc �      !   res://resources/displacement.res �         VisualShaderNodeVec3Parameter             player_pos 
         VisualShaderNodeInput             model_matrix 
         VisualShaderNodeInput             vertex 
         VisualShaderNodeInput             uv 
         VisualShaderNodeInput             vertex 
         VisualShaderNodeInput             model_matrix 
         VisualShaderNodeFloatParameter             radius 
         VisualShaderNodeFloatParameter             power 
      !   VisualShaderNodeTransformVecMult    
         VisualShaderNodeVectorDistance    
         VisualShaderNodeSmoothStep    
          VisualShaderNodeVectorDecompose    
         VisualShaderNodeFloatFunc             
         VisualShaderNodeVectorOp             
         VisualShaderNodeVectorOp                                              �?      �?         
         VisualShaderNodeVectorFunc    
      !   VisualShaderNodeTransformVecMult             
         VisualShaderNodeVectorOp             
         VisualShaderNodeVectorOp             
         VisualShaderNodeVectorOp             
         VisualShaderNodeVectorOp    
         VisualShader /         H  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_disabled, diffuse_lambert, specular_schlick_ggx;

uniform vec3 player_pos;
uniform float radius;
uniform float power;



void vertex() {
// Input:6
	vec3 n_out6p0 = VERTEX;


// Input:7
	mat4 n_out7p0 = MODEL_MATRIX;


// Input:3
	mat4 n_out3p0 = MODEL_MATRIX;


// Input:4
	vec3 n_out4p0 = VERTEX;


// TransformVectorMult:10
	vec3 n_out10p0 = (n_out3p0 * vec4(n_out4p0, 1.0)).xyz;


// Vector3Parameter:2
	vec3 n_out2p0 = player_pos;


// VectorOp:15
	vec3 n_out15p0 = n_out10p0 - n_out2p0;


// VectorOp:16
	vec3 n_in16p1 = vec3(1.00000, 0.00000, 1.00000);
	vec3 n_out16p0 = n_out15p0 * n_in16p1;


// VectorFunc:17
	vec3 n_out17p0 = normalize(n_out16p0);


// TransformVectorMult:18
	vec3 n_out18p0 = (vec4(n_out17p0, 1.0) * n_out7p0).xyz;


// Input:5
	vec2 n_out5p0 = UV;


// VectorDecompose:13
	float n_out13p0 = vec3(n_out5p0, 0.0).x;
	float n_out13p1 = vec3(n_out5p0, 0.0).y;
	float n_out13p2 = vec3(n_out5p0, 0.0).z;


// FloatFunc:14
	float n_out14p0 = 1.0 - n_out13p1;


// VectorOp:19
	vec3 n_out19p0 = n_out18p0 * vec3(n_out14p0);


// FloatParameter:8
	float n_out8p0 = radius;


// Distance:11
	float n_out11p0 = distance(n_out2p0, n_out10p0);


// SmoothStep:12
	float n_in12p1 = 1.00000;
	float n_out12p0 = smoothstep(n_out8p0, n_in12p1, n_out11p0);


// VectorOp:20
	vec3 n_out20p0 = n_out19p0 * vec3(n_out12p0);


// FloatParameter:9
	float n_out9p0 = power;


// VectorOp:21
	vec3 n_out21p0 = n_out20p0 * vec3(n_out9p0);


// VectorOp:22
	vec3 n_out22p0 = n_out6p0 + n_out21p0;


// Output:0
	VERTEX = n_out22p0;


}
          ,   
    @E  D-             .   
   #.���2�/            0   
   #)�����1            2   
   #3Ĉ��3            4   
   #3�W��5            6   
   #3����A7            8   
   #)�xT$C9            :   
   #)�<*�C;            <   
   #)�D=            >   
   F������?         	   @   
   @�����A         
   B   
   �s#C��-�C            D   
   F�È��E            F   
   @��W��G            H   
   �/��4$�CI            J   
   ���B<*�CK            L   
   �C<*�CM            N   
   ��D<*�CO            P   
   ��aD<*�CQ            R   
   |�D<*�CS            T   
   |�D<*�CU            V   
   |n�D<*�CW       \          
             
       
                                                                                 
                                                                                                                                                      	                                                       
      RSRC