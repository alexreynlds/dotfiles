return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		_G.opts = {
			position = "center",
			hl = "Type",
			wrap = "overflow",
		}

		local function load_random_header()
			math.randomseed(os.time())
			local header_folder = vim.fn.expand("$HOME/.config/nvim/lua/assets/header_img")
			local files = vim.fn.globpath(header_folder, "*.lua", true, true)
			if #files == 0 then
				return nil
			end
			local random_file = files[math.random(#files)]
			-- Extract the module path relative to 'lua' directory
			local module_path = random_file:match("lua/(.*)%.lua")
			local module_name = module_path:gsub("/", ".")
			-- Debug print to verify the module name
			print("Module name: " .. module_name)
			return require(module_name).header
		end

		local function change_header()
			local new_header = load_random_header()
			if new_header then
				dashboard.config.layout[2] = new_header
				vim.cmd("AlphaRedraw") -- Reload dashboard
			else
				print("No header files in header_img folder.")
			end
		end

		-- Initial header loading
		local header = load_random_header()
		if header then
			dashboard.config.layout[2] = header
		else
			print("No header files in header_img folder.")
		end

		dashboard.section.buttons.val = {
			dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button("p", "  Projects", ":e $HOME/Developer/ <CR>"),
			dashboard.button("w", "  Change header image", function()
				change_header()
			end),
		}

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			desc = "Add Alpha dashboard footer",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = {
					" ",
					" Loaded " .. stats.count .. " plugins  in " .. ms .. " ms ",
				}
				dashboard.section.header.opts.hl = "DashboardFooter"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}

