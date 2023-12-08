-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

-- See the kickstart.nvim README for more information

-----------------------------------------------------------
--Settings
-- Increase distance between line numbers and edge
vim.wo.numberwidth = 4

-- Set the shell option - neovim can read .bash_profile file
vim.opt.shell = "/bin/bash -l"

-- Function to setup file browser extension for Telescope
local function setupFileBrowser()
    pcall(require('telescope').load_extension, 'file_browser')
end

-- Function to setup OneDark theme with a darker variant
local function setupOneDarkDarker()
    local status_ok, onedark = pcall(require, "onedark")
    if not status_ok then
        return
    end

    onedark.setup({
        style = 'darker' -- There are different versions like 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
    })

    vim.cmd("colorscheme onedark")
end

-- Function to set up lualine with a specific theme
local function setupLualine()
    local lualine_ok, lualine = pcall(require, "lualine")
    if not lualine_ok then
        print("Lualine not loaded")
        return
    end

    lualine.setup {
        options = {
            icons_enabled = false,
            theme = 'onedark'
        }
    }
end

-- Combine setup functions to be called when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        setupFileBrowser()
        setupOneDarkDarker()
        setupLualine()
        vim.cmd("IBLDisable")
    end,
})

-- Set up Prettier autoformat on save for specific file types
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.html", "*.json"},
    command = "Prettier",
})

-- No line numbers in Neovim terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber"
})

-- Return statement for your plugin configurations
return {
  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
  },
}
