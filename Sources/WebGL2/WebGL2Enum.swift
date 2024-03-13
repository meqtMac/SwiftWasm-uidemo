//
//  File.swift
//  
//
//  Created by 蒋艺 on 2023/9/14.
//

import Foundation
import WebGL1

public extension GLenum {
    @inlinable static var READ_BUFFER: GLenum { 0x0C02 }

    @inlinable static var UNPACK_ROW_LENGTH: GLenum { 0x0CF2 }

    @inlinable static var UNPACK_SKIP_ROWS: GLenum { 0x0CF3 }

    @inlinable static var UNPACK_SKIP_PIXELS: GLenum { 0x0CF4 }

    @inlinable static var PACK_ROW_LENGTH: GLenum { 0x0D02 }

    @inlinable static var PACK_SKIP_ROWS: GLenum { 0x0D03 }

    @inlinable static var PACK_SKIP_PIXELS: GLenum { 0x0D04 }

    @inlinable static var COLOR: GLenum { 0x1800 }

    @inlinable static var DEPTH: GLenum { 0x1801 }

    @inlinable static var STENCIL: GLenum { 0x1802 }

    @inlinable static var RED: GLenum { 0x1903 }

    @inlinable static var RGB8: GLenum { 0x8051 }

    @inlinable static var RGBA8: GLenum { 0x8058 }

    @inlinable static var RGB10_A2: GLenum { 0x8059 }

    @inlinable static var TEXTURE_BINDING_3D: GLenum { 0x806A }

    @inlinable static var UNPACK_SKIP_IMAGES: GLenum { 0x806D }

    @inlinable static var UNPACK_IMAGE_HEIGHT: GLenum { 0x806E }

    @inlinable static var TEXTURE_3D: GLenum { 0x806F }

    @inlinable static var TEXTURE_WRAP_R: GLenum { 0x8072 }

    @inlinable static var MAX_3D_TEXTURE_SIZE: GLenum { 0x8073 }

    @inlinable static var UNSIGNED_INT_2_10_10_10_REV: GLenum { 0x8368 }

    @inlinable static var MAX_ELEMENTS_VERTICES: GLenum { 0x80E8 }

    @inlinable static var MAX_ELEMENTS_INDICES: GLenum { 0x80E9 }

    @inlinable static var TEXTURE_MIN_LOD: GLenum { 0x813A }

    @inlinable static var TEXTURE_MAX_LOD: GLenum { 0x813B }

    @inlinable static var TEXTURE_BASE_LEVEL: GLenum { 0x813C }

    @inlinable static var TEXTURE_MAX_LEVEL: GLenum { 0x813D }

    @inlinable static var MIN: GLenum { 0x8007 }

    @inlinable static var MAX: GLenum { 0x8008 }

    @inlinable static var DEPTH_COMPONENT24: GLenum { 0x81A6 }

    @inlinable static var MAX_TEXTURE_LOD_BIAS: GLenum { 0x84FD }

    @inlinable static var TEXTURE_COMPARE_MODE: GLenum { 0x884C }

    @inlinable static var TEXTURE_COMPARE_FUNC: GLenum { 0x884D }

    @inlinable static var CURRENT_QUERY: GLenum { 0x8865 }

    @inlinable static var QUERY_RESULT: GLenum { 0x8866 }

    @inlinable static var QUERY_RESULT_AVAILABLE: GLenum { 0x8867 }

    @inlinable static var STREAM_READ: GLenum { 0x88E1 }

    @inlinable static var STREAM_COPY: GLenum { 0x88E2 }

    @inlinable static var STATIC_READ: GLenum { 0x88E5 }

    @inlinable static var STATIC_COPY: GLenum { 0x88E6 }

    @inlinable static var DYNAMIC_READ: GLenum { 0x88E9 }

    @inlinable static var DYNAMIC_COPY: GLenum { 0x88EA }

    @inlinable static var MAX_DRAW_BUFFERS: GLenum { 0x8824 }

