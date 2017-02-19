" From https://raw.githubusercontent.com/hashivim/vim-terraform/master/ftdetect/terraform.vim
au BufRead,BufNewFile *.tf setlocal filetype=terraform
au BufRead,BufNewFile *.tfvars setlocal filetype=terraform
au BufRead,BufNewFile *.tfstate setlocal filetype=javascript
