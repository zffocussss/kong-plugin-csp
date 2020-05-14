local typedefs = require "kong.db.schema.typedefs" 
return {
--   name = "kong-plugin-csp",
   no_consumer = true,
   fields = {
--     {
--       no_consumer = true
--     },
--     {
     abc = {type = "string", required = true}  
--     }
      
  },

  self_check = function(schema, plugin_t, dao, is_updating)
    -- perform any custom verification
    return true
  end
}
