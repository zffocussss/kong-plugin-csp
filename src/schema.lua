local typedefs = require "kong.db.schema.typedefs" 
return {
   name = "kong-plugin-scp",
   fields = {
     abc = {type = "string", required = true}
   },
   no_consumer = true,
   self_check = function(schema, plugin_t, dao, is_updating)
     return true
   end
}
