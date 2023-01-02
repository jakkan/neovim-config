local u = require("core/utils")

u.bind(u.normal, "Run file (#runtime)", "<leader>rf" , ":w<CR>:vsp<CR>:term tsc %:p && node %:r.js<CR><C-\\><C-n>")
