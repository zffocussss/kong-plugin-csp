 return {
   name = "kong-plugin-scp",
   fileds = {
     abc = {type = "string", required = true
   }
   no_consumer = true,
   self_check = function(schema, plugin_t, dao, is_updating)
     return true
   end
}
