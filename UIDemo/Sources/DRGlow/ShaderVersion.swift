//
//  ShaderVersion.swift
//
//
//  Created by 蒋艺 on 2024/4/7.
//

import WebGL1
import WebGL2
import Foundation

public enum ShaderVersion: Equatable {
    case gl120

    /// OpenGL 1.4 or later
    case gl140

    /// e.g. WebGL1
    case es100

    /// e.g. WebGL2
    case es300
}

extension ShaderVersion {
    public static func get(gl: WebGL2RenderingContext) -> Self {
        let shading_lang_string = gl.getParameter(pname: .SHADING_LANGUAGE_VERSION).string ?? ""
        let shader_version = Self.parse(glsl_version: shading_lang_string)
        debugPrint("Shader version:\(shader_version) \(shading_lang_string)")
        return shader_version
    }   

    @inlinable
    package static func parse(glsl_version: String) -> Self {
       guard let start = glsl_version.firstIndex(where: { $0.isASCII && $0.isNumber }) else {
            fatalError("")
        }

        let es = glsl_version[..<start].contains(" ES ")
        let ver = glsl_version[start...]
            .split(separator: " ")
            .first.map(String.init) ?? String(glsl_version[start...])

        let versions = ver.split(separator: ".").prefix(2).compactMap { UInt8($0) }
        guard let maj = versions.first, let min = versions.last else {
            return es ? .es100 : .gl120
        }
        if es {
            return maj >= 3 ? .es300 : .es100
        } else if maj > 1 || (maj == 1 && min >= 40) {
            return .gl140
        } else {
            return .gl120
        }
    }
    
    /// Goes on top of the shader.
    public func version_declaration() -> StaticString {
        switch self {
            case .gl120:
            return "#version 120\n"
            case .gl140:
            return "#version 140\n"
            case .es100:
            return "#version 100\n"
            case .es300:
            return "#version 300 es\n"
        }
    }

        /// If true, use `in/out`. If `false`, use `varying` and `gl_FragColor`.
    public func is_new_shader_interface() -> Bool {
        switch self {
            case .gl120, .es100:
            return false
            case .gl140, .es300:
            return true
        }
    }


    public func is_embedded() -> Bool {
       switch self {
            case .gl120, .gl140: 
            return false
            case .es100, .es300:
            return true
        }
    }


}