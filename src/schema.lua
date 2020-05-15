local typedefs = require "kong.db.schema.typedefs" 
return {
   name = "kong-plugin-csp",
    fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          test = {type = "string", required = true},   
        },
      },
    },
  },
}