    @inlinable static var DRAW_BUFFER0: GLenum { 0x8825 }

    @inlinable static var DRAW_BUFFER1: GLenum { 0x8826 }

    @inlinable static var DRAW_BUFFER2: GLenum { 0x8827 }

    @inlinable static var DRAW_BUFFER3: GLenum { 0x8828 }

    @inlinable static var DRAW_BUFFER4: GLenum { 0x8829 }

    @inlinable static var DRAW_BUFFER5: GLenum { 0x882A }

    @inlinable static var DRAW_BUFFER6: GLenum { 0x882B }

    @inlinable static var DRAW_BUFFER7: GLenum { 0x882C }

    @inlinable static var DRAW_BUFFER8: GLenum { 0x882D }

    @inlinable static var DRAW_BUFFER9: GLenum { 0x882E }

    @inlinable static var DRAW_BUFFER10: GLenum { 0x882F }

    @inlinable static var DRAW_BUFFER11: GLenum { 0x8830 }

    @inlinable static var DRAW_BUFFER12: GLenum { 0x8831 }

    @inlinable static var DRAW_BUFFER13: GLenum { 0x8832 }

    @inlinable static var DRAW_BUFFER14: GLenum { 0x8833 }

    @inlinable static var DRAW_BUFFER15: GLenum { 0x8834 }

    @inlinable static var MAX_FRAGMENT_UNIFORM_COMPONENTS: GLenum { 0x8B49 }

    @inlinable static var MAX_VERTEX_UNIFORM_COMPONENTS: GLenum { 0x8B4A }

    @inlinable static var SAMPLER_3D: GLenum { 0x8B5F }

    @inlinable static var SAMPLER_2D_SHADOW: GLenum { 0x8B62 }

    @inlinable static var FRAGMENT_SHADER_DERIVATIVE_HINT: GLenum { 0x8B8B }

    @inlinable static var PIXEL_PACK_BUFFER: GLenum { 0x88EB }

    @inlinable static var PIXEL_UNPACK_BUFFER: GLenum { 0x88EC }

    @inlinable static var PIXEL_PACK_BUFFER_BINDING: GLenum { 0x88ED }

    @inlinable static var PIXEL_UNPACK_BUFFER_BINDING: GLenum { 0x88EF }

    @inlinable static var FLOAT_MAT2x3: GLenum { 0x8B65 }

    @inlinable static var FLOAT_MAT2x4: GLenum { 0x8B66 }

    @inlinable static var FLOAT_MAT3x2: GLenum { 0x8B67 }

    @inlinable static var FLOAT_MAT3x4: GLenum { 0x8B68 }

    @inlinable static var FLOAT_MAT4x2: GLenum { 0x8B69 }

    @inlinable static var FLOAT_MAT4x3: GLenum { 0x8B6A }

    @inlinable static var SRGB: GLenum { 0x8C40 }

    @inlinable static var SRGB8: GLenum { 0x8C41 }

    @inlinable static var SRGB8_ALPHA8: GLenum { 0x8C43 }

    @inlinable static var COMPARE_REF_TO_TEXTURE: GLenum { 0x884E }

    @inlinable static var RGBA32F: GLenum { 0x8814 }

    @inlinable static var RGB32F: GLenum { 0x8815 }

    @inlinable static var RGBA16F: GLenum { 0x881A }

    @inlinable static var RGB16F: GLenum { 0x881B }

    @inlinable static var VERTEX_ATTRIB_ARRAY_INTEGER: GLenum { 0x88FD }

    @inlinable static var MAX_ARRAY_TEXTURE_LAYERS: GLenum { 0x88FF }

    @inlinable static var MIN_PROGRAM_TEXEL_OFFSET: GLenum { 0x8904 }

    @inlinable static var MAX_PROGRAM_TEXEL_OFFSET: GLenum { 0x8905 }

