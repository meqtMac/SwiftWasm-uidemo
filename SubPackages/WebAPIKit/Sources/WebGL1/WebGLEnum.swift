//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
public extension GLenum {
    @inlinable static var DEPTH_BUFFER_BIT: GLenum { 0x0000_0100 }
    
    @inlinable static var STENCIL_BUFFER_BIT: GLenum { 0x0000_0400 }
    
    @inlinable static var  COLOR_BUFFER_BIT: GLenum { 0x0000_4000 }
    
    @inlinable static var  POINTS: GLenum { 0x0000 }
    
    @inlinable static var  LINES: GLenum { 0x0001 }
    
    @inlinable static var  LINE_LOOP: GLenum { 0x0002 }
    
    @inlinable static var  LINE_STRIP: GLenum { 0x0003 }
    
    @inlinable static var  TRIANGLES: GLenum { 0x0004 }
    
    @inlinable static var  TRIANGLE_STRIP: GLenum { 0x0005 }
    
    @inlinable static var  TRIANGLE_FAN: GLenum { 0x0006 }
    
    @inlinable static var  ZERO: GLenum { 0 }
    
    @inlinable static var  ONE: GLenum { 1 }
    
    @inlinable static var  SRC_COLOR: GLenum { 0x0300 }
    
    @inlinable static var  ONE_MINUS_SRC_COLOR: GLenum { 0x0301 }
    
    @inlinable static var  SRC_ALPHA: GLenum { 0x0302 }
    
    @inlinable static var  ONE_MINUS_SRC_ALPHA: GLenum { 0x0303 }
    
    @inlinable static var  DST_ALPHA: GLenum { 0x0304 }
    
    @inlinable static var  ONE_MINUS_DST_ALPHA: GLenum { 0x0305 }
    
    @inlinable static var  DST_COLOR: GLenum { 0x0306 }
    
    @inlinable static var  ONE_MINUS_DST_COLOR: GLenum { 0x0307 }
    
    @inlinable static var  SRC_ALPHA_SATURATE: GLenum { 0x0308 }
    
    @inlinable static var  FUNC_ADD: GLenum { 0x8006 }
    
    @inlinable static var  BLEND_EQUATION: GLenum { 0x8009 }
    
    @inlinable static var  BLEND_EQUATION_RGB: GLenum { 0x8009 }
    
    @inlinable static var  BLEND_EQUATION_ALPHA: GLenum { 0x883D }
    
    @inlinable static var  FUNC_SUBTRACT: GLenum { 0x800A }
    
    @inlinable static var  FUNC_REVERSE_SUBTRACT: GLenum { 0x800B }
    
    @inlinable static var  BLEND_DST_RGB: GLenum { 0x80C8 }
    
    @inlinable static var  BLEND_SRC_RGB: GLenum { 0x80C9 }
    
    @inlinable static var  BLEND_DST_ALPHA: GLenum { 0x80CA }
    
    @inlinable static var  BLEND_SRC_ALPHA: GLenum { 0x80CB }
    
    @inlinable static var  CONSTANT_COLOR: GLenum { 0x8001 }
    
    @inlinable static var  ONE_MINUS_CONSTANT_COLOR: GLenum { 0x8002 }
    
    @inlinable static var  CONSTANT_ALPHA: GLenum { 0x8003 }
    
    @inlinable static var  ONE_MINUS_CONSTANT_ALPHA: GLenum { 0x8004 }
    
    @inlinable static var  BLEND_COLOR: GLenum { 0x8005 }
    
    @inlinable static var  ARRAY_BUFFER: GLenum { 0x8892 }
    
    @inlinable static var  ELEMENT_ARRAY_BUFFER: GLenum { 0x8893 }
    
    @inlinable static var  ARRAY_BUFFER_BINDING: GLenum { 0x8894 }
    
    @inlinable static var  ELEMENT_ARRAY_BUFFER_BINDING: GLenum { 0x8895 }
    
