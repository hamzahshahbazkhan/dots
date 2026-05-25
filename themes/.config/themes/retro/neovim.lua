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
					text = "#EAE7E1",
					accent1 = "#FF8FA3",
					accent2 = "#7CFFB2",
					accent3 = "#FFC07A",
					accent4 = "#6FA8FF",
					accent5 = "#5AD1A4",
					accent6 = "#A89CFF",
					dimmed1 = "#A3A7A2",
					dimmed2 = "#8A8F8C",
					dimmed3 = "#1a1a1a",
					dimmed4 = "#111111",
					dimmed5 = "#0a0a0a",
				}
			end,
		})
		vim.cmd([[colorscheme monokai-pro]])

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

		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1a1a1a" })
		vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#1a1a1a" })
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#6FA8FF" })

		vim.api.nvim_set_hl(0, "OilDir", { fg = "#6FA8FF", bold = true })
		vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#6FA8FF" })
		vim.api.nvim_set_hl(0, "OilLink", { fg = "#A89CFF" })
		vim.api.nvim_set_hl(0, "OilLinkTarget", { fg = "#7CFFB2" })
		vim.api.nvim_set_hl(0, "OilCopy", { fg = "#FFC07A", bold = true })
		vim.api.nvim_set_hl(0, "OilMove", { fg = "#FF8FA3", bold = true })
		vim.api.nvim_set_hl(0, "OilChange", { fg = "#FF7F90", bold = true })
		vim.api.nvim_set_hl(0, "OilCreate", { fg = "#7CFFB2", bold = true })
		vim.api.nvim_set_hl(0, "OilDelete", { fg = "#FF8FA3", bold = true })
		vim.api.nvim_set_hl(0, "OilPermissionNone", { fg = "#A3A7A2" })
		vim.api.nvim_set_hl(0, "OilPermissionRead", { fg = "#FFC07A" })
		vim.api.nvim_set_hl(0, "OilPermissionWrite", { fg = "#FF8FA3" })
		vim.api.nvim_set_hl(0, "OilPermissionExecute", { fg = "#7CFFB2" })
	end,
}
