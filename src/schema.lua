--local typedefs = require "kong.db.schema.typedefs" 
--
--local string_array = {
--  type = "array",
--  default = {},
--  elements = { type = "string" },
--}
--
--local test_para = {
--  type = "record",
--  fields = {
--    { test = string_array },
--  },
--}

return {
   name = "kong-plugin-csp",
   fields = {
    {
      config = {
        type = "record",
        fields = {
          {
            key_names = {
              type = "string",
              required = true,
              default = "test"
            },
          },
        },
      },
    },
  },
}
