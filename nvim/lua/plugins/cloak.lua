return {
  "laytan/cloak.nvim",
  config = function()
	  require("cloak").setup({
		enabled = true,
		cloak_character = "*",
		-- The applied highlighting group (colors) on the cloaking
		highlight_group = "Comment",
		patterns = {
			{
			  file_pattern = {
				".env*",
				"wrangled.toml",
				".dev.vars",
			  },
			  cloak_pattern = "=.*",
			},
		},
	  })
  end
}
