" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile Jenkinsfile setfiletype groovy
  au! BufRead,BufNewFile SCon* setfiletype python
augroup END
