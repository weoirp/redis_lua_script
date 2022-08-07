-- compare and set
local key = KEYS[1]
-- v == false when key not exist
local v = redis.call("GET", key) or "nil"
if v == ARGV[1] then
    redis.call("SET", key, ARGV[2])
    return 1
else
    return 0
end