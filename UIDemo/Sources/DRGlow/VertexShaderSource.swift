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
#version 300 es

#define V(x) x

#ifdef GL_ES
    precision mediump float;
#endif

uniform vec2 \(uScreenSize);
in vec2 \(aPos);
in vec4 \(attributeColor); // 0-255 sRGB
in vec2 \(aTc);
out vec4 v_rgba_in_gamma;
out vec2 v_tc;

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


