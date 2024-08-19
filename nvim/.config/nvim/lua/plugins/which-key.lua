return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps",
			},
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Debugging" },
			{ "<leader>e", group = "Explorer", icon = { icon = "󰪶", color = "cyan" } },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "ChatGPT", icon = { icon = "󱉟", color = "cyan" } },
			{ "<leader>o", group = "Obsidian", icon = { icon = "󰠮", color = "cyan" } },
			{ "<leader>s", group = "Split", icon = { icon = "", color = "cyan" } },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>w", group = "Sessions" },
			{ "<leader>x", group = "Diagnostics" },
			{ "<leader>z", group = "Tools", icon = { icon = "", color = "cyan" } },
			{
				mode = { "n", "v" }, -- NORMAL and VISUAL mode
				{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
			},
		},
	},
}
