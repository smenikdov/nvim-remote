return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	tag = "stable",
	opts = {},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},

	config = function(_, opts)
		local wk = require("which-key")
		local lang = require("scripts.language")

		vim.keymap.set("n", "<C-a>", function()
			require("dial.map").manipulate("increment", "normal")
		end)
		vim.keymap.set("n", "<C-x>", function()
			require("dial.map").manipulate("decrement", "normal")
		end)
		vim.keymap.set("n", "g<C-a>", function()
			require("dial.map").manipulate("increment", "gnormal")
		end)
		vim.keymap.set("n", "g<C-x>", function()
			require("dial.map").manipulate("decrement", "gnormal")
		end)
		vim.keymap.set("v", "<C-a>", function()
			require("dial.map").manipulate("increment", "visual")
		end)
		vim.keymap.set("v", "<C-x>", function()
			require("dial.map").manipulate("decrement", "visual")
		end)
		vim.keymap.set("v", "g<C-a>", function()
			require("dial.map").manipulate("increment", "gvisual")
		end)
		vim.keymap.set("v", "g<C-x>", function()
			require("dial.map").manipulate("decrement", "gvisual")
		end)

		-- Snippets
		vim.keymap.set("i", "<C-l>", function()
			return require("luasnip").jump(1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-j>", function()
			return require("luasnip").jump(-1)
		end, { expr = true, silent = true })

		-- Language
		vim.keymap.set("i", "<C-l>", function()
			return lang.toggle_language_i()
		end, { expr = true, silent = true })
		vim.keymap.set("n", "<C-l>", function()
			return lang.toggle_language_n()
		end, { expr = true, silent = true })
		vim.keymap.set("c", "<C-l>", function()
			return lang.toggle_language_c()
		end, { expr = true, silent = true })
		vim.keymap.set("v", "<C-l>", function() end, { expr = true, silent = true })

		wk.setup(opts.setup)
		wk.add({
			{ "<Esc>", ":noh<CR>", hidden = true },
			{ "<C-s>", "<Esc>:w<CR>", mode = { "n", "i", "v" }, hidden = true, desc = "Save" },

			{ "<leader><leader>", ":FzfLua files<CR>", desc = "Find File", hidden = true },
			{ "<leader>/", ":FzfLua live_grep<CR>", desc = "Find Text", hidden = true },
			{ "<leader>q", ":CloseBuffer<CR>", desc = "Close Buffer", hidden = true },
			{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle tree", hidden = true },

			{ "<leader>f", group = "Find" },
			{ "<leader>ff", "yiw:FzfLua files query=<C-r>0<CR>", desc = "Find File" },
			{ "<leader>ft", ":FzfLua grep_cword<CR>", desc = "Find Text" },
			{ "<leader>fT", ":FzfLua tags<CR>", desc = "Find Tags" },
			{ "<leader>fF", ":FindMethod<CR>", desc = "Find Function" },
			{ "<leader>fr", ":FindRoute<CR>", desc = "Find Route" },
			{ "<leader>fb", ":FzfLua buffers<CR>", desc = "Find Buffer" },
			{ "<leader>fm", ":FzfLua marks<CR>", desc = "Find Mark" },
			{ "<leader>fi", ":FzfLua blines<CR>", desc = "Find In Buffer" },
			{ "<leader>fp", ":FzfLua files cwd=~/.config/nvim/templates<CR>", desc = "Find Pattern" },
			{ "<leader>fz", ":FzfLua zoxide<CR>", desc = "Find Zoxide" },
			{ "<leader>fh", ":FzfLua helptags<CR>", desc = "Find Help" },
			{ "<leader>fq", ":FzfLua quickfix<CR>", desc = "Find Quickfix" },

			{ "L", ":bnext<CR>", hidden = true },
			{ "H", ":bprevious<CR>", hidden = true },

			{ "<leader>v", group = "Vue" },
			{ "<leader>vm", "/^\\s*methods:\\s*{<CR>:noh<CR>zz", desc = "Vue Methods" },
			{ "<leader>vc", "/^\\s*computed:\\s*{<CR>:noh<CR>zz", desc = "Vue Computed" },
			{ "<leader>vv", "/^\\s*components:\\s*{<CR>:noh<CR>zz", desc = "Vue Components" },
			{ "<leader>vw", "/^\\s*watch:\\s*{<CR>:noh<CR>zz", desc = "Vue Watch" },
			{ "<leader>vp", "/^\\s*props:\\s*{<CR>:noh<CR>zz", desc = "Vue Props" },
			{ "<leader>vd", "/^\\s*data\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Data" },
			{
				"<leader>vb",
				"/^\\s*\\(async\\)\\?\\s*beforeDestroy\\s*()\\s*{<CR>:noh<CR>zz",
				desc = "Vue Before Destroy",
			},
			{ "<leader>vM", "/^\\s*\\(async\\)\\?\\s*mounted\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Mounted" },
			{ "<leader>vC", "/^\\s*\\(async\\)\\?\\s*created\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Created" },
			{ "<leader>vU", "/^\\s*\\(async\\)\\?\\s*updated\\s*()\\s*{<CR>:noh<CR>zz", desc = "Vue Updated" },
			{ "<leader>vs", "/^\\s*<script<CR>:noh<CR>zz", desc = "Vue Script" },
			{ "<leader>vS", "/^\\s*<style<CR>:noh<CR>zz", desc = "Vue Style" },
			{ "<leader>vt", "G/^\\s*<template<CR>:noh<CR>zz", desc = "Vue Template" },

			{
				"<leader>o",
				function()
                    require("oil").open_float(nil, {
                        -- preview = {
                        --     vertical = true,
                        -- }
                    })
				end,
				desc = "Oil",
			},

			{ "<leader>n", group = "Notifications" },
			{
				"<leader>nc",
                ":Noice dismiss<CR>",
				desc = "Notifications Clear",
			},
            {
                "<leader>nl",
                ":Noice last<CR>",
                desc = "Notifications Last",
            },
			{
				"<leader>nn",
                ":Noice fzf<CR>",
				desc = "Notifications Menu",
			},
		})
	end,
}
