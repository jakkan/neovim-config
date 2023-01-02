local u = require("core/utils")

u.bind(u.normal, "Run file (#runtime)", "<leader>rf", ":w<CR>:vsp<CR>:term bash %:p<CR><C-\\><C-n>")
