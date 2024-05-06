local fwatch = require('fwatch')

local status, log_path = pcall(require, 'private/private_log_path.lua')
if status then
  if vim.fn.expand("%") == log_path then
    fwatch.watch(log_path, {
      on_event = vim.schedule_wrap(function()
            local move_to_bottom = true
            local line_number, _ = vim.api.nvim_win_get_cursor(0)
            if unpack(line_number) < vim.api.nvim_buf_line_count(0) then
              move_to_bottom = false
            end

            vim.api.nvim_command('silent checktime')
            if move_to_bottom then
              vim.cmd.normal('G')
            end
        end)
    })
  end
end
