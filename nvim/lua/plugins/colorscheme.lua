return {
	"ellisonleao/gruvbox.nvim",
	name = "Gruvbox",
	priority = 1000,
	config =function()
        require("gruvbox").setup({
        background ="dark"})
		vim.cmd.colorscheme "gruvbox"
	end
}
