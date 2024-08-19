return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/todo-comments.nvim",
		},
		-- Keymaps
		keys = {
			{ "<leader>ff", "<CMD>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
			{ "<leader>fr", "<CMD>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
			{ "<leader>fs", "<CMD>Telescope live_grep<cr>", desc = "Find string in cwd" },
			{ "<leader>fc", "<CMD>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
			{ "<leader>ft", "<CMD>TodoTelescope<cr>", desc = "Find TODOs" },
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
