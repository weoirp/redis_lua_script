-- qps limit
local key = KEYS[1]
local limit = tonumber(ARGV[1])
local current = tonumber(redis.call('GET', key) or '0')
if current + 1 > limit then
    return 0
else
    redis.call('INCRBY', key, 1)
    redis.call('EXPIRE', key, 1)
    return 1
end