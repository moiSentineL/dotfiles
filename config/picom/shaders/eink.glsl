#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

vec4 default_post_processing(vec4 c);

// Tunable softness and warmth
float soft_contrast(float v) {
    return clamp((v - 0.5) * 1.2 + 0.5, 0.1, 0.95);
}

vec3 apply_warm_tint(float luminance, float warmth_amount) {
    // Base grayscale
    vec3 gray = vec3(luminance);
    // Sepia-ish warm tint
    vec3 warm = vec3(0.85, 0.78, 0.7);
    return mix(gray, warm, warmth_amount);
}

vec4 window_shader() {
	vec2 texsize = textureSize(tex, 0);
	vec4 color = texture(tex, texcoord / texsize);

	// Invert for dark mode feel
	vec3 inv_color = vec3(1.0) - color.rgb;

	// Grayscale conversion on inverted
	float luminance = 0.2126 * inv_color.r + 0.7152 * inv_color.g + 0.0722 * inv_color.b;
	luminance = soft_contrast(luminance);

	// Apply warmth (set 0.0 to 0.2 based on taste)
	vec3 warmed = apply_warm_tint(luminance, 0.08);

	// Invert back to dark mode
	vec3 final_color = vec3(1.0) - warmed;

	return default_post_processing(vec4(final_color * opacity, color.a * opacity));
}
