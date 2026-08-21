return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Only start if a valid parser is installed for the current file type
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and vim.treesitter.query.get(lang, "highlights") then
          vim.treesitter.start()
        end
      end,
    })

    
    require("nvim-treesitter").install({
      "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java", "cpp"
    })
  end,
}