    @inlinable static var MAX_VARYING_COMPONENTS: GLenum { 0x8B4B }

    @inlinable static var TEXTURE_2D_ARRAY: GLenum { 0x8C1A }

    @inlinable static var TEXTURE_BINDING_2D_ARRAY: GLenum { 0x8C1D }

    @inlinable static var R11F_G11F_B10F: GLenum { 0x8C3A }

    @inlinable static var UNSIGNED_INT_10F_11F_11F_REV: GLenum { 0x8C3B }

    @inlinable static var RGB9_E5: GLenum { 0x8C3D }

    @inlinable static var UNSIGNED_INT_5_9_9_9_REV: GLenum { 0x8C3E }

    @inlinable static var TRANSFORM_FEEDBACK_BUFFER_MODE: GLenum { 0x8C7F }

    @inlinable static var MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS: GLenum { 0x8C80 }

    @inlinable static var TRANSFORM_FEEDBACK_VARYINGS: GLenum { 0x8C83 }

    @inlinable static var TRANSFORM_FEEDBACK_BUFFER_START: GLenum { 0x8C84 }

    @inlinable static var TRANSFORM_FEEDBACK_BUFFER_SIZE: GLenum { 0x8C85 }

    @inlinable static var TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN: GLenum { 0x8C88 }

    @inlinable static var RASTERIZER_DISCARD: GLenum { 0x8C89 }

    @inlinable static var MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS: GLenum { 0x8C8A }

    @inlinable static var MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS: GLenum { 0x8C8B }

    @inlinable static var INTERLEAVED_ATTRIBS: GLenum { 0x8C8C }

    @inlinable static var SEPARATE_ATTRIBS: GLenum { 0x8C8D }

    @inlinable static var TRANSFORM_FEEDBACK_BUFFER: GLenum { 0x8C8E }

    @inlinable static var TRANSFORM_FEEDBACK_BUFFER_BINDING: GLenum { 0x8C8F }

    @inlinable static var RGBA32UI: GLenum { 0x8D70 }

    @inlinable static var RGB32UI: GLenum { 0x8D71 }

    @inlinable static var RGBA16UI: GLenum { 0x8D76 }

    @inlinable static var RGB16UI: GLenum { 0x8D77 }

    @inlinable static var RGBA8UI: GLenum { 0x8D7C }

    @inlinable static var RGB8UI: GLenum { 0x8D7D }

    @inlinable static var RGBA32I: GLenum { 0x8D82 }

    @inlinable static var RGB32I: GLenum { 0x8D83 }

    @inlinable static var RGBA16I: GLenum { 0x8D88 }

    @inlinable static var RGB16I: GLenum { 0x8D89 }

    @inlinable static var RGBA8I: GLenum { 0x8D8E }

    @inlinable static var RGB8I: GLenum { 0x8D8F }

    @inlinable static var RED_INTEGER: GLenum { 0x8D94 }

    @inlinable static var RGB_INTEGER: GLenum { 0x8D98 }

    @inlinable static var RGBA_INTEGER: GLenum { 0x8D99 }

    @inlinable static var SAMPLER_2D_ARRAY: GLenum { 0x8DC1 }

    @inlinable static var SAMPLER_2D_ARRAY_SHADOW: GLenum { 0x8DC4 }

    @inlinable static var SAMPLER_CUBE_SHADOW: GLenum { 0x8DC5 }

    @inlinable static var UNSIGNED_INT_VEC2: GLenum { 0x8DC6 }

    @inlinable static var UNSIGNED_INT_VEC3: GLenum { 0x8DC7 }

    @inlinable static var UNSIGNED_INT_VEC4: GLenum { 0x8DC8 }

    @inlinable static var INT_SAMPLER_2D: GLenum { 0x8DCA }

    @inlinable static var INT_SAMPLER_3D: GLenum { 0x8DCB }

    @inlinable static var INT_SAMPLER_CUBE: GLenum { 0x8DCC }

