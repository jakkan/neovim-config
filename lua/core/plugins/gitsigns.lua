local u = require("core/utils")

local M = {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("gitsigns").setup({
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local expr_opts = { expr=true, buffer=bufnr }
      local opts = { buffer=bufnr }

      -- Git (g)
      u.bind(u.normal, "Jump to next hunk (#git)", "<leader>gn", function()
        if vim.wo.diff then return "<leader>gn" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, expr_opts)
      u.bind(u.normal, "Jump to previous hunk (#git)", "<leader>gp", function()
        if vim.wo.diff then return "<leader>gp" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, expr_opts)
      u.bind({u.normal, u.visual}, "Stage hunk (#git)", "<leader>gs", ":Gitsigns stage_hunk<CR>", opts)
      u.bind({u.normal, u.visual}, "Reset hunk (#git)", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
      u.bind(u.normal, "Undo stage hunk (#git)", "<leader>gu", gs.undo_stage_hunk, opts)
      u.bind(u.normal, "Preview git hunk (#git)", "<leader>gP", gs.preview_hunk, opts)
      u.bind(u.normal, "Show git blame (#git)", "<leader>gb", function() gs.blame_line{full=true} end, opts)
      u.bind(u.normal, "Show diff (#git)", "<leader>gd", gs.diffthis, opts)
      u.bind(u.normal, "Show alternative diff (#git)", "<leader>gD", function() gs.diffthis('~') end, opts)
      u.bind(u.normal, "Stage buffer (#git)", "<leader>gS", gs.stage_buffer, opts)
      u.bind(u.normal, "Reset buffer (#git)", "<leader>gR", gs.reset_buffer, opts)

      -- options (o)
      u.bind(u.normal, "Toggle git blame (#options, #git)", "<leader>ob", gs.toggle_current_line_blame, opts)
      u.bind(u.normal, "Toggle view deleted lines (#options, #git)", "<leader>od", gs.toggle_deleted, opts)
    end
  })
end
return M
