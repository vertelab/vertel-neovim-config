return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    config = function()
      -- Get environment variable NVIM and construct config path
      local nvim_path = os.getenv("NVIM")
      nvim_path = nvim_path .. "/mcphub/servers.json"
      
      require("mcphub").setup({
        config = vim.fn.expand(nvim_path), -- Absolute path to MCP Servers config file (creates if not exists)
        port = 37373, -- Port `mcp-hub` listens to
        shutdown_delay = 5 * 60 * 1000, -- Delay in ms before shutting down server (5 minutes)
        use_bundled_binary = false, -- Use local `mcp-hub` binary
        mcp_request_timeout = 60000, -- Max MCP tool execution time in ms
        global_env = {}, -- Global env variables available to all MCP servers
        
        workspace = {
          enabled = true,
          look_for = { ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" },
          reload_on_dir_changed = true,
          port_range = { min = 40000, max = 41000 },
          get_port = nil,
        },
        
        auto_approve = false,
        auto_toggle_mcp_servers = true,
        extensions = {
          avante = {
            make_slash_commands = true,
          },
        },
        
        native_servers = {},
        builtin_tools = {
          edit_file = {
            parser = {
              track_issues = true,
              extract_inline_content = true,
            },
            locator = {
              fuzzy_threshold = 0.8,
              enable_fuzzy_matching = true,
            },
            ui = {
              go_to_origin_on_complete = true,
              keybindings = {
                accept = ".",
                reject = ",",
                next = "n",
                prev = "p",
                accept_all = "ga",
                reject_all = "gr",
              },
            },
          },
        },
        
        ui = {
          window = {
            width = 0.8,
            height = 0.8,
            align = "center",
            relative = "editor",
            zindex = 50,
            border = "rounded",
          },
          wo = {
            winhl = "Normal:MCPHubNormal,FloatBorder:MCPHubBorder",
          },
        },
        
        json_decode = nil, -- Custom parser if needed
        on_ready = function(hub)
          -- Called when hub is ready
        end,
        
        on_error = function(err)
          -- Called on errors
        end,
        
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = "MCPHub",
        },
      })
    end,
  },
}
