//
//  File.swift
//  
//
//  Created by 蒋艺 on 2024/3/26.
//


/// The UV coordinate of a white region of the texture mesh.
/// The default egui texture has the top-left corner pixel fully white.
/// You need need use a clamping texture sampler for this to work
/// (so it doesn't do bilinear blending with bottom right corner).
public let WHITE_UV: Pos2 = Pos2(0, 0)

