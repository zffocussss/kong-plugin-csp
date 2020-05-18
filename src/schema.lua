local typedefs = require "kong.db.schema.typedefs" 
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
      consumer = typedefs.no_consumer
    },
    {
      protocols = typedefs.protocols_http
    },
    {
      config = {
        type = "record",
        fields = {
          {
            key_names = {
              type = "array",
              required = true,
              elements = typedefs.header_name,
              default = {
                "apikey",
              },
            },
          },
          {
            hide_credentials = {
              type = "boolean",
              default = false,
            },
          },
          {
            anonymous = {
              type = "string",
              uuid = true,
              legacy = true,
            },
          },
          {
            key_in_body = {
              type = "boolean",
              default = false,
            },
          },
          {
            run_on_preflight = {
              type = "boolean",
              default = true,
            },
          },
        },
      },
    },
  },
}
