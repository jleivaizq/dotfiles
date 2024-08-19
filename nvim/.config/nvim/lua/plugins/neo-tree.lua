return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},

	-- Keymaps
	keys = {
		{ "<Leader>ef", ":Neotree filesystem toggle<CR>", desc = "File explorer" },
		{ "<Leader>eb", ":Neotree buffers toggle<CR>", desc = "Buffer explorer" },
		{ "<Leader>eg", ":Neotree git_status toggle<CR>", desc = "Git Status" },
	},
}
