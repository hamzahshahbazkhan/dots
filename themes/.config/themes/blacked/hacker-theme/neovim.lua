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
					dark1 = "#111111",
					background = "#000000",
					text = "#ffffff",
					accent1 = "#ff0055",
					accent2 = "#00ff99",
					accent3 = "#ffcc00",
					accent4 = "#00ccff",
					accent5 = "#ff6600",
					accent6 = "#cc00ff",
					dimmed1 = "#333333",
					dimmed2 = "#222222",
					dimmed3 = "#1a1a1a",
					dimmed4 = "#111111",
					dimmed5 = "#000000",
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
		vim.api.nvim_set_hl(0, "IblScope", { fg = "#00ccff" })

		vim.api.nvim_set_hl(0, "OilDir", { fg = "#00ccff", bold = true })
		vim.api.nvim_set_hl(0, "OilDirIcon", { fg = "#00ccff" })
		vim.api.nvim_set_hl(0, "OilLink", { fg = "#cc00ff" })
		vim.api.nvim_set_hl(0, "OilLinkTarget", { fg = "#00ff99" })
		vim.api.nvim_set_hl(0, "OilCopy", { fg = "#ffcc00", bold = true })
		vim.api.nvim_set_hl(0, "OilMove", { fg = "#ff0055", bold = true })
		vim.api.nvim_set_hl(0, "OilChange", { fg = "#ffcc00", bold = true })
		vim.api.nvim_set_hl(0, "OilCreate", { fg = "#00ff99", bold = true })
		vim.api.nvim_set_hl(0, "OilDelete", { fg = "#ff0055", bold = true })
		vim.api.nvim_set_hl(0, "OilPermissionNone", { fg = "#333333" })
		vim.api.nvim_set_hl(0, "OilPermissionRead", { fg = "#ffcc00" })
		vim.api.nvim_set_hl(0, "OilPermissionWrite", { fg = "#ff0055" })
		vim.api.nvim_set_hl(0, "OilPermissionExecute", { fg = "#00ff99" })
	end,
}
