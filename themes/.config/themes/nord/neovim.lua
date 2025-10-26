-- ~/.config/themes/nord/neovim.lua (or nordfox)
return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true, -- Enable if you want transparency
				terminal_colors = true,
				dim_inactive = false,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		})

		-- Set the colorscheme to nordfox
		vim.cmd.colorscheme("nordfox")
	end,
}
