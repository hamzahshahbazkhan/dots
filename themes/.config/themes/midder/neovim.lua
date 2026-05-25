return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("monokai-pro").setup({
			transparent_background = true,
			filter = "machine",
			overridePalette = function()
				return {
					dark2 = "#000000",
					dark1 = "#000000",
					background = "#000000",
					text = "#e6e2d8",
					accent1 = "#ff95a8",
					accent2 = "#7fd1a0",
					accent3 = "#c6c3bd",
					accent4 = "#8fb2ff",
					accent5 = "#a7b0b1",
					accent6 = "#b39ddb",
					dimmed1 = "#9aa19a",
					dimmed2 = "#8a8f8b",
					dimmed3 = "#1e1e1e",
					dimmed4 = "#121212",
					dimmed5 = "#0a0a0a",
				}
			end,
		})
		vim.cmd([[colorscheme monokai-pro]])

		-- Clear background for transparent effect
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
		vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "none" })

		-- Indent-blankline highlight groups (REQUIRED for v3)
		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1e1e1e" })
		vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#1e1e1e" })
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#8fb2ff" })

		-- Oil.nvim directory highlighting fix
		vim.api.nvim_set_hl(0, "OilDir", { fg = "#8fb2ff", bold = true })
		vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#8fb2ff" })
		vim.api.nvim_set_hl(0, "OilLink", { fg = "#b39ddb" })
		vim.api.nvim_set_hl(0, "OilLinkTarget", { fg = "#7fd1a0" })
		vim.api.nvim_set_hl(0, "OilCopy", { fg = "#c6c3bd", bold = true })
		vim.api.nvim_set_hl(0, "OilMove", { fg = "#ff95a8", bold = true })
		vim.api.nvim_set_hl(0, "OilChange", { fg = "#ff7f90", bold = true })
		vim.api.nvim_set_hl(0, "OilCreate", { fg = "#7fd1a0", bold = true })
		vim.api.nvim_set_hl(0, "OilDelete", { fg = "#ff95a8", bold = true })
		vim.api.nvim_set_hl(0, "OilPermissionNone", { fg = "#9aa19a" })
		vim.api.nvim_set_hl(0, "OilPermissionRead", { fg = "#c6c3bd" })
		vim.api.nvim_set_hl(0, "OilPermissionWrite", { fg = "#ff95a8" })
		vim.api.nvim_set_hl(0, "OilPermissionExecute", { fg = "#7fd1a0" })
	end,
}
