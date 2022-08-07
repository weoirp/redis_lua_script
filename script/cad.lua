-- compare and delete
local key = KEYS[1]
local val = ARGV[1]
if redis.call("GET", key) == val then
    redis.call("DEL", key)
    return 1
else
    return 0
end