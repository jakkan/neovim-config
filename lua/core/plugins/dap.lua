
local M = {
  -- Debug Adapter Protocol implementation for Neovim
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      -- UI for nvim-dap
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end
    }
  },
}

function M.config()
  local dap = require("dap")

  -- Catppuccin Github: You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
  vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
  vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
  vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
end

function M.init()
  vim.keymap.set("n", "<leader>dr", function()
    require("dap").repl.open()
  end, { desc = "Repl" })

  vim.keymap.set("n", "<leader>du", function()
    require("dapui").toggle({})
  end, { desc = "Dap UI" })
end

return M