    @inlinable static var  STREAM_DRAW: GLenum { 0x88E0 }
    
    @inlinable static var  STATIC_DRAW: GLenum { 0x88E4 }
    
    @inlinable static var  DYNAMIC_DRAW: GLenum { 0x88E8 }
    
    @inlinable static var  BUFFER_SIZE: GLenum { 0x8764 }
    
    @inlinable static var  BUFFER_USAGE: GLenum { 0x8765 }
    
    @inlinable static var  CURRENT_VERTEX_ATTRIB: GLenum { 0x8626 }
    
    @inlinable static var  FRONT: GLenum { 0x0404 }
    
    @inlinable static var  BACK: GLenum { 0x0405 }
    
    @inlinable static var  FRONT_AND_BACK: GLenum { 0x0408 }
    
    @inlinable static var  CULL_FACE: GLenum { 0x0B44 }
    
    @inlinable static var  BLEND: GLenum { 0x0BE2 }
    
    @inlinable static var  DITHER: GLenum { 0x0BD0 }
    
    @inlinable static var  STENCIL_TEST: GLenum { 0x0B90 }
    
    @inlinable static var  DEPTH_TEST: GLenum { 0x0B71 }
    
    @inlinable static var  SCISSOR_TEST: GLenum { 0x0C11 }
    
    @inlinable static var  POLYGON_OFFSET_FILL: GLenum { 0x8037 }
    
    @inlinable static var  SAMPLE_ALPHA_TO_COVERAGE: GLenum { 0x809E }
    
    @inlinable static var  SAMPLE_COVERAGE: GLenum { 0x80A0 }
    
    @inlinable static var  NO_ERROR: GLenum { 0 }
    
    @inlinable static var  INVALID_ENUM: GLenum { 0x0500 }
    
    @inlinable static var  INVALID_VALUE: GLenum { 0x0501 }
    
    @inlinable static var  INVALID_OPERATION: GLenum { 0x0502 }
    
    @inlinable static var  OUT_OF_MEMORY: GLenum { 0x0505 }
    
    @inlinable static var  CW: GLenum { 0x0900 }
    
    @inlinable static var  CCW: GLenum { 0x0901 }
    
    @inlinable static var  LINE_WIDTH: GLenum { 0x0B21 }
    
    @inlinable static var  ALIASED_POINT_SIZE_RANGE: GLenum { 0x846D }
    
    @inlinable static var  ALIASED_LINE_WIDTH_RANGE: GLenum { 0x846E }
    
    @inlinable static var  CULL_FACE_MODE: GLenum { 0x0B45 }
    
    @inlinable static var  FRONT_FACE: GLenum { 0x0B46 }
    
    @inlinable static var  DEPTH_RANGE: GLenum { 0x0B70 }
    
    @inlinable static var  DEPTH_WRITEMASK: GLenum { 0x0B72 }
    
    @inlinable static var  DEPTH_CLEAR_VALUE: GLenum { 0x0B73 }
    
    @inlinable static var  DEPTH_FUNC: GLenum { 0x0B74 }
    
    @inlinable static var  STENCIL_CLEAR_VALUE: GLenum { 0x0B91 }
    
    @inlinable static var  STENCIL_FUNC: GLenum { 0x0B92 }
    
    @inlinable static var  STENCIL_FAIL: GLenum { 0x0B94 }
    
    @inlinable static var  STENCIL_PASS_DEPTH_FAIL: GLenum { 0x0B95 }
    
    @inlinable static var  STENCIL_PASS_DEPTH_PASS: GLenum { 0x0B96 }
    
    @inlinable static var  STENCIL_REF: GLenum { 0x0B97 }
    
    @inlinable static var  STENCIL_VALUE_MASK: GLenum { 0x0B93 }
    
    @inlinable static var  STENCIL_WRITEMASK: GLenum { 0x0B98 }
    
    @inlinable static var  STENCIL_BACK_FUNC: GLenum { 0x8800 }
    
    @inlinable static var  STENCIL_BACK_FAIL: GLenum { 0x8801 }
    
