// NOTE: Shader automatically converted from Godot Engine 4.4.1.stable.mono's StandardMaterial3D.

shader_type spatial;
render_mode blend_mix, cull_disabled, diffuse_toon, specular_toon;

uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo : source_color, filter_linear_mipmap, repeat_enable;
uniform ivec2 albedo_texture_size;
uniform float alpha_scissor_threshold : hint_range(0.0, 1.0, 0.001);
uniform float point_size : hint_range(0.1, 128.0, 0.1);

uniform float roughness : hint_range(0.0, 1.0);
uniform sampler2D texture_metallic : hint_default_white, filter_linear_mipmap, repeat_enable;
uniform vec4 metallic_texture_channel;
uniform sampler2D texture_roughness : hint_roughness_r, filter_linear_mipmap, repeat_enable;

uniform float specular : hint_range(0.0, 1.0, 0.01);
uniform float metallic : hint_range(0.0, 1.0, 0.01);

// Wind Globals
global uniform vec3 wind_direction;
global uniform float wind_intensity;
global uniform float wind_speed;
uniform sampler2D wind_noise_texture;

varying vec2 texture_uv;
uniform float texture_uv_scale = 1.0;

float get_position_sum(vec3 world_position) {
	return world_position.x + world_position.y + world_position.z;
}

void vertex() {
	texture_uv = UV * texture_uv_scale;
	
	float position_sum = get_position_sum(NODE_POSITION_WORLD);
	
	vec3 model_front_direction = vec3(0.0, 1.0, 0.0);
	vec3 model_side_direction = vec3(0.0, 0.0, 1.0);
	
	float vertex_color_mask = COLOR.r;
	
	mat3 inv_model_matrix = inverse(mat3(MODEL_MATRIX));
	vec3 wind_local_direction = normalize(inv_model_matrix * wind_direction);
	
	float dot_product = dot(model_front_direction, wind_local_direction);
	float side_dot = dot(model_side_direction, wind_local_direction);
	
	float strength = abs(dot_product);
	float push_strength = clamp(strength, 0.01, 1.0);
	float noise_strength = clamp(strength, 0.5, 1.0);
	
	float scroll_direction = -1.0 * sign(side_dot);
	float scroll_speed = wind_speed;
	
	float wind_uv_scale = 0.1;
	float wind_object_offset = position_sum * 0.2;
	
	vec2 wind_uv = vec2(
		VERTEX.z * wind_uv_scale + TIME * scroll_speed * scroll_direction + wind_object_offset,
		VERTEX.y * wind_uv_scale
	);
	
	float wind_noise = texture(wind_noise_texture, wind_uv).r;
	
	// Unpack wind noise, from 0 - 1 range, to -1 1 range
	wind_noise = 2.0 * wind_noise - 1.0;
	
	VERTEX += wind_local_direction * wind_intensity * push_strength * vertex_color_mask;
	VERTEX.x += wind_noise * 0.5 * wind_intensity * noise_strength * vertex_color_mask;
}

void fragment() {
	vec2 base_uv = UV;

	vec4 albedo_tex = texture(texture_albedo, base_uv);

	// Vertex Color Use as Albedo: Enabled
	albedo_tex *= COLOR;

	ALBEDO = albedo.rgb * albedo_tex.rgb;

	float metallic_tex = dot(texture(texture_metallic, base_uv), metallic_texture_channel);
	METALLIC = metallic_tex * metallic;
	SPECULAR = specular;

	vec4 roughness_texture_channel = vec4(1.0, 0.0, 0.0, 0.0);
	float roughness_tex = dot(texture(texture_roughness, base_uv), roughness_texture_channel);
	ROUGHNESS = roughness_tex * roughness;
	ALPHA *= albedo.a * albedo_tex.a;
	ALPHA_SCISSOR_THRESHOLD = alpha_scissor_threshold;
}
