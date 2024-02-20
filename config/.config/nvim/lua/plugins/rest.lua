return {
  "rest-nvim/rest.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local rest = require("rest-nvim")
    rest.setup({
      result_split_horizontal = false,
      skip_ssl_verification = false,
      highlight = {
        enabled = true,
        timeout = 150,
      },
      jump_to_request = false,
    })

    vim.keymap.set("n", "<leader>rr", rest.run)
  end,
}