    @inlinable static var  STENCIL_BACK_PASS_DEPTH_FAIL: GLenum { 0x8802 }
    
    @inlinable static var  STENCIL_BACK_PASS_DEPTH_PASS: GLenum { 0x8803 }
    
    @inlinable static var  STENCIL_BACK_REF: GLenum { 0x8CA3 }
    
    @inlinable static var  STENCIL_BACK_VALUE_MASK: GLenum { 0x8CA4 }
    
    @inlinable static var  STENCIL_BACK_WRITEMASK: GLenum { 0x8CA5 }
    
    @inlinable static var  VIEWPORT: GLenum { 0x0BA2 }
    
    @inlinable static var  SCISSOR_BOX: GLenum { 0x0C10 }
    
    @inlinable static var  COLOR_CLEAR_VALUE: GLenum { 0x0C22 }
    
    @inlinable static var  COLOR_WRITEMASK: GLenum { 0x0C23 }
    
    @inlinable static var  UNPACK_ALIGNMENT: GLenum { 0x0CF5 }
    
    @inlinable static var  PACK_ALIGNMENT: GLenum { 0x0D05 }
    
    @inlinable static var  MAX_TEXTURE_SIZE: GLenum { 0x0D33 }
    
    @inlinable static var  MAX_VIEWPORT_DIMS: GLenum { 0x0D3A }
    
    @inlinable static var  SUBPIXEL_BITS: GLenum { 0x0D50 }
    
    @inlinable static var  RED_BITS: GLenum { 0x0D52 }
    
    @inlinable static var  GREEN_BITS: GLenum { 0x0D53 }
    
    @inlinable static var  BLUE_BITS: GLenum { 0x0D54 }
    
    @inlinable static var  ALPHA_BITS: GLenum { 0x0D55 }
    
    @inlinable static var  DEPTH_BITS: GLenum { 0x0D56 }
    
    @inlinable static var  STENCIL_BITS: GLenum { 0x0D57 }
    
    @inlinable static var  POLYGON_OFFSET_UNITS: GLenum { 0x2A00 }
    
    @inlinable static var  POLYGON_OFFSET_FACTOR: GLenum { 0x8038 }
    
    @inlinable static var  TEXTURE_BINDING_2D: GLenum { 0x8069 }
    
    @inlinable static var  SAMPLE_BUFFERS: GLenum { 0x80A8 }
    
    @inlinable static var  SAMPLES: GLenum { 0x80A9 }
    
    @inlinable static var  SAMPLE_COVERAGE_VALUE: GLenum { 0x80AA }
    
    @inlinable static var  SAMPLE_COVERAGE_INVERT: GLenum { 0x80AB }
    
    @inlinable static var  COMPRESSED_TEXTURE_FORMATS: GLenum { 0x86A3 }
    
    @inlinable static var  DONT_CARE: GLenum { 0x1100 }
    
    @inlinable static var  FASTEST: GLenum { 0x1101 }
    
    @inlinable static var  NICEST: GLenum { 0x1102 }
    
    @inlinable static var  GENERATE_MIPMAP_HINT: GLenum { 0x8192 }
    
    @inlinable static var  BYTE: GLenum { 0x1400 }
    
    @inlinable static var  UNSIGNED_BYTE: GLenum { 0x1401 }
    
    @inlinable static var  SHORT: GLenum { 0x1402 }
    
    @inlinable static var  UNSIGNED_SHORT: GLenum { 0x1403 }
    
    @inlinable static var  INT: GLenum { 0x1404 }
    
    @inlinable static var  UNSIGNED_INT: GLenum { 0x1405 }
    
    @inlinable static var  FLOAT: GLenum { 0x1406 }
    
    @inlinable static var  DEPTH_COMPONENT: GLenum { 0x1902 }
    
    @inlinable static var  ALPHA: GLenum { 0x1906 }
    
    @inlinable static var  RGB: GLenum { 0x1907 }
    
