local typedefs = require "kong.db.schema.typedefs" 

local string_array = {
  type = "array",
  default = {},
  elements = { type = "string" },
}

local test_para = {
  type = "record",
  fields = {
    { test = string_array },
  },
}

return {
   name = "kong-plugin-csp",
   fields = {
      test = {type = "string", required = true}   
--    { consumer = typedefs.no_consumer },
--    { protocols = typedefs.protocols_http },
--    { config = {
--        type = "record",
--        fields = {
--          test = test_para,   
--        },
--      },
--    },
  },
}c  
