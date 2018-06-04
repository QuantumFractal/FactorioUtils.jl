using FactorioUtils
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

# write your own tests here
test_blueprint_string = "0eNqV0V0KgzAMAOC75LmCfzjpVcYYVcMIaJQ2jon07msVxkAG7qkkTb6UdIWmn3GyxAJ6BWpHdqCvKzh6sOljTpYJQQMJDqCAzRAjsYbdNFpJGuwFvALiDl+gM39TgCwkhLu0Bcud56FBGwo+BrFDKyGnYBpdaBg5zgtIEoqWeAS3I4vtfpd7deDyX086oOfN4rSZnjbLP83Ux0VuS9dff6SgN6EtMuhi+ETrtt6qvuRZXVRpUXr/BsQ6nMQ="
test_json_string = """{"blueprint":{"icons":[{"signal":{"type":"item","name":"transport-belt"},"index":1}],"entities":[{"entity_number":1,"name":"inserter","position":{"x":-1,"y":-1},"direction":2},{"entity_number":2,"name":"transport-belt","position":{"x":1,"y":-1},"direction":2},{"entity_number":3,"name":"transport-belt","position":{"x":0,"y":-1},"direction":2},{"entity_number":4,"name":"transport-belt","position":{"x":0,"y":0}}],"item":"blueprint","label":"test","version":68721836034}}}"""



@test decode_blueprint(test_blueprint_string)== test_json_string
@test decode_blueprint(IOBuffer(test_blueprint_string)) == test_json_string
@test decode_blueprint(convert(Array{UInt8, 1}, test_blueprint_string)) == test_json_string