    @inlinable static var  RGBA: GLenum { 0x1908 }
    
    @inlinable static var  LUMINANCE: GLenum { 0x1909 }
    
    @inlinable static var  LUMINANCE_ALPHA: GLenum { 0x190A }
    
    @inlinable static var  UNSIGNED_SHORT_4_4_4_4: GLenum { 0x8033 }
    
    @inlinable static var  UNSIGNED_SHORT_5_5_5_1: GLenum { 0x8034 }
    
    @inlinable static var  UNSIGNED_SHORT_5_6_5: GLenum { 0x8363 }
    
    @inlinable static var  FRAGMENT_SHADER: GLenum { 0x8B30 }
    
    @inlinable static var  VERTEX_SHADER: GLenum { 0x8B31 }
    
    @inlinable static var  MAX_VERTEX_ATTRIBS: GLenum { 0x8869 }
    
    @inlinable static var  MAX_VERTEX_UNIFORM_VECTORS: GLenum { 0x8DFB }
    
    @inlinable static var  MAX_VARYING_VECTORS: GLenum { 0x8DFC }
    
    @inlinable static var  MAX_COMBINED_TEXTURE_IMAGE_UNITS: GLenum { 0x8B4D }
    
    @inlinable static var  MAX_VERTEX_TEXTURE_IMAGE_UNITS: GLenum { 0x8B4C }
    
    @inlinable static var  MAX_TEXTURE_IMAGE_UNITS: GLenum { 0x8872 }
    
    @inlinable static var  MAX_FRAGMENT_UNIFORM_VECTORS: GLenum { 0x8DFD }
    
    @inlinable static var  SHADER_TYPE: GLenum { 0x8B4F }
    
    @inlinable static var  DELETE_STATUS: GLenum { 0x8B80 }
    
    @inlinable static var  LINK_STATUS: GLenum { 0x8B82 }
    
    @inlinable static var  VALIDATE_STATUS: GLenum { 0x8B83 }
    
    @inlinable static var  ATTACHED_SHADERS: GLenum { 0x8B85 }
    
    @inlinable static var  ACTIVE_UNIFORMS: GLenum { 0x8B86 }
    
    @inlinable static var  ACTIVE_ATTRIBUTES: GLenum { 0x8B89 }
    
    @inlinable static var  SHADING_LANGUAGE_VERSION: GLenum { 0x8B8C }
    
    @inlinable static var  CURRENT_PROGRAM: GLenum { 0x8B8D }
    
    @inlinable static var  NEVER: GLenum { 0x0200 }
    
    @inlinable static var  LESS: GLenum { 0x0201 }
    
    @inlinable static var  EQUAL: GLenum { 0x0202 }
    
    @inlinable static var  LEQUAL: GLenum { 0x0203 }
    
    @inlinable static var  GREATER: GLenum { 0x0204 }
    
    @inlinable static var  NOTEQUAL: GLenum { 0x0205 }
    
    @inlinable static var  GEQUAL: GLenum { 0x0206 }
    
    @inlinable static var  ALWAYS: GLenum { 0x0207 }
    
    @inlinable static var  KEEP: GLenum { 0x1E00 }
    
    @inlinable static var  REPLACE: GLenum { 0x1E01 }
    
    @inlinable static var  INCR: GLenum { 0x1E02 }
    
    @inlinable static var  DECR: GLenum { 0x1E03 }
    
    @inlinable static var  INVERT: GLenum { 0x150A }
    
    @inlinable static var  INCR_WRAP: GLenum { 0x8507 }
    
    @inlinable static var  DECR_WRAP: GLenum { 0x8508 }
    
    @inlinable static var  VENDOR: GLenum { 0x1F00 }
    
    @inlinable static var  RENDERER: GLenum { 0x1F01 }
    
    @inlinable static var  VERSION: GLenum { 0x1F02 }
    
    @inlinable static var  NEAREST: GLenum { 0x2600 }
    
    @inlinable static var  LINEAR: GLenum { 0x2601 }
    
