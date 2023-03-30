require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "go",
        "hcl",
        "rust",
        "markdown",
        "gomod",
        "yaml",
        "json",
        "make",
        "tsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "help",
        "query",
        "lua"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = { enable = true },
    autopairs = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.inner",
                ["ib"] = "@block.inner",
            },
            include_surrounding_whitespace = true,
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 2000, -- Do not enable for files with more than specified lines
    },
    autotag = {
        enable = true,
    },
}
