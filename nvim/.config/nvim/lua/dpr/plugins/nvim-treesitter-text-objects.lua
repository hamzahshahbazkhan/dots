return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    local status, treesitter_config = pcall(require, "nvim-treesitter.config")
    if not status then
      treesitter_config = require("nvim-treesitter.configs")
    end

    treesitter_config.setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
            ["am"] = { query = "@function.outer", desc = "Select outer part of a function" },
            ["im"] = { query = "@function.inner", desc = "Select inner part of a function" },
          },
        },
      },
    })
  end,
}
