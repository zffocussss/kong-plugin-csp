package = "kong-plugin-csp"

version = "0.1.0-1"     -- renumber, must match the info in the filename of this rockspec!
                      -- The version '0.1' is the source code version, the trailing '1' is the version of this rockspec.

-- supported_platforms = {"linux", "macosx"}

source = {
     url = "git://github.com/zffocussss/kong-plugin-scp"
     tag = "0.1-1"
}

description = {
  summary = "A Kong custom plugin, that allows handle CSP.",
  license = "Apache 2.0"
}

dependencies = {
  "lua >= 5.1"
  -- If you depend on other rocks, add them here
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.kong-plugin-csp.handler"] = "src/handler.lua",
  }
}

