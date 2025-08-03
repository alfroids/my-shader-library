shader_type canvas_item;

uniform float blink_intensity: hint_range(0.0, 1.0, 0.1) = 1.0;
uniform vec3 blink_color: source_color = vec3(1.0);

void fragment() {
	COLOR = mix(COLOR, vec4(blink_color, COLOR.a), blink_intensity);
}
