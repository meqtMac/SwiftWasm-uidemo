//
//  FragmentShaderSource.swift
//
//
//  Created by 蒋艺 on 2024/4/7.
//


internal let u_sampler_name = "u_sampler"

internal let fragmentShaderSource =
"""
#version 300 es

#ifdef GL_ES
    precision mediump float;
#endif

uniform sampler2D \(u_sampler_name);

in vec4 v_rgba_in_gamma;
in vec2 v_tc;
out vec4 f_color;

// 0-1 sRGB gamma  from  0-1 linear
vec3 srgb_gamma_from_linear(vec3 rgb) {
    bvec3 cutoff = lessThan(rgb, vec3(0.0031308));
    vec3 lower = rgb * vec3(12.92);
    vec3 higher = vec3(1.055) * pow(rgb, vec3(1.0 / 2.4)) - vec3(0.055);
    return mix(higher, lower, vec3(cutoff));
}

// 0-1 sRGBA gamma  from  0-1 linear
vec4 srgba_gamma_from_linear(vec4 rgba) {
    return vec4(srgb_gamma_from_linear(rgba.rgb), rgba.a);
}

void main() {
//#if SRGB_TEXTURES
    vec4 texture_in_gamma = srgba_gamma_from_linear(texture(\(u_sampler_name), v_tc));
//#else
//    vec4 texture_in_gamma = texture(\(u_sampler_name), v_tc);
//#endif

    // We multiply the colors in gamma space, because that's the only way to get text to look right.
//    f_color = v_rgba_in_gamma * texture_in_gamma;
    f_color = texture_in_gamma;
}
"""

