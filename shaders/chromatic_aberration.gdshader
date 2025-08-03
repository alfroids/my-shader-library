shader_type canvas_item;

uniform float effect_intensity: hint_range(0.0, 16.0, 1.0) = 1.0;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void fragment() {
	float r = texture(screen_texture, fma(vec2(-effect_intensity, 0.0), SCREEN_PIXEL_SIZE, SCREEN_UV), 0.0).r;
	float g = texture(screen_texture, fma(vec2(0.0), SCREEN_PIXEL_SIZE, SCREEN_UV), 0.0).g;
	float b = texture(screen_texture, fma(vec2(effect_intensity, 0.0), SCREEN_PIXEL_SIZE, SCREEN_UV), 0.0).b;
	float a = texture(screen_texture, SCREEN_UV).a;

	COLOR = vec4(r, g, b, a);
}
