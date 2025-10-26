return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    -- Get default capabilities from cmp-nvim-lsp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- ============================================================================
    -- Configure LSP servers with custom settings using vim.lsp.config()
    -- ============================================================================

    -- Configure Svelte with custom on_attach behavior
    vim.lsp.config("svelte", {
      cmd = { "svelteserver", "--stdio" },
      filetypes = { "svelte" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
    })

    -- Configure TypeScript/JavaScript
    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      root_markers = { "package.json", "tsconfig.json", ".git" },
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    -- Configure GraphQL
    vim.lsp.config("graphql", {
      cmd = { "graphql-lsp", "server", "-m", "stream" },
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      root_markers = { ".graphqlrc*", ".graphql.config.*", "graphql.config.*" },
      capabilities = capabilities,
    })

    -- Configure Emmet
    vim.lsp.config("emmet_ls", {
      cmd = { "emmet-ls", "--stdio" },
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      root_markers = { ".git" },
      capabilities = capabilities,
    })

    -- Configure Lua
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        ".git",
      },
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          completion = {
            callSnippet = "Replace",
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Configure Rust Analyzer (uncomment if needed)
    -- vim.lsp.config("rust_analyzer", {
    --   cmd = { "rust-analyzer" },
    --   filetypes = { "rust" },
    --   root_markers = { "Cargo.toml" },
    --   capabilities = capabilities,
    --   settings = {
    --     ["rust-analyzer"] = {
    --       cargo = {
    --         allFeatures = true,
    --       },
    --     },
    --   },
    -- })

    -- ============================================================================
    -- Enable all configured servers
    -- ============================================================================
    vim.lsp.enable({
      "svelte",
      "ts_ls",
      "graphql",
      "emmet_ls",
      "lua_ls",
      -- "rust_analyzer", -- uncomment if needed
    })

    -- ============================================================================
    -- LspAttach autocommand for keybindings and special behaviors
    -- ============================================================================
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf
        local opts = { buffer = bufnr, silent = true }

        -- Special handling for Svelte
        if client and client.name == "svelte" then
          vim.api.nvim_create_autocmd("BufWritePost", {
            buffer = bufnr,
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end

        -- Enable inlay hints if supported
        -- if client and client.server_capabilities.inlayHintProvider then
        --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        -- end

        -- Set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })
  end,
}
