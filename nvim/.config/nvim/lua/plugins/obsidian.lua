return {
	"epwalsh/obsidian.nvim",
	version = "*",
	dependencies = "nvim-lua/plenary.nvim",
	lazy = false,
	ft = "markdown",
	opts = {
		workspaces = {
			{
				name = "core",
				path = "~/Notebooks/core-book",
			},
		},
	},

	-- Keymaps
	keys = {
		{ "<Leader>on", "<CMD>ObsidianNew<CR>", desc = "New note" },
		{ "<Leader>ot", "<CMD>ObsidianNewFromTemplate<CR>", desc = "New note from template" },
		{ "<Leader>ow", "<CMD>ObsidianWorkspace<CR>", desc = "Change workspace" },
	},
}
