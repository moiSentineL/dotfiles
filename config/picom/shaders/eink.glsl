// eink_dither.glsl - Lightweight e-ink style fragment shader for Picom
// Author: ChatGPT x Nibir
// Style: Monochrome + Bayer Dithering (no animation, ghosting, or slow refresh)

#version 330 core

in vec2 texcoord;
out vec4 fragColor;

uniform sampler2D tex;

float bayerDither(vec2 uv) {
    int x = int(mod(uv.x * 4.0, 4.0));
    int y = int(mod(uv.y * 4.0, 4.0));
    int index = x + y * 4;

    float bayer[16] = float[](
        0.0,  8.0,  2.0, 10.0,
        12.0, 4.0, 14.0, 6.0,
        3.0, 11.0, 1.0,  9.0,
        15.0, 7.0, 13.0, 5.0
    );

    return bayer[index] / 16.0;
}

void main() {
    vec3 color = texture(tex, texcoord).rgb;
    float gray = dot(color, vec3(0.299, 0.587, 0.114)); // Perceptual grayscale

    float threshold = bayerDither(texcoord);
    float bw = gray < threshold ? 0.0 : 1.0;

    fragColor = vec4(vec3(bw), 1.0); // Output final monochrome color
}

