-- require('rose-pine').setup({
-- 	-- dark_variant = 'moon',
-- 	disable_italics = true
-- })

require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'auto',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = true,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = true,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },

		-- By default each group adds to the existing config.
		-- If you only want to set what is written in this config exactly,
		-- you can set the inherit option:
		Search = { bg = 'gold', inherit = false },
	}
})

require('kanagawa').setup({
	compile = false,  -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = false },
	functionStyle = {},
	keywordStyle = { italic = false },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,   -- do not set background color
	dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {
	                       -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave",    -- Load "wave" theme when 'background' option is not set
	background = {
	                   -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus"
	},
})

require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		operators = false,
		comments = false,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {
		-- bright_green = "#cfc717",
		--
		--
		--ten
		-- bright_green = "#c9c108",
		-- bright_green = "#b3ab02",
		-- fajny
		-- bright_green = "#dbac12",
		-- bright_green = "#edb705",

		-- bright_green = "#000000",
		-- faded_green = "#000000",
		-- natural_green = "#000000",
	},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})

-- require("catppuccin").setup({
-- 	background = {
-- 		light = "latte",
-- 		dark = "mocha",
-- 	},
-- 	color_overrides = {
-- 		mocha = {
-- 			rosewater = "#EA6962",
-- 			flamingo = "#EA6962",
-- 			pink = "#D3869B",
-- 			mauve = "#D3869B",
-- 			red = "#EA6962",
-- 			maroon = "#EA6962",
-- 			peach = "#BD6F3E",
-- 			yellow = "#D8A657",
-- 			green = "#A9B665",
-- 			teal = "#89B482",
-- 			sky = "#89B482",
-- 			sapphire = "#89B482",
-- 			blue = "#7DAEA3",
-- 			lavender = "#7DAEA3",
-- 			text = "#D4BE98",
-- 			subtext1 = "#BDAE8B",
-- 			subtext0 = "#A69372",
-- 			overlay2 = "#8C7A58",
-- 			overlay1 = "#735F3F",
-- 			overlay0 = "#5A4525",
-- 			surface2 = "#4B4F51",
-- 			surface1 = "#2A2D2E",
-- 			surface0 = "#232728",
-- 			base = "#1D2021",
-- 			mantle = "#191C1D",
-- 			crust = "#151819",
-- 		},
-- 		latte = {
-- 			rosewater = "#c14a4a",
-- 			flamingo = "#c14a4a",
-- 			pink = "#945e80",
-- 			mauve = "#945e80",
-- 			red = "#c14a4a",
-- 			maroon = "#c14a4a",
-- 			peach = "#c35e0a",
-- 			yellow = "#a96b2c",
-- 			green = "#6c782e",
-- 			teal = "#4c7a5d",
-- 			sky = "#4c7a5d",
-- 			sapphire = "#4c7a5d",
-- 			blue = "#45707a",
-- 			lavender = "#45707a",
-- 			text = "#654735",
-- 			subtext1 = "#7b5d44",
-- 			subtext0 = "#8f6f56",
-- 			overlay2 = "#a28368",
-- 			overlay1 = "#b6977a",
-- 			overlay0 = "#c9aa8c",
-- 			surface2 = "#A79C86",
-- 			surface1 = "#C9C19F",
-- 			surface0 = "#DFD6B1",
-- 			base = "#fbf1c7",
-- 			mantle = "#F3EAC1",
-- 			crust = "#E7DEB7",
-- 		},
-- 	},
-- 	styles = {
-- 		comments = { "italic" },
-- 		conditionals = { "italic" },
-- 		loops = { "bold" },
-- 		functions = { "bold" },
-- 		keywords = { "bold" },
-- 		strings = {},
-- 		variables = {},
-- 		numbers = { "bold" },
-- 		booleans = { "bold" },
-- 		properties = {},
-- 		types = { "bold" },
-- 		operators = {},
-- 	},
-- 	transparent_background = false,
-- 	show_end_of_buffer = false,
-- 	custom_highlights = function(colors)
-- 		return {
-- 			NormalFloat = { bg = colors.crust },
-- 			FloatBorder = { bg = colors.crust, fg = colors.crust },
-- 			VertSplit = { bg = colors.base, fg = colors.surface0 },
-- 			CursorLineNr = { fg = colors.mauve, style = { "bold" } },
-- 			Pmenu = { bg = colors.crust, fg = "" },
-- 			PmenuSel = { bg = colors.surface0, fg = "" },
-- 			TelescopeSelection = { bg = colors.surface0 },
-- 			TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
-- 			TelescopePromptPrefix = { bg = colors.surface0 },
-- 			TelescopePromptNormal = { bg = colors.surface0 },
-- 			TelescopeResultsNormal = { bg = colors.mantle },
-- 			TelescopePreviewNormal = { bg = colors.crust },
-- 			TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
-- 			TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
-- 			TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
-- 			TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
-- 			TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
-- 			TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
-- 			IndentBlanklineChar = { fg = colors.surface0 },
-- 			IndentBlanklineContextChar = { fg = colors.surface2 },
-- 			GitSignsChange = { fg = colors.peach },
-- 			NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
-- 			NvimTreeExecFile = { fg = colors.text },
-- 		}
-- 	end,
-- })

function SetColors()
	--color = color or "rose-pine"
	-- color = 'rose-pine'
	-- color = "gruvbox"
	-- color = 'nordic'
	-- color = 'kanagawa-dragon'
	-- color = 'catppuccin'
	-- color = 'kanagawa-wave'
	-- color = 'melange'

	color = 'catppuccin-mocha'
    color = 'rose-pine'
	-- color = 'ayu'
	vim.g.airline_theme = 'desertink'
	--vim.cmd([[colorscheme color]])
	vim.cmd.colorscheme(color)



	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	--vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
end

SetColors()
