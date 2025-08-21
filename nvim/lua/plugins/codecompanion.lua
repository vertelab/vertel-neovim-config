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
                        adapter = "ollama",
                    },
                    inline = {
                        adapter = "ollama",
                    },
                },

                adapters = {
                    mistral = function()
                        return require("codecompanion.adapters").extend("mistral", {
                            env = {
                                api_key = os.getenv("MISTRAL_API_KEY")
                            },
                        })
                    end,

                    openai = function()
                        return require("codecompanion.adapters").extend("openai", {
                            env = {
                                api_key = os.getenv("OPENAI_API_KEY")
                            },
                        })
                    end,

                    ollama = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            env = {
                                url = "http://192.168.1.215:11434"
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
