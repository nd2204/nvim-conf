local fugitive = {
  'tpope/vim-fugitive',
  config = function()
  end
}

local gitsign = {
  'lewis6991/gitsigns.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { fugitive },
  config = function()
    require('gitsigns').setup {
      on_attach                    = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "<leader>gA", function() vim.cmd("G commit --amend") end, "Git: commit amend")
        map("n", "<leader>gm", function() vim.cmd("G mergetool") end, "Git: open mergetool quickfix")
        map("n", "<leader>gc", function() vim.cmd("G commit") end, "Git: commit")
        map("n", "<leader>gs", gs.stage_hunk, "Git: stage hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Git: reset hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Git: stage buffer")
        map("n", "<leader>gR", gs.reset_buffer, "Git: reset buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Git: Undo stage hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Git: Preview stage hunks")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Git: Blame line")
        map("n", "<leader>gB", function() gs.toggle_current_line_blame({ full = true }) end, "Git: Toggle line blame")
        map("n", "<leader>gd", function() gs.diffthis() end, "Git: Diff this")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Git: Diff this ~")
      end,
      signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable          = true,
      signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        follow_files = true
      },
      auto_attach                  = true,
      attach_to_untracked          = false,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil,   -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        -- set the border to "single", "double", "rounded", or a table of characters
        border = 'rounded',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    }
  end
}

return {
  fugitive,
  G.Plugins.gitsign and gitsign
}
