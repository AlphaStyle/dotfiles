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
