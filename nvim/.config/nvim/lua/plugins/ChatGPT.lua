return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup()
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	-- Keymaps
	keys = {
		{ "<leader>hc", "<cmd>ChatGPT<CR>", "ChatGPT" },
		{ "<leader>he", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
		{ "<leader>hg", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
		{ "<leader>ht", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
		{ "<leader>hk", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
		{ "<leader>hd", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
		{ "<leader>ha", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
		{ "<leader>ho", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
		{ "<leader>hs", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
		{ "<leader>hf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
		{ "<leader>hx", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
		{ "<leader>hr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
		{
			"<leader>hl",
			"<cmd>ChatGPTRun code_readability_analysis<CR>",
			"Code Readability Analysis",
			mode = { "n", "v" },
		},
	},
}