    @inlinable static var  NEAREST_MIPMAP_NEAREST: GLenum { 0x2700 }
    
    @inlinable static var  LINEAR_MIPMAP_NEAREST: GLenum { 0x2701 }
    
    @inlinable static var  NEAREST_MIPMAP_LINEAR: GLenum { 0x2702 }
    
    @inlinable static var  LINEAR_MIPMAP_LINEAR: GLenum { 0x2703 }
    
    @inlinable static var  TEXTURE_MAG_FILTER: GLenum { 0x2800 }
    
    @inlinable static var  TEXTURE_MIN_FILTER: GLenum { 0x2801 }
    
    @inlinable static var  TEXTURE_WRAP_S: GLenum { 0x2802 }
    
    @inlinable static var  TEXTURE_WRAP_T: GLenum { 0x2803 }
    
    @inlinable static var  TEXTURE_2D: GLenum { 0x0DE1 }
    
    @inlinable static var  TEXTURE: GLenum { 0x1702 }
    
    @inlinable static var  TEXTURE_CUBE_MAP: GLenum { 0x8513 }
    
    @inlinable static var  TEXTURE_BINDING_CUBE_MAP: GLenum { 0x8514 }
    
    @inlinable static var  TEXTURE_CUBE_MAP_POSITIVE_X: GLenum { 0x8515 }
    
    @inlinable static var  TEXTURE_CUBE_MAP_NEGATIVE_X: GLenum { 0x8516 }
    
    @inlinable static var  TEXTURE_CUBE_MAP_POSITIVE_Y: GLenum { 0x8517 }
    
    @inlinable static var  TEXTURE_CUBE_MAP_NEGATIVE_Y: GLenum { 0x8518 }
    
    @inlinable static var  TEXTURE_CUBE_MAP_POSITIVE_Z: GLenum { 0x8519 }
    
    @inlinable static var  TEXTURE_CUBE_MAP_NEGATIVE_Z: GLenum { 0x851A }
    
    @inlinable static var  MAX_CUBE_MAP_TEXTURE_SIZE: GLenum { 0x851C }
    
    @inlinable static var  TEXTURE0: GLenum { 0x84C0 }
    
    @inlinable static var  TEXTURE1: GLenum { 0x84C1 }
    
    @inlinable static var  TEXTURE2: GLenum { 0x84C2 }
    
    @inlinable static var  TEXTURE3: GLenum { 0x84C3 }
    
    @inlinable static var  TEXTURE4: GLenum { 0x84C4 }
    
    @inlinable static var  TEXTURE5: GLenum { 0x84C5 }
    
    @inlinable static var  TEXTURE6: GLenum { 0x84C6 }
    
    @inlinable static var  TEXTURE7: GLenum { 0x84C7 }
    
    @inlinable static var  TEXTURE8: GLenum { 0x84C8 }
    
    @inlinable static var  TEXTURE9: GLenum { 0x84C9 }
    
    @inlinable static var  TEXTURE10: GLenum { 0x84CA }
    
    @inlinable static var  TEXTURE11: GLenum { 0x84CB }
    
    @inlinable static var  TEXTURE12: GLenum { 0x84CC }
    
    @inlinable static var  TEXTURE13: GLenum { 0x84CD }
    
    @inlinable static var  TEXTURE14: GLenum { 0x84CE }
    
    @inlinable static var  TEXTURE15: GLenum { 0x84CF }
    
    @inlinable static var  TEXTURE16: GLenum { 0x84D0 }
    
    @inlinable static var  TEXTURE17: GLenum { 0x84D1 }
    
    @inlinable static var  TEXTURE18: GLenum { 0x84D2 }
    
    @inlinable static var  TEXTURE19: GLenum { 0x84D3 }
    
    @inlinable static var  TEXTURE20: GLenum { 0x84D4 }
    
    @inlinable static var  TEXTURE21: GLenum { 0x84D5 }
    
