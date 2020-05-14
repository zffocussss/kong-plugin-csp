-- generate random nonce
local chars = 'abcdefghijklmnopqrstuvwxyz0123456789'
local length = 10
local randomString = ''
local socket=require'socket'

math.randomseed(socket.gettime()*10000)

charTable = {}
for c in chars:gmatch"." do
    table.insert(charTable, c)
end

for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
end

-- load the base plugin object
local BasePlugin = require "kong.plugins.base_plugin"

-- creating handler
local plugin = BasePlugin:extend()

plugin.PRIORITY = 777
plugin.VERSION  = "0.1.0"

-- constructor
function plugin:new()
  plugin.super.new(self, "kong-plugin-csp")
end

-- Executed when all response headers bytes have been received from the upstream service
function plugin:header_filter(config)
-- add reponse header Content-Security-Policy
  csp_value = string.format("default-src \'self\'; style-src: \'self\' \'nonce-%d\';",randomString)
  kong.response.add_header("Content-Security-Policy", csp_value)

end

-- Executed for each chunk of the response body received from the upstream service
function plugin:body_filter(config)
 -- local ctx = ngx.ctx
 -- if ctx.buffers == nil then
 --    ctx.buffers = {}
 --    ctx.nbuffers = 0
 -- end
 -- local data = ngx.arg[1]
 -- local eof = ngx.arg[2]
 -- local next_idx = ctx.nbuffers + 1
 -- if not eof then 
 --   if data then 
 --     ctx.buffers[next_idx] = data 
 --     ctx.nbuffers = next_idx 
 --     -- Send nothing to the client yet. 
 --     ngx.arg[1] = nil 
 --   end 
 --   return 
 -- elseif data then 
 --   ctx.buffers[next_idx] = data 
 --   ctx.nbuffers = next_idx 
 -- end 
 -- -- Yes, we have read the full body.
 -- -- Make sure it is stored in our buffer.
 -- assert(ctx.buffers)
 -- assert(ctx.nbuffers ~= 0, "buffer must not be empty")
-- modify content of header meta
  local html_body = kong.service.response.get_raw_body()
  local meta = string.format("<meta property=\"csp-nonce\" content=\"nonce-\"%s /></head>",randomString)
  local new_html_body, n = string.gsub(html_body,"</head>",meta)
--  ngx.arg[1] = new_html_body .. table.concat(ngx.ctx.buffers)
  ngx.arg[1] = new_html_body

end

return plugin

