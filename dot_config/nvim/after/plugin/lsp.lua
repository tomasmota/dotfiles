local lsp = require('lsp-zero')

lsp.preset({
    name = 'minimal',
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})


lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    -- lsp stuff
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "H", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>zz") -- TODO: change this to a function, using vim.api.nvim_win_set_cursor
    vim.keymap.set("n", "gp", function() builtin.lsp_definitions({jump_type = "never"}) end)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
    vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.goto_next)
end)

local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    completion = { completeopt = "menu,menuone,noinsert" },
    experimental = { ghost_text = true },
})

cmp.setup.filetype('markdown', {
    sources = {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
    }
})

lsp.configure('gopls', {
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    }
})

-- https://github.com/hashicorp/terraform-ls
lsp.configure('terraformls', {
    on_attach = function()
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
        vim.keymap.set("n", "<leader>ff", "<cmd>!terraform fmt -recursive<cr><cr>", { noremap = true })
    end,
})

lsp.configure('rust-analyzer', {
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.rs",
        command = "silent !cargo fmt"
    })
})

lsp.configure('tsserver', {
    on_attach = function()
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
        vim.keymap.set("n", "<leader>ff", "<cmd>!yarn prettier --write %<cr><cr>", { noremap = true })
    end,
})

lsp.configure('yamlls', {
    settings = {
        yaml = {
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            },
            style = {
                flowSequence = 'allow'
            },
            keyOrdering = false
        },
    },
})

lsp.setup()
