# Keybindings
#### Clipboard shortcuts
- **YY** - "+y (Copy to Clipboard)
- **XX** - "+x (Cut to Clipboard)
- **leader+p** - "+gP (Paste from Clipboard)
---
#### Clear Search pattern (highlighted)
- **leader+space** - :noh (remove search highlight)
---
#### Maintain visual mode after shifting / indenting
- **>** - (Keep visual while indenting)
- **<** - (Keep visual while indenting)
---
#### Move visual block
- **J** - (Move Visual marked block Down)
- **K** - (Move visual marked block Up)
- **leader+up** - (Move Visual marked block Up)
- **leader+down** - (Move Visual marked block Down)
---
#### Reverse indent (both for insert and normal mode)
- **shift+tab** - reverse indent
- **ctrl+T** - add indent *(insert mode)*
- **ctrl+D** - reverse indent *(insert mode)*
---
#### Window Split
- **leader+v** -  Split horizontal side
- **leader+h** -  Split Vertical side
---
#### Switching windows
- **ctrl+j** - down
- **ctrl+k** - up
- **ctrl+l** - right
- **ctrl+h** - left
---
#### Tabs
- **shift+t** - :tabnew (new tab)
- **tab** - gt (switch to next tab)
- **leader+c** - :tabclose (close current tab)
---
#### Folding
- **za** - Toggle folding
- **zc** - Close folding
- **zo** - Open folding
- **zA** - Toggle nested folding
- **zC** - Close nested folding
- **zO** - Open nested folding
---
#### Buffer navigation
- **leader+z** - :bp (buffer previous)
- **leader+q** - :bp (buffer previous)
- **leader+x** - :bn (buffer next)
- **leader+w** - :bn (buffer next)
- **leader+C** - :bd (buffer delete)
---
#### New files based on the path you're working in
- **leader+e** - Create new file in path/direcotry based on the file your in right now
- **leader+te** - Same as `leader+e` just in a tab
---
#### Set Working directory (easy navigation with NERDTree)
- **leader+.** - :lcd %:p:h (set current directory as working directory)
---
#### Terminal
- **leader+sh** - :terminal (open terminal)
---
#### Edit on multiple cursors (Visual mode)
- **ctrl+n** - (Move to next match)
- **ctrl+p** - (Move to previous match)
- **ctrl+x** - (Remove / Skip current match)


*Use `v` to enter normal-mode from visual-mode.*
*Use `c` or `s` to switch to inser-mode from visual-mode.*
*Use `i, a, I, A` in normal-mode.*
*Use `Esc` to exit.*

---
#### Commentary (comment stuff out)
- **gcc** - Comment out a line
- **gc**  - In visual mode to comment out the selection
---
#### Surrounding
- **cs***xy* - x = from, y = to (change the surroundings)
- **ds***x* - x = what to remove (remove the surroundings)
---
#### Far (Find and Replace)
- **:Far {pattern} {replace-pattern} {file-mask} [params]** - find -> replace.


*Use `i`, `x`, `t` in a Far buffer to `include`, `exclude`. `toggle
include/exclude`.*
*Use `%` as file-mask to search current buffer.*

