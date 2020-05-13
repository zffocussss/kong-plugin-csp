 return {
   name = "kong-plugin-scp",
   no_consumer = true,
   self_check = function(schema, plugin_t, dao, is_updating)
     return true
   end
}
