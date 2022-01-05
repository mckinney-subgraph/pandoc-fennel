-- Load the fennel library for embedded usage
local fennel = require("filters.fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)
-- Load my filter code
local pd = require("filters.myfilter")



