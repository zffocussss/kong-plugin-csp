local typedefs = require "kong.db.schema.typedefs" 
return {
   name = "kong-plugin-csp",
   no_consumer = true,
   fields = {
     abc = {type = "string", required = true}
   }
}
