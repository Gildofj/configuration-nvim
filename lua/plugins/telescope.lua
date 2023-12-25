return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			-- require("telescope").setup({
			--   defaults = {
			--     path_display = { "truncate " },
			--     mappings = {
			--       i = {
			--         ["<C-k>"] = actions.move_selection_previous, -- move to prev result
			--         ["<C-j>"] = actions.move_selection_next, -- move to next result
			--         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			--       }
			--     }
			--   }
			-- })
			-- require("telescope").load_extension("fzf")
			--
			-- keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			-- keymap.set("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			-- keymap.set("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Find string in cwd" })
			-- keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
