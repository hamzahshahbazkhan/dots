return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		-- Enable background transparency
		vim.g.gruvbox_material_transparent_background = 2 -- Full transparency
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_enable_bold = true
		vim.g.gruvbox_material_ui_contrast = "high"
		vim.g.gruvbox_material_better_performance = 1

		-- Set colorscheme
		vim.cmd.colorscheme("gruvbox-material")

		-- Apply additional transparency settings after colorscheme is loaded
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "gruvbox-material",
			callback = function()
				-- Make buffer line transparent
				vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "NONE", bold = true })

				-- Make status line transparent
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

				-- Make sign column transparent
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

				-- Make line number column transparent
				vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })

				-- Make normal text background transparent
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })

				-- Make floating windows transparent
				vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
			end,
		})

		-- Execute the transparency settings immediately as well
		vim.cmd("doautocmd ColorScheme gruvbox-material")
	end,
} --