    @inlinable static var INT_SAMPLER_2D_ARRAY: GLenum { 0x8DCF }

    @inlinable static var UNSIGNED_INT_SAMPLER_2D: GLenum { 0x8DD2 }

    @inlinable static var UNSIGNED_INT_SAMPLER_3D: GLenum { 0x8DD3 }

    @inlinable static var UNSIGNED_INT_SAMPLER_CUBE: GLenum { 0x8DD4 }

    @inlinable static var UNSIGNED_INT_SAMPLER_2D_ARRAY: GLenum { 0x8DD7 }

    @inlinable static var DEPTH_COMPONENT32F: GLenum { 0x8CAC }

    @inlinable static var DEPTH32F_STENCIL8: GLenum { 0x8CAD }

    @inlinable static var FLOAT_32_UNSIGNED_INT_24_8_REV: GLenum { 0x8DAD }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING: GLenum { 0x8210 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE: GLenum { 0x8211 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_RED_SIZE: GLenum { 0x8212 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_GREEN_SIZE: GLenum { 0x8213 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_BLUE_SIZE: GLenum { 0x8214 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE: GLenum { 0x8215 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE: GLenum { 0x8216 }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE: GLenum { 0x8217 }

    @inlinable static var FRAMEBUFFER_DEFAULT: GLenum { 0x8218 }

    @inlinable static var UNSIGNED_INT_24_8: GLenum { 0x84FA }

    @inlinable static var DEPTH24_STENCIL8: GLenum { 0x88F0 }

    @inlinable static var UNSIGNED_NORMALIZED: GLenum { 0x8C17 }

    @inlinable static var DRAW_FRAMEBUFFER_BINDING: GLenum { 0x8CA6 }

    @inlinable static var READ_FRAMEBUFFER: GLenum { 0x8CA8 }

    @inlinable static var DRAW_FRAMEBUFFER: GLenum { 0x8CA9 }

    @inlinable static var READ_FRAMEBUFFER_BINDING: GLenum { 0x8CAA }

    @inlinable static var RENDERBUFFER_SAMPLES: GLenum { 0x8CAB }

    @inlinable static var FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER: GLenum { 0x8CD4 }

    @inlinable static var MAX_COLOR_ATTACHMENTS: GLenum { 0x8CDF }

    @inlinable static var COLOR_ATTACHMENT1: GLenum { 0x8CE1 }

    @inlinable static var COLOR_ATTACHMENT2: GLenum { 0x8CE2 }

    @inlinable static var COLOR_ATTACHMENT3: GLenum { 0x8CE3 }

    @inlinable static var COLOR_ATTACHMENT4: GLenum { 0x8CE4 }

    @inlinable static var COLOR_ATTACHMENT5: GLenum { 0x8CE5 }

    @inlinable static var COLOR_ATTACHMENT6: GLenum { 0x8CE6 }

    @inlinable static var COLOR_ATTACHMENT7: GLenum { 0x8CE7 }

    @inlinable static var COLOR_ATTACHMENT8: GLenum { 0x8CE8 }

    @inlinable static var COLOR_ATTACHMENT9: GLenum { 0x8CE9 }

    @inlinable static var COLOR_ATTACHMENT10: GLenum { 0x8CEA }

    @inlinable static var COLOR_ATTACHMENT11: GLenum { 0x8CEB }

    @inlinable static var COLOR_ATTACHMENT12: GLenum { 0x8CEC }

    @inlinable static var COLOR_ATTACHMENT13: GLenum { 0x8CED }

    @inlinable static var COLOR_ATTACHMENT14: GLenum { 0x8CEE }

    @inlinable static var COLOR_ATTACHMENT15: GLenum { 0x8CEF }

    @inlinable static var FRAMEBUFFER_INCOMPLETE_MULTISAMPLE: GLenum { 0x8D56 }

    @inlinable static var MAX_SAMPLES: GLenum { 0x8D57 }

    @inlinable static var HALF_FLOAT: GLenum { 0x140B }

    @inlinable static var RG: GLenum { 0x8227 }

    @inlinable static var RG_INTEGER: GLenum { 0x8228 }

    @inlinable static var R8: GLenum { 0x8229 }

    @inlinable static var RG8: GLenum { 0x822B }

    @inlinable static var R16F: GLenum { 0x822D }

    @inlinable static var R32F: GLenum { 0x822E }

    @inlinable static var RG16F: GLenum { 0x822F }

    @inlinable static var RG32F: GLenum { 0x8230 }

    @inlinable static var R8I: GLenum { 0x8231 }

    @inlinable static var R8UI: GLenum { 0x8232 }

    @inlinable static var R16I: GLenum { 0x8233 }

    @inlinable static var R16UI: GLenum { 0x8234 }

    @inlinable static var R32I: GLenum { 0x8235 }

    @inlinable static var R32UI: GLenum { 0x8236 }

    @inlinable static var RG8I: GLenum { 0x8237 }

    @inlinable static var RG8UI: GLenum { 0x8238 }

    @inlinable static var RG16I: GLenum { 0x8239 }

    @inlinable static var RG16UI: GLenum { 0x823A }

    @inlinable static var RG32I: GLenum { 0x823B }

    @inlinable static var RG32UI: GLenum { 0x823C }

    @inlinable static var VERTEX_ARRAY_BINDING: GLenum { 0x85B5 }

    @inlinable static var R8_SNORM: GLenum { 0x8F94 }

    @inlinable static var RG8_SNORM: GLenum { 0x8F95 }

    @inlinable static var RGB8_SNORM: GLenum { 0x8F96 }

    @inlinable static var RGBA8_SNORM: GLenum { 0x8F97 }

    @inlinable static var SIGNED_NORMALIZED: GLenum { 0x8F9C }

    @inlinable static var COPY_READ_BUFFER: GLenum { 0x8F36 }

    @inlinable static var COPY_WRITE_BUFFER: GLenum { 0x8F37 }

    @inlinable static var COPY_READ_BUFFER_BINDING: GLenum { 0x8F36 }

    @inlinable static var COPY_WRITE_BUFFER_BINDING: GLenum { 0x8F37 }

    @inlinable static var UNIFORM_BUFFER: GLenum { 0x8A11 }

    @inlinable static var UNIFORM_BUFFER_BINDING: GLenum { 0x8A28 }

    @inlinable static var UNIFORM_BUFFER_START: GLenum { 0x8A29 }

    @inlinable static var UNIFORM_BUFFER_SIZE: GLenum { 0x8A2A }

    @inlinable static var MAX_VERTEX_UNIFORM_BLOCKS: GLenum { 0x8A2B }

    @inlinable static var MAX_FRAGMENT_UNIFORM_BLOCKS: GLenum { 0x8A2D }

    @inlinable static var MAX_COMBINED_UNIFORM_BLOCKS: GLenum { 0x8A2E }

    @inlinable static var MAX_UNIFORM_BUFFER_BINDINGS: GLenum { 0x8A2F }

    @inlinable static var MAX_UNIFORM_BLOCK_SIZE: GLenum { 0x8A30 }

    @inlinable static var MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS: GLenum { 0x8A31 }

    @inlinable static var MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS: GLenum { 0x8A33 }

    @inlinable static var UNIFORM_BUFFER_OFFSET_ALIGNMENT: GLenum { 0x8A34 }

    @inlinable static var ACTIVE_UNIFORM_BLOCKS: GLenum { 0x8A36 }

    @inlinable static var UNIFORM_TYPE: GLenum { 0x8A37 }

    @inlinable static var UNIFORM_SIZE: GLenum { 0x8A38 }

    @inlinable static var UNIFORM_BLOCK_INDEX: GLenum { 0x8A3A }

    @inlinable static var UNIFORM_OFFSET: GLenum { 0x8A3B }

    @inlinable static var UNIFORM_ARRAY_STRIDE: GLenum { 0x8A3C }

    @inlinable static var UNIFORM_MATRIX_STRIDE: GLenum { 0x8A3D }

    @inlinable static var UNIFORM_IS_ROW_MAJOR: GLenum { 0x8A3E }

    @inlinable static var UNIFORM_BLOCK_BINDING: GLenum { 0x8A3F }

    @inlinable static var UNIFORM_BLOCK_DATA_SIZE: GLenum { 0x8A40 }

    @inlinable static var UNIFORM_BLOCK_ACTIVE_UNIFORMS: GLenum { 0x8A42 }

    @inlinable static var UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES: GLenum { 0x8A43 }

    @inlinable static var UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER: GLenum { 0x8A44 }

    @inlinable static var UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER: GLenum { 0x8A46 }

    @inlinable static var INVALID_INDEX: GLenum { 0xFFFF_FFFF }

    @inlinable static var MAX_VERTEX_OUTPUT_COMPONENTS: GLenum { 0x9122 }

    @inlinable static var MAX_FRAGMENT_INPUT_COMPONENTS: GLenum { 0x9125 }

    @inlinable static var MAX_SERVER_WAIT_TIMEOUT: GLenum { 0x9111 }

    @inlinable static var OBJECT_TYPE: GLenum { 0x9112 }

    @inlinable static var SYNC_CONDITION: GLenum { 0x9113 }

    @inlinable static var SYNC_STATUS: GLenum { 0x9114 }

    @inlinable static var SYNC_FLAGS: GLenum { 0x9115 }

    @inlinable static var SYNC_FENCE: GLenum { 0x9116 }

    @inlinable static var SYNC_GPU_COMMANDS_COMPLETE: GLenum { 0x9117 }

    @inlinable static var UNSIGNALED: GLenum { 0x9118 }

    @inlinable static var SIGNALED: GLenum { 0x9119 }

    @inlinable static var ALREADY_SIGNALED: GLenum { 0x911A }

    @inlinable static var TIMEOUT_EXPIRED: GLenum { 0x911B }

    @inlinable static var CONDITION_SATISFIED: GLenum { 0x911C }

    @inlinable static var WAIT_FAILED: GLenum { 0x911D }

    @inlinable static var SYNC_FLUSH_COMMANDS_BIT: GLenum { 0x0000_0001 }

    @inlinable static var VERTEX_ATTRIB_ARRAY_DIVISOR: GLenum { 0x88FE }

    @inlinable static var ANY_SAMPLES_PASSED: GLenum { 0x8C2F }

    @inlinable static var ANY_SAMPLES_PASSED_CONSERVATIVE: GLenum { 0x8D6A }

    @inlinable static var SAMPLER_BINDING: GLenum { 0x8919 }

    @inlinable static var RGB10_A2UI: GLenum { 0x906F }

    @inlinable static var INT_2_10_10_10_REV: GLenum { 0x8D9F }

    @inlinable static var TRANSFORM_FEEDBACK: GLenum { 0x8E22 }

    @inlinable static var TRANSFORM_FEEDBACK_PAUSED: GLenum { 0x8E23 }

    @inlinable static var TRANSFORM_FEEDBACK_ACTIVE: GLenum { 0x8E24 }

    @inlinable static var TRANSFORM_FEEDBACK_BINDING: GLenum { 0x8E25 }

    @inlinable static var TEXTURE_IMMUTABLE_FORMAT: GLenum { 0x912F }

    @inlinable static var MAX_ELEMENT_INDEX: GLenum { 0x8D6B }

    @inlinable static var TEXTURE_IMMUTABLE_LEVELS: GLenum { 0x82DF }

    @inlinable static var TIMEOUT_IGNORED: GLint64 { -1 }

    @inlinable static var MAX_CLIENT_WAIT_TIMEOUT_WEBGL: GLenum { 0x9247 }
}
