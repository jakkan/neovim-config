local u = require("core/utils")

u.bind(u.bind, "Run file (#runtime)", "<leader>rf", ":w<CR>:exe ':silent !open %'<CR>")

