local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

local showPicker = function(opts)
  opts = opts or {}
  local projects = opts.projects or {}

  pickers.new(require("telescope.themes").get_dropdown({}), {
    finder = finders.new_table {
      results = projects,
      entry_maker = function(entry)
        return {
          value = entry.path,
          display = entry.name,
          ordinal = entry.name,
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function (bufnr, map)
      actions.select_default:replace(function()
        actions.close(bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd("cd " .. selection.value)
        vim.cmd("Telescope find_files")
      end)
      return true
    end
  }):find()
end

M.setup = function(opts)
  vim.api.nvim_create_user_command("SPM", function()
    showPicker(opts)
  end, {})
end

return M
