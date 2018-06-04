using CodecZlib

const VERSION_NUMBER = 0

"""
    decode_blueprint(io)

Decodes a blueprint string from Factorio.

Takes a base64 encoded string, removes the first byte (version header), 
then decompresses it into JSON via zlib. Returns a JSON string. 
"""
function decode_blueprint(in::IOBuffer)
    in_str = String(read(in))
    base64_str = base64decode(in_str[2:end])
    zlib_stream = ZlibDecompressorStream(IOBuffer(base64_str))
    return String(read(zlib_stream))
end

decode_blueprint(in::String) = decode_blueprint(IOBuffer(in))
decode_blueprint(in::Array{UInt8, 1}) = decode_blueprint(IOBuffer(in))


"""
    encode_blueprint(io)

Encodes a blueprint string from Factorio.

Takes a JSON string, compresses it via zlib, converts it to base64, then
adds a version header. Returns a base64 string
"""
function encode_blueprint(in::IOBuffer)
    zlib_stream = ZlibCompressorStream(in)
    base64_str = base64encode(String(read(zlib_stream)))
    return base64_str
end

encode_blueprint(in::String) = encode_blueprint(IOBuffer(in))
encode_blueprint(in::Array{UInt8, 1}) = encode_blueprint(IOBuffer(in))