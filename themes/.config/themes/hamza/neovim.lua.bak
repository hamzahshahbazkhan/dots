return {
	"vague-theme/vague.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vague").setup({
			transparent = true,
			bold = true,
			italic = true,
			colors = {
				bg = "#1d2021", -- Gruvbox Dark Hard background
				inactiveBg = "#282828",
				fg = "#d4cfc4",
				floatBorder = "#7d8f9d",
				line = "#3c3836",
				comment = "#7c6f64",
				func = "#d2788c",
				operator = "#7d8f9d",
				keyword = "#7f8d96",
				type = "#9b8fb0",
				string = "#c9b88c",
				number = "#d3a573",
				property = "#b7ada6",
				constant = "#a0a4aa",
				parameter = "#b9a9a4",
				error = "#cc6f85",
				warning = "#d7a45a",
				hint = "#9c9b94",
				visual = "#383632",
			},

			on_highlights = function(hl, c)
				-- make Neovim fully transparent
				hl.Normal = { bg = "none", fg = c.fg }
				hl.NormalNC = { bg = "none", fg = c.fg }
				hl.SignColumn = { bg = "none" }
				hl.EndOfBuffer = { bg = "none", fg = c.bg }
				hl.LineNr = { bg = "none", fg = "#7c6f64" }
				hl.CursorLineNr = { bg = "none", fg = "#a89984" }
				hl.TabLine = { bg = "none" }
				hl.TabLineFill = { bg = "none" }
				hl.TabLineSel = { bg = "none" }
				hl.BufferLineFill = { bg = "none" }
				hl.BufferLineBackground = { bg = "none" }
				hl.WinSeparator = { fg = "#3c3836", bg = "none" }
				hl.StatusLine = { bg = "none", fg = c.fg }
				hl.StatusLineNC = { bg = "none", fg = c.fg }
				hl.FloatBorder = { fg = "#7d8f9d", bg = "none" }
				hl.VertSplit = { fg = "#3c3836", bg = "none" }
			end,
		})

		vim.cmd([[colorscheme vague]])
	end,
}
