shader_type canvas_item;

uniform vec4 flash_color: source_color = vec4(1.0);
uniform float flash_speed: hint_range(0.0, 50.0) = 50;
uniform float flash_strength: hint_range(0.0, 1.0) = 0.5;
uniform bool flash = false;

void fragment() {
	if (flash) {
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color.rgb, flash_color.rgb, cos(TIME * flash_speed) * flash_strength);
	COLOR = color;
	}
}