---
#### Tagbar
- **F4** - :TagbarToggle (Toggle Tagbar on and off)
---
#### Ack (with ag)
- **leader+a** - Open ack search
---
#### FZF Fuzzy finder
- **leader+f** - Search and find file in directory
- **leader+leader+f** - Show all files in directory
- **leader+b** - Show all files in buffers (can also search)
---
#### Vim-Node
- **gf** - Use `gf` inside `require("...")` to jump to source and module files.
- **[I** - Use `[I` on any keyword to look for it in the current and required files.
---
#### Clever-f
- **F***x* or **f***x* - Search and find *x*
- **T***x* or **t***x* - Search and move to *x*
*Will highlight x and then click `F, f, T, t` to move to the x you want, then
`a` or `i` to enter inser-mode*
---
#### Emmet
- **Ctrl+y** - Trigger Emmet
---
#### NERDTree
- **F2** - :NERDTreeFind (Find the current file in the NERDTree)
- **leader+F2** - :NERDTreeFind (Find the current file in the NERDTree Tabs)
- **F3** - :NERDTreeToggle (Toggle NERDTree on and off)
- **leader+F3** - :NERDTreeMirrorToggle (Toggle NERDTree on and off in Tabs)
---
#### Git (Fugitive)
- **leader+ga** - :Gwrite (git add %)
- **leader+gc** - :Gcommit (git commit)
- **leader+gsh** - :Gpush (git push)
- **leader+gll** - :Gpull (git pull)
- **leader+gs** - :Gstatus (git status)
- **leader+gb** - :Gblame (git blame info)
- **leader+gd** - :Gvdiff (git split vertical diff)
- **leader+o** - :.Gbrowse (open current line on github with browser)
---
#### Golang
- **gd:** - go-def
- **leader+dd** - go-def-vertical
- **leader+dv** - go-doc-vertical
- **leader+db** - go-doc-browser
- **leader+gi** - go-info
- **leader+gr** - go-run-split
- **leader+rb** - go-build
- **leader+gt** - go-test
- **leader+gl** - go-metalinter
---
# Basic workflow
- **K** - open man page for word under the cursor
### Movement
- **Ctrl+f** – Takes you one page forward
- **Ctrl+b** – Takes you one page back
---
- **H** – Puts the cursor at the top of the screen
- **M** – Puts the cursor in the middle of the screen
- **L** – Puts the cursor at the bottom of the screen
---
- **ctrl+O** - Go to older position in jump list
- **ctrl+I** - Go to newer position in jump list
- **ctrl+]** - Go to tag under cursor
- **ctrl+T** - Jump back from older tag in tag list
---
- **gd** - Goto local decloration of identifier under the cursor
- **gD** - Goto Global decloration of identifier under the cursor
---
- **)** – Takes you to the start of the next sentence
- **(** – Takes you to the start of the previous sentence
- **}** – Takes you to the start of the next paragraph or block of text
- **{** – Takes you to the start of the previous paragraph or block of text
---
- **^** - jump to the first non-blank character of the line
- **g_** - jump to the last non-blank character of the line
- **%** - move to matching character (default supported pairs: '()', '{}', '[]'
- **[[** - Jump to function start
- **[{** - Jump to block start
---
- **fx** - jump to next occurrence of character x
- **tx** - jump to before next occurrence of character x
---
- **zz** - current line to middle
- **zt** - current line to top
- **zb** - current line to bottom
---
### Edit / Copy / Past
- **yy** – Copies a line *(works with y, d, c)*
- **yw** – Copies a word *(works with y, d, c, v)*
- **y$** – Copies from where your cursor is to the end of a line *(works with y, d, c, v)*
- **y0** – Copies everything from where your cursor is to the beginning of the line *(works with y, d, c, v)*
- **yib** - Copy inner block () (*works with y, d, c, v)*
- **yiB** - Copy inner block {} *(works with y, d, c, v)*
- **yab** - Copy a block with () *(works with y, d, c, v)*
- **yaB** - Copy a block with {} *(works with y, d, c, v)*
- **yib** - Copy inner block with () *(works with y, d, c, v)*
- **yiB** - Copy inner block with {} *(works with y, d, c, v)*
- **yit** - inner tag *(works with y, d, c, v)*
- **yi"** - inner quote *(works with y, d, c, v)*
---
- **D** – Deletes everything from where your cursor is to the end of the line
---
- **gq** - format the lines that are in visual mode
---
- **J** - Join lines with space
- **gJ** - Join lines without space
---
### In Visual Mode
- **O** - move to other corner of block
- **aw** - mark a word
- **==** - auto-indent current line
---
### Marks
- **:marks** - list of marks
- **ma** - set current position for mark A
- **`a** - jump to position of mark A
- **y`a** - yank text to position of mark A
- **:delmarks a** - delete mark *a*
---
### Spelling
- **leader+s** - Toggle spelling on/off
- **]s** - Move to next misspelled word
- **[s** - Move to previous misspelled word
---
- **zq** - Add word under cursor as good word to *spellfile*
- **zG** - Add word under cursor as good word to *spellfile* internally
---
- **zw** - Add word under cursor as bad / wrong word to *spellfile*
- **zw** - Add word under cursor as bad / wrong word to *spellfile* internally
---
- **zug** - Remove word from *spellfile*
- **zuG** - Remove word from *spellfile* internally
---
- **z=** - Gives a list with correctly spelled words for word under cursor