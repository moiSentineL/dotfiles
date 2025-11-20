#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

uniform float contrast_boost = 1.2;  // 1.0 = default, 1.2 = poppy, 0.8 = chill
uniform float brightness_offset = 0.08;  // -0.1 to darken, +0.1 to lighten

vec4 default_post_processing(vec4 c);

// Slight contrast compression to prevent harsh whites/blacks
float calm_contrast(float l) {
    return clamp((l - 0.5) * 1.1 + 0.5, 0.15, 0.92);
}

vec4 window_shader() {
	vec2 texsize = textureSize(tex, 0);
	vec4 color = texture(tex, texcoord / texsize);

	// Convert to grayscale using luminance
	float luminance = 0.2126 * color.r + 0.7152 * color.g + 0.0722 * color.b;
	luminance = clamp((luminance - 0.5) * contrast_boost + 0.5 + brightness_offset, 0.0, 1.0);

	vec3 grayscale = vec3(luminance);
	return default_post_processing(vec4(grayscale * opacity, color.a * opacity));
}

