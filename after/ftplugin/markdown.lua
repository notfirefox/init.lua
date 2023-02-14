if string.match(vim.fn.getcwd(), ".*%.github%.io") and vim.fn.executable("hugo") then
  vim.fn.jobstart("hugo server -D")
end
