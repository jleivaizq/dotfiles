return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	version = "*",
	lazy = false,
	opts = {
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorer",
					text_align = "center",
				},
			},
		},
	},
	-- Keymaps
	keys = {
		{ "<Leader>bn", "<CMD>BufferLineCycleNext<CR>", desc = "Buffer cycle next" },
		{ "<Leader>bp", "<CMD>BufferLineCyclePrev<CR>", desc = "Buffer cycle prev" },
		{ "<Leader>os", "<CMD>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
	},
}
