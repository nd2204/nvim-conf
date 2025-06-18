return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- or, branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- TODO: modify the overlay for each telescope function
      local actions = require("telescope.actions")
      local telescope = require("telescope")

      telescope.setup {
        defaults = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
            horizontal = {
              height = 0.8,
              preview_cutoff = 120,
              preview_width = 0.6,
              width = 0.8
            },
            vertical = {
              height = 0.9,
              preview_cutoff = 40,
              width = 0.8
            }
          },
          file_ignore_patterns = { '.exe', '.tmp', '.dll' },
          prompt_prefix = "   ",
          entry_prefix = "  ",
          selection_caret = "  ",
          multi_icon = "  ",
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<M-k>"] = actions.preview_scrolling_up,
              ["<M-j>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
              ["<esc>"] = actions.close,
              ["q"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
              ["?"] = actions.which_key,
            },
          },
        },
        pickers = {
          diagnostics = {
            theme = "ivy", -- Use the ivy theme
            bufnr = 0,     -- Restrict diagnostics to the current buffer
            previewer = false,
            layout_config = {
              height = 10
            },
            attach_mappings = function(_, _)
              -- Automatically set mode to Normal when picker opens
              vim.cmd('stopinsert')
              return true -- Continue with other mappings
            end,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          }
        }
      }

      local keymap = vim.keymap.set
      local builtin = require('telescope.builtin')
      local theme = require('telescope.themes')

      local find_buffer = function() builtin.buffers(theme.get_dropdown()) end
      local help_tags = function() builtin.help_tags() end
      local oldfiles = function() builtin.oldfiles() end
      local live_grep = function() builtin.live_grep(theme.get_ivy({ previewer = false })) end
      local find_files = function() builtin.find_files(theme.get_dropdown({ previewer = false })) end
      local find_higlights = function() builtin.highlights() end
      local list_diagnostics = function()
        builtin.diagnostics({
          bufnr = 0, -- Restrict diagnostics to the current buffer
          on_complete = { function() vim.cmd "stopinsert" end }
        })
      end

      keymap('n', '<leader>fb', find_buffer, { desc = 'Telescope buffers' })
      keymap('n', '<leader>fh', help_tags, { desc = 'Telescope help tags' })
      keymap('n', '<leader>fH', find_higlights, { desc = 'Telescope highlights' })
      keymap('n', "<leader>fo", oldfiles, { desc = "Recent File" })
      keymap('n', '<leader>fg', live_grep, { desc = 'Telescope live grep' })
      keymap('n', '<leader>ff', find_files, { desc = 'Telescope find files' })
      keymap('n', "<leader>fd", list_diagnostics, { desc = "Diagnostics" })
    end
  },
  G.Plugins.project and {
    "ahmedkhalf/project.nvim",
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("project_nvim").setup {
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { "lsp", "pattern" },

        -- All the patterns used to detect root dir, when **"pattern"** is in detection_methods
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

        -- Table of lsp clients to ignore by name eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your directory.
        silent_chdir = false,

        -- What scope to change the directory, valid options are: global (default), tab, win
        scope_chdir = 'global',

        -- Path where project.nvim will store the project history for use in telescope
        datapath = vim.fn.stdpath("data"),
      }
      require('telescope').load_extension('projects')
      local recent_projects = function()
        vim.cmd("Telescope projects theme=dropdown") -- Opens and focuses a new tab
      end
      vim.keymap.set('n', '<leader>P', recent_projects, { desc = 'Recent projects' })
    end
  }
}
