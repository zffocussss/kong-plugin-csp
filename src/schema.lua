local typedefs = require "kong.db.schema.typedefs" 
return {
   name = "kong-plugin-csp",
   fields = {
     {
       consumer = typedefs.no_consumer
     },
     {
       config = {
         type = "record",
         fields = {
           abc = {
             type = "string",
             required = false,
           },
         },
       },
     },
  },
}