    @inlinable static var  TEXTURE22: GLenum { 0x84D6 }
    
    @inlinable static var  TEXTURE23: GLenum { 0x84D7 }
    
    @inlinable static var  TEXTURE24: GLenum { 0x84D8 }
    
    @inlinable static var  TEXTURE25: GLenum { 0x84D9 }
    
    @inlinable static var  TEXTURE26: GLenum { 0x84DA }
    
    @inlinable static var  TEXTURE27: GLenum { 0x84DB }
    
    @inlinable static var  TEXTURE28: GLenum { 0x84DC }
    
    @inlinable static var  TEXTURE29: GLenum { 0x84DD }
    
    @inlinable static var  TEXTURE30: GLenum { 0x84DE }
    
    @inlinable static var  TEXTURE31: GLenum { 0x84DF }
    
    @inlinable static var  ACTIVE_TEXTURE: GLenum { 0x84E0 }
    
    @inlinable static var  REPEAT: GLenum { 0x2901 }
    
    @inlinable static var  CLAMP_TO_EDGE: GLenum { 0x812F }
    
    @inlinable static var  MIRRORED_REPEAT: GLenum { 0x8370 }
    
    @inlinable static var  FLOAT_VEC2: GLenum { 0x8B50 }
    
    @inlinable static var  FLOAT_VEC3: GLenum { 0x8B51 }
    
    @inlinable static var  FLOAT_VEC4: GLenum { 0x8B52 }
    
    @inlinable static var  INT_VEC2: GLenum { 0x8B53 }
    
    @inlinable static var  INT_VEC3: GLenum { 0x8B54 }
    
    @inlinable static var  INT_VEC4: GLenum { 0x8B55 }
    
    @inlinable static var  BOOL: GLenum { 0x8B56 }
    
    @inlinable static var  BOOL_VEC2: GLenum { 0x8B57 }
    
    @inlinable static var  BOOL_VEC3: GLenum { 0x8B58 }
    
    @inlinable static var  BOOL_VEC4: GLenum { 0x8B59 }
    
    @inlinable static var  FLOAT_MAT2: GLenum { 0x8B5A }
    
    @inlinable static var  FLOAT_MAT3: GLenum { 0x8B5B }
    
    @inlinable static var  FLOAT_MAT4: GLenum { 0x8B5C }
    
    @inlinable static var  SAMPLER_2D: GLenum { 0x8B5E }
    
    @inlinable static var  SAMPLER_CUBE: GLenum { 0x8B60 }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_ENABLED: GLenum { 0x8622 }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_SIZE: GLenum { 0x8623 }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_STRIDE: GLenum { 0x8624 }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_TYPE: GLenum { 0x8625 }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_NORMALIZED: GLenum { 0x886A }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_POINTER: GLenum { 0x8645 }
    
    @inlinable static var  VERTEX_ATTRIB_ARRAY_BUFFER_BINDING: GLenum { 0x889F }
    
    @inlinable static var  IMPLEMENTATION_COLOR_READ_TYPE: GLenum { 0x8B9A }
    
    @inlinable static var  IMPLEMENTATION_COLOR_READ_FORMAT: GLenum { 0x8B9B }
    
    @inlinable static var  COMPILE_STATUS: GLenum { 0x8B81 }
    
    @inlinable static var  LOW_FLOAT: GLenum { 0x8DF0 }
    
    @inlinable static var  MEDIUM_FLOAT: GLenum { 0x8DF1 }
    
    @inlinable static var  HIGH_FLOAT: GLenum { 0x8DF2 }
    
    @inlinable static var  LOW_INT: GLenum { 0x8DF3 }
    
    @inlinable static var  MEDIUM_INT: GLenum { 0x8DF4 }
    
    @inlinable static var  HIGH_INT: GLenum { 0x8DF5 }
    
    @inlinable static var  FRAMEBUFFER: GLenum { 0x8D40 }
    
    @inlinable static var  RENDERBUFFER: GLenum { 0x8D41 }
    
