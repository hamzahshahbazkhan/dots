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
					dark2 = "#1a1b17",
					dark1 = "#1e1f1c",
					background = "#1e1f1c",
					text = "#d5d3cd",
					accent1 = "#c9798a",
					accent2 = "#8fa87a",
					accent3 = "#b5af92",
					accent4 = "#8da5b3",
					accent5 = "#9ab5b8",
					accent6 = "#9c92b0",
					dimmed1 = "#75715e",
					dimmed2 = "#5f5d52",
					dimmed3 = "#414339",
					dimmed4 = "#34352f",
					dimmed5 = "#2a2b26",
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
		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#414339" })
		vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#414339" })
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#8da5b3" })

		-- Oil.nvim directory highlighting fix
		vim.api.nvim_set_hl(0, "OilDir", { fg = "#8da5b3", bold = true })
		vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#8da5b3" })
		vim.api.nvim_set_hl(0, "OilLink", { fg = "#9c92b0" })
		vim.api.nvim_set_hl(0, "OilLinkTarget", { fg = "#8fa87a" })
		vim.api.nvim_set_hl(0, "OilCopy", { fg = "#b5af92", bold = true })
		vim.api.nvim_set_hl(0, "OilMove", { fg = "#c9798a", bold = true })
		vim.api.nvim_set_hl(0, "OilChange", { fg = "#b08a66", bold = true })
		vim.api.nvim_set_hl(0, "OilCreate", { fg = "#8fa87a", bold = true })
		vim.api.nvim_set_hl(0, "OilDelete", { fg = "#c9798a", bold = true })
		vim.api.nvim_set_hl(0, "OilPermissionNone", { fg = "#75715e" })
		vim.api.nvim_set_hl(0, "OilPermissionRead", { fg = "#b5af92" })
		vim.api.nvim_set_hl(0, "OilPermissionWrite", { fg = "#c9798a" })
		vim.api.nvim_set_hl(0, "OilPermissionExecute", { fg = "#8fa87a" })
	end,
}
