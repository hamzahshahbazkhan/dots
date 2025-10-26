return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- custom mode overrides
    local custom_theme = require("lualine.themes.auto") -- start from 'auto' theme

    -- swap normal and visual colors
    custom_theme.normal = custom_theme.normal or {}
    custom_theme.visual = custom_theme.visual or {}

    custom_theme.normal.a, custom_theme.visual.a = custom_theme.visual.a, custom_theme.normal.a

    lualine.setup({
      options = {
        theme = custom_theme,
        component_separators = "|",
        section_separators = "",
        always_divide_middle = false,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
