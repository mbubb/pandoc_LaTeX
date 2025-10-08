-- vars.lua
-- Replace $variable$ in Markdown with YAML metadata values

function Pandoc(doc)
  local meta = doc.meta or {}
  for key, val in pairs(meta) do
    local value = pandoc.utils.stringify(val)
    for i, block in ipairs(doc.blocks) do
      doc.blocks[i] = pandoc.walk_block(block, {
        Str = function(el)
          el.text = el.text:gsub("%$" .. key .. "%$", value)
          return el
        end
      })
    end
  end
  return doc
end
