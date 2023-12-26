return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	config = function()
		require("copilot").setup({})
	end,
}
