-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information


local function setupFileBrowser()
    pcall(require('telescope').load_extension, 'file_browser')
end

-- Set the shell option - neovim can read .bash_profile file
vim.opt.shell = "/bin/bash -l"


-- Setup an autocommand to run the setup function after Neovim has started
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = setupFileBrowser,
})

-- Set up Prettier autoformat on save for specific file types
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.js", "*.jsx", "*.ts", "*.tsx"},
    command = "Prettier",
})

-- No line numbers in Neovim terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber"
  })
  

return {
  -- Pretter
  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    -- Optionally, you can specify a branch, tag, or commit:
    -- branch = 'main', -- or specific tag/commit
  },
    -- Telescope file_browser
    {
    'nvim-telescope/telescope-file-browser.nvim',
  },
}


