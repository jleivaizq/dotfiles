return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Keymaps
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<Leader>dv", dap.step_over, { desc = "Step over" })
		vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step into" })
		vim.keymap.set("n", "<Leader>du", dap.step_out, { desc = "Step out" })
	end,
}
