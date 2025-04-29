A simple project picker (directory switcher for neovim)

Setup with `lazy.nvim`
```lua
{
    "chrisakakay/spm.nvim",
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('spm').setup({
        projects = {
          { name = "project-name-a", path = "C:/CODE/WORK/project-a" },
          { name = "project-name-b", path = "C:/CODE/NOTWORK/project-b" },
        },
      })

      vim.keymap.set("n", "<leader>pp", ":SPM<CR>", { desc = "Open project manager" })
    end
},
```
