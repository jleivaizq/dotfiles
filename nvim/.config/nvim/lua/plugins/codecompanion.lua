-- lua/plugins/codecompanion.lua
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	init = function()
		-- Disable nvim-cmp in CodeCompanion buffers so <CR> is handled by the chat UI
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(ev)
				local ft = vim.bo[ev.buf].filetype or ""
				if ft:match("codecompanion") then
					local ok, cmp = pcall(require, "cmp")
					if ok then
						cmp.setup.buffer({ enabled = false })
					end
				end
			end,
		})
	end,

	opts = {
		-------------------------------------------------------------------------
		-- 1) Set default adapter for each strategy
		-- If you don't set this, CodeCompanion will try to use Copilot by default.
		-------------------------------------------------------------------------
		strategies = {
			chat = {
				adapter = "openai",
			},
			inline = {
				adapter = "openai",
			},
		},

		-------------------------------------------------------------------------
		-- 2) Define your adapters
		-- Use `extend` so you can customize schema (default model, etc.) and env vars.
		-------------------------------------------------------------------------
		adapters = {
			llama = function()
				return require("codecompanion.adapters").extend("ollama", {
					schema = { model = { default = "llama3.1:8b" } }, -- set default model
					opts = { stream = true }, -- enable streaming
					-- If your Ollama server is remote:
					-- env = { url = "http://127.0.0.1:11434" },
				})
			end,
			deepseek = function()
				return require("codecompanion.adapters").extend("ollama", {
					schema = { model = { default = "deepseek-coder:6.7b" } }, -- set default model
					opts = { stream = true }, -- enable streaming
					-- If your Ollama server is remote:
					-- env = { url = "http://127.0.0.1:11434" },
				})
			end,

			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					env = { api_key = os.getenv("OPENAI_API_KEY") },
					schema = { model = { default = "gpt-4o-mini" } },
				})
			end,

			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = { api_key = os.getenv("ANTHROPIC_API_KEY") },
					schema = { model = { default = "claude-3-5-sonnet-20240620" } },
				})
			end,
		},

		actions = {
			-- Visible :CodeCompanionAction
			explain = {
				strategy = "chat",
				description = "Explain selected code",
				prompt = [[Explain this code to a teammate. Include pitfalls and complexity.]],
			},
			docstring = {
				strategy = "inline",
				description = "Add docstrings",
				prompt = [[Add docstrings with params/returns and an example. Keep my style.]],
			},
			tests = {
				strategy = "inline",
				description = "Generate tests",
				prompt = [[Write minimal, deterministic tests for this code.]],
			},
			diff_refactor = {
				strategy = "chat",
				description = "Refactor (diff output)",
				prompt = [[Refactor for readability; output only a unified diff I can apply.]],
			},
		},

		-------------------------------------------------------------------------
		-- 4) Extensions
		-------------------------------------------------------------------------
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_tools = true, -- @neovim, @github, @fetch y @neovim__read_file, etc.
					show_server_tools_in_chat = true, -- autocomplete tools chat
					make_vars = true, -- resoucrces
					make_slash_commands = true, -- MCP prompts such as /mcp:...
					show_result_in_chat = true,
					-- add_mcp_prefix_to_tool_names = false,
				},
			},
		},

		-------------------------------------------------------------------------
		-- 4) Optional general options
		-------------------------------------------------------------------------
		log_level = "INFO", -- set to "DEBUG" for more detailed logging
		-- show_model_choices = false, -- disable model picker if you don't want it
	},
}
