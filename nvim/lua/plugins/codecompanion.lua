return { 
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/mcphub.nvim"
        },
        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "mistral",
                    },
                    inline = {
                        adapter = "mistral",
                    },
                },

                adapters = {
                    mistral = function()
                        return require("codecompanion.adapters").extend("mistral", {
                            env = {
                                api_key = "api_key"
                            },
                        })
                    end,
                },

                adapters = {
                    openai = function()
                        return require("codecompanion.adapters").extend("openai", {
                            env = {
                                api_key = "api_key"
                            },
                        })
                    end,
                },

                adapters = {
                    ollama = function()
                        return require("codecompanion.adapters").extend("mistral", {
                            env = {
                                api_key = "api_key"
                            },
                        })
                    end,
                },

                extensions = {
                    mcphub = {
                        callback = "mcphub.extensions.codecompanion",
                        opts = {
                            make_vars = true,
                            make_slash_commands = true,
                            show_result_in_chat = true
                        }
                    }
                }
            })
        end
    },
}
