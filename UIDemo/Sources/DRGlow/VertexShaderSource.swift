//
//  VertexShaderSource.swift
//
//
//  Created by 蒋艺 on 2024/4/7.
//
internal let uScreenSize = "u_screen_size"
internal let aPos = "a_pos"
internal let attributeColor = "a_srgba"
internal let aTc  = "a_tc"

internal let vertexShaderSource =
"""
#if NEW_SHADER_INTERFACE
    #define I in
    #define O out
    #define V(x) x
#else
    #define I attribute
    #define O varying
    #define V(x) vec3(x)
#endif

#ifdef GL_ES
    precision mediump float;
#endif

uniform vec2 \(uScreenSize);
I vec2 \(aPos);
I vec4 \(attributeColor); // 0-255 sRGB
I vec2 \(aTc);
O vec4 v_rgba_in_gamma;
O vec2 v_tc;

void main() {
    gl_Position = vec4(
                      2.0 * \(aPos).x / \(uScreenSize).x - 1.0,
                      1.0 - 2.0 * \(aPos).y / \(uScreenSize).y,
                      0.0,
                      1.0);
    v_rgba_in_gamma = \(attributeColor) / 255.0;
    v_tc = \(aTc);
}
"""


