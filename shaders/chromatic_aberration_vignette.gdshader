shader_type canvas_item;

uniform float effect_intensity: hint_range(0.0, 16.0, 1.0) = 4.0;
uniform float vignette_radius: hint_range(0.0, 2.0, 0.1) = 1.0;
uniform float falloff_size: hint_range(0.0, 1.0, 0.1) = 0.2;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void fragment() {
	vec2 uv = 2.0 * (SCREEN_UV - vec2(0.5));
	float dist = length(uv);
	float x = smoothstep(vignette_radius - falloff_size, vignette_radius + falloff_size, dist) * effect_intensity;
	
	float r = texture(screen_texture, fma(vec2(-x, 0.0), SCREEN_PIXEL_SIZE, SCREEN_UV), 0.0).r;
	float g = texture(screen_texture, fma(vec2(0.0), SCREEN_PIXEL_SIZE, SCREEN_UV), 0.0).g;
	float b = texture(screen_texture, fma(vec2(x, 0.0), SCREEN_PIXEL_SIZE, SCREEN_UV), 0.0).b;
	float a = texture(screen_texture, SCREEN_UV).a;
	
	COLOR = vec4(r, g, b, a);
}
