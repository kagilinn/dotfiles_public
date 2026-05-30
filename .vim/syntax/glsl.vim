" Vim syntax file
" Language:	GLSL

if exists("b:current_syntax")
  finish
endif

sy region	glslCommentR		start=/\/\*/ end=/\*\//
sy match	glslCommentL		/\/\/.*$/
sy keyword	glslConstant		true false
sy match	glslNumber			/\d\d*/
sy match	glslFloat			/\d\d*\.\d\d*/
sy match	glslIdentifier		/[_a-zA-Z][_a-zA-Z0-9]*/
sy keyword	glslStatement		break return continue
sy keyword	glslConditional		if else
sy keyword	glslRepeat			while for do
sy keyword	glslKeyword			abs clamp cos dot floor gl_FragColor gl_FrontColor gl_Position highp lowp max mediump min normalize pow precision sin texture2D
sy match	glslInclude			/\#[ \t]*include[ \t][ \t]*\".*\"/
sy keyword	glslType			bool float int mat2 mat3 mat4 sampler2D samplerCube vec2 vec3 vec4 void
sy keyword	glslStorageClass	uniform attribute varying const
sy keyword	glslStructure		struct
sy keyword	glslTodo			TODO FIXME

hi link glslCommentR		Comment
hi link glslCommentL		Comment
hi link glslConstant		Constant
hi link glslNumber			Number
hi link glslFloat			Float
hi link glslIdentifier		Identifier
hi link glslStatement		Statement
hi link glslConditional		Conditional
hi link glslRepeat			Repeat
hi link glslKeyword			Keyword
hi link glslInclude			Include
hi link glslType			Type
hi link glslStorageClass	StorageClass
hi link glslStructure		Structure
hi link glslTodo			Todo
