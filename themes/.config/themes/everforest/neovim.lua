return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		-- Set everforest options BEFORE loading the colorscheme
		vim.g.everforest_background = "hard"
		vim.g.everforest_better_performance = 1
		vim.g.everforest_enable_italic = 1
		vim.g.everforest_disable_italic_comment = 0
		vim.g.everforest_transparent_background = 0
		vim.g.everforest_dim_inactive_windows = 0
		vim.g.everforest_diagnostic_text_highlight = 1
		vim.g.everforest_diagnostic_line_highlight = 0
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.g.everforest_current_word = "grey background"

		-- Load the colorscheme
		vim.cmd([[colorscheme everforest]])

		-- Make editor and bufferline transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })

		-- Make bufferline/tabline transparent
		vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

		-- If using bufferline.nvim plugin
		vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "none" })

		-- Keep ONLY lualine with background (statusline stays colored)
	end,
}
