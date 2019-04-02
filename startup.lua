

function lines(str)
  local t = {}
  local i, lstr = 1, #str
  while i <= lstr do
    local x, y = string.find(str, "\r?\n", i)
    if x then t[#t + 1] = string.sub(str, i, x - 1)
    else break
    end
    i = y + 1
  end
  if i <= lstr then t[#t + 1] = string.sub(str, i) end
  return t
end

-- It was an annoying for me that using table.sort(buffer) in Lua  
-- didn't sort numbers with leading spaces in their numerical order. 
-- Using following comparison function helps to avoid that problem: 
function compare(a,b)
  return a:gsub(" ", "0") < b:gsub(" ", "0")
-- If 'compare' is not used ( table.sort(buf) )
-- Lua uses implicit for sorting (see Lua tutorial): 
--   return a < b
-- so changing the provided return statement to this above
-- would be enough to restore sorting to how it was before 
end

function SortSelectedLines()
  local sel = editor:GetSelText()
  if #sel == 0 then return end
  local eol = string.match(sel, "\n$")
  local buf = lines(sel)
  table.sort(buf, compare)
--table.foreach (buf, print) --used for debugging
  local out = table.concat(buf, "\n")
  if eol then out = out.."\n" end
  editor:ReplaceSel(out)
end