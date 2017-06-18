# Keybindings

#### Clipboard shortcuts
- **YY**: "+y (Copy to Clipboard)
- **XX**:"+x (Cut to Clipboard)
- **leader+p**:"+gP (Paste from Clipboard)

---

#### Clear Search pattern (highlighted)
- **leader+space**: :noh (remove search highlight)

---

#### Maintain visual mode after shifting / indenting
- **>**: (Keep visual while indenting)
- **<**: (Keep visual while indenting)

---

#### Move visual block
- **J**: (Move Visual marked block Down)
- **K**: (Move visual marked block Up)
- **leader+up**: (Move Visual marked block Up)
- **leader+down**: (Move Visual marked block Down)

---

#### Reverse indent (both for insert and normal mode)
- **shift+tab**: (reverse indent)

---

#### Window Split
- **leader+v**: Split horizontal side
- **leader+h**: Split Vertical side

---

#### Switching windows
- **ctrl+j**: down
- **ctrl+k**: up
- **ctrl+l**: right
- **ctrl+h**: left

---

#### Tabs
- **shift+t**: :tabnew (new tab)
- **tab**: gt (switch to next tab)
- **leader+c**: :tabclose (close current tab)

---

#### Buffer navigation
- **leader+z**: :bp (buffer previous)
- **leader+q**: :bp (buffer previous)
- **leader+x**: :bn (buffer next)
- **leader+w**: :bn (buffer next)
- **leader+C** :bd (buffer delete)

---

#### Set Working directory (easy navigation with NERDTree)
- **leader+.**: :lcd %:p:h (set current directory as working directory)

---

#### Terminal
- **leader+sh**: :terminal (open terminal)

---

#### Edit on multiple cursors (Visual mode)
- **ctrl+n**: (Move to next match)
- **ctrl+p**: (Move to previous match)
- **ctrl+x**: (Remove / Skip current match)

---

#### Tagbar
- **F4**: :TagbarToggle (Toggle Tagbar on and off)

---

#### NERDTree
- **F2**: :NERDTreeFind (Find the current file in the NERDTree)
- **leader+F2**: :NERDTreeFind (Find the current file in the NERDTree Tabs)
- **F3**: :NERDTreeToggle (Toggle NERDTree on and off)
- **leader+F3**: :NERDTreeMirrorToggle (Toggle NERDTree on and off in Tabs)

---

#### Git (Fugitive)
- **leader+ga**: :Gwrite (git add %)
- **leader+gc**: :Gcommit (git commit)
- **leader+gsh**: :Gpush (git push)
- **leader+gll**: :Gpull (git pull)
- **leader+gs**: :Gstatus (git status)
- **leader+gb**: :Gblame (git blame info)
- **leader+gd**: :Gvdiff (git split vertical diff)
- **leader+o**: :.Gbrowse (open current line on github with browser)

---

#### Golang
- **gd:** go-def
- **leader+dd**: go-def-vertical
- **leader+dv**: go-doc-vertical
- **leader+db**: go-doc-browser
- **leader+gi**: go-info
- **leader+gr**: go-run-split
- **leader+rb**: go-build
- **leader+gt**: go-test
- **leader+gl**: go-metalinter

---

# Basic workflow
- **K** - open man page for word under the cursor

### Movement
- **h** - Moves the cursor to the left
- **l** - Moves the cursor to the right
- **j** - Moves the cursor down one line
- **k** - Moves the cursor up one line
---
- **PageUp** - Move one page up
- **PageDown** - Move one page down
---
- **Ctrl+f** – Takes you one page forward
- **Ctrl+b** – Takes you one page back
---
- **H** – Puts the cursor at the top of the screen
- **M** – Puts the cursor in the middle of the screen
- **L** – Puts the cursor at the bottom of the screen

---
- **w** – Puts the cursor at the start of the next word
- **b** – Puts the cursor at the start of the previous word
- **e** – Puts the cursor at the end of a word
---
- **0** – Places the cursor at the beginning of a line
- **$** – Places the cursor at the end of a line
---
- **)** – Takes you to the start of the next sentence
- **(** – Takes you to the start of the previous sentence
- **}** – Takes you to the start of the next paragraph or block of text
- **{** – Takes you to the start of the previous paragraph or block of text
---
- **gg** – Places the cursor at the start of the file
- **G** – Places the cursor at the end of the file
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
- **v** – Highlight one character at a time using arrow buttons or the h, k, j, l buttons
- **V** – Highlights one line, and movement keys can allow you to highlight additional lines
- **p** – Paste whatever has been copied to the unnamed register
---

### In Visual Mode
- **O** - move to other corner of block
- **aw** - mark a word
---

### Marks
- **:marks** - list of marks
- **ma** - set current position for mark A
- **`a** - jump to position of mark A
- **y`a** - yank text to position of mark A









