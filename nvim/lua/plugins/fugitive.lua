return {
    "tpope/vim-fugitive",
    dependencies = {
        "lewis6991/gitsigns.nvim"
    },
    config = function ()
        local gitsigns = require("gitsigns")
        gitsigns.setup{
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
              },
              signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
              },
              signs_staged_enable = true,
              signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
              numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
              linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
              word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
              watch_gitdir = {
                follow_files = true
              },
              auto_attach = true,
              attach_to_untracked = false,
              current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
              current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
              },
              current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
              sign_priority = 6,
              update_debounce = 100,
              status_formatter = nil, -- Use default
              preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
              },
        }
        vim.keymap.set('n',"<leader>dd",":Gdiffsplit<cr>",{desc = "Diff current buffer"})
        vim.keymap.set('n',"<leader>da",":Git difftool --name-status<cr>",{desc = "Show file status in quickfix list"})
        vim.keymap.set('n',"<leader>bb",":Git blame<cr>",{desc = "Blame"})
        vim.keymap.set('n',"<leader>bl",":Gitsigns toggle_current_line_blame<cr>",{desc = "Blame current line"})
        -- vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"},
        --     {
        --         pattern = {"*"},
        --         callback = function()
        --             if vim.wo.diff then
        --                 print("Here with vim diff: True")
        --                 vim.keymap.set("n","<C-n>","]c",{desc = "Next hunk"})
        --                 vim.keymap.set("n","<C-p>","[c",{desc = "Previous hunk"})
        --             end
        --         end
        --     }
        -- )
        -- vim.api.nvim_create_autocmd({"OptionSet"},
        --     {
        --         pattern = "diff",
        --         callback = function()
        --             if vim.wo.diff then
        --                 vim.keymap.set("n","<C-n>","]c",{desc = "Next hunk"})
        --                 vim.keymap.set("n","<C-p>","[c",{desc = "Previous hunk"})
        --             end
        --         end
        --     }
        -- )
        end
}
