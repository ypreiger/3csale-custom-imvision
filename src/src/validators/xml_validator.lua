--- XMl Validator
-- Validates an XML against a schema.

local xmllib = require('xml2lua')

--Uses a handler that converts the XML to a Lua table
local handler = require("xmlhandler.tree")

local setmetatable = setmetatable
local _M = { }
local mt = { __index = _M }

function _M.new()
  local self = setmetatable({}, mt)
  ngx.log(ngx.WARN, "=========>>>>>NEW XML VALIDATOR")  
  return self
end
--- Validate an XML object
-- Checks if XML content is valid according to the given schema.
-- @tparam table xml_content XML content
-- @treturn boolean True if the XML is valid. False otherwise.
-- @treturn string Error message only when the XML is invalid.
function _M.validate(xml)
 ngx.log(ngx.WARN, "=========>>>>>INTO XML VALIDATOR:", xml) 
  --Instantiates the XML parser
  local parser = xmllib.parser(handler)
  parser:parse(xml)

end

return _M
