local M = {}

-- Tab size of 4 spaces
local TAB_SIZE = 4
local TAB = string.rep(" ", TAB_SIZE)

local function split_line(line)
  local parts = {}
  parts.original = line
  parts.label = line:match("^(%S+):")
  if parts.label then
    line = line:gsub("^%S+:%s*", "")
  end

  parts.directive = line:match("^%s*(%.[%w_]+)")
  if parts.directive then
    line = line:gsub("^%s*%.[%w_]+%s*", "")
  end

  parts.instruction = line:match("^%s*(%S+)")
  if parts.instruction then
    line = line:gsub("^%s*%S+%s*", "")
  end

  parts.arguments = {}
  if not parts.directive or (parts.directive ~= ".ascii" and parts.directive ~= ".asciiz") then
    for arg in line:gmatch("([^,]+)") do
      table.insert(parts.arguments, arg:match("^%s*(.-)%s*$"))
    end
  else
    parts.arguments = { line:match("^%s*(.-)%s*$") }
  end

  parts.comment = line:match("#(.*)")

  return parts
end

function M.format_mips()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local parsed_lines = {}
  local longest_label = 0
  local longest_instruction = 0
  local in_data_section = false

  for i, line in ipairs(lines) do
    local parts = split_line(line)
    parsed_lines[i] = parts

    if parts.directive == ".data" then
      in_data_section = true
    elseif parts.directive == ".text" then
      in_data_section = false
    end

    if parts.label and (parts.directive or parts.instruction) then
      longest_label = math.max(longest_label, #parts.label)
    end

    if parts.instruction then
      longest_instruction = math.max(longest_instruction, #parts.instruction)
    end
  end

  longest_label = math.ceil(longest_label / TAB_SIZE) * TAB_SIZE
  longest_instruction = math.ceil(longest_instruction / TAB_SIZE) * TAB_SIZE

  local formatted_lines = {}
  for i, parts in ipairs(parsed_lines) do
    local result = ""

    if parts.label then
      result = result .. parts.label .. string.rep(" ", longest_label - #parts.label)
    elseif not in_data_section then
      result = result .. string.rep(" ", longest_label)
    end

    if parts.directive then
      if vim.tbl_contains({ ".data", ".text" }, parts.directive) then
        result = parts.directive
      else
        result = result .. parts.directive .. TAB
      end
    end

    if parts.instruction then
      result = result .. parts.instruction .. string.rep(" ", longest_instruction - #parts.instruction)
    end

    if parts.arguments then
      if parts.directive and (parts.directive == ".ascii" or parts.directive == ".asciiz") then
        result = result .. table.concat(parts.arguments, ", ")
      else
        result = result .. table.concat(parts.arguments, ", ")
      end
    end

    if parts.comment then
      if #result > 0 and result:sub(-1) ~= " " then
        result = result .. " "
      end
      result = result .. "#" .. parts.comment
    end

    table.insert(formatted_lines, result)
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted_lines)
end

return M