    @inlinable static var  RGBA4: GLenum { 0x8056 }
    
    @inlinable static var  RGB5_A1: GLenum { 0x8057 }
    
    @inlinable static var  RGB565: GLenum { 0x8D62 }
    
    @inlinable static var  DEPTH_COMPONENT16: GLenum { 0x81A5 }
    
    @inlinable static var  STENCIL_INDEX8: GLenum { 0x8D48 }
    
    @inlinable static var  DEPTH_STENCIL: GLenum { 0x84F9 }
    
    @inlinable static var  RENDERBUFFER_WIDTH: GLenum { 0x8D42 }
    
    @inlinable static var  RENDERBUFFER_HEIGHT: GLenum { 0x8D43 }
    
    @inlinable static var  RENDERBUFFER_INTERNAL_FORMAT: GLenum { 0x8D44 }
    
    @inlinable static var  RENDERBUFFER_RED_SIZE: GLenum { 0x8D50 }
    
    @inlinable static var  RENDERBUFFER_GREEN_SIZE: GLenum { 0x8D51 }
    
    @inlinable static var  RENDERBUFFER_BLUE_SIZE: GLenum { 0x8D52 }
    
    @inlinable static var  RENDERBUFFER_ALPHA_SIZE: GLenum { 0x8D53 }
    
    @inlinable static var  RENDERBUFFER_DEPTH_SIZE: GLenum { 0x8D54 }
    
    @inlinable static var  RENDERBUFFER_STENCIL_SIZE: GLenum { 0x8D55 }
    
    @inlinable static var  FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE: GLenum { 0x8CD0 }
    
    @inlinable static var  FRAMEBUFFER_ATTACHMENT_OBJECT_NAME: GLenum { 0x8CD1 }
    
    @inlinable static var  FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL: GLenum { 0x8CD2 }
    
    @inlinable static var  FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE: GLenum { 0x8CD3 }
    
    @inlinable static var  COLOR_ATTACHMENT0: GLenum { 0x8CE0 }
    
    @inlinable static var  DEPTH_ATTACHMENT: GLenum { 0x8D00 }
    
    @inlinable static var  STENCIL_ATTACHMENT: GLenum { 0x8D20 }
    
    @inlinable static var  DEPTH_STENCIL_ATTACHMENT: GLenum { 0x821A }
    
    @inlinable static var  NONE: GLenum { 0 }
    
    @inlinable static var  FRAMEBUFFER_COMPLETE: GLenum { 0x8CD5 }
    
    @inlinable static var  FRAMEBUFFER_INCOMPLETE_ATTACHMENT: GLenum { 0x8CD6 }
    
    @inlinable static var  FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT: GLenum { 0x8CD7 }
    
    @inlinable static var  FRAMEBUFFER_INCOMPLETE_DIMENSIONS: GLenum { 0x8CD9 }
    
    @inlinable static var  FRAMEBUFFER_UNSUPPORTED: GLenum { 0x8CDD }
    
    @inlinable static var  FRAMEBUFFER_BINDING: GLenum { 0x8CA6 }
    
    @inlinable static var  RENDERBUFFER_BINDING: GLenum { 0x8CA7 }
    
    @inlinable static var  MAX_RENDERBUFFER_SIZE: GLenum { 0x84E8 }
    
    @inlinable static var  INVALID_FRAMEBUFFER_OPERATION: GLenum { 0x0506 }
    
    @inlinable static var  UNPACK_FLIP_Y_WEBGL: GLenum { 0x9240 }
    
    @inlinable static var  UNPACK_PREMULTIPLY_ALPHA_WEBGL: GLenum { 0x9241 }
    
    @inlinable static var  CONTEXT_LOST_WEBGL: GLenum { 0x9242 }
    
    @inlinable static var  UNPACK_COLORSPACE_CONVERSION_WEBGL: GLenum { 0x9243 }
    
    @inlinable static var  BROWSER_DEFAULT_WEBGL: GLenum { 0x9244 }
}
