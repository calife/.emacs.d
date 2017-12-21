    `;; .emacs --- my Emacs Init File
    ;;
    ;; Author: Pucci Marcello <(concat "califerno" at-symbol "gmail.com")>
    ;; Keywords: emacs, dotfile, config
    ;; Last modified : Wednesday, 09. November 2016
    ;;
    ;;    ___ _ __ ___   __ _  ___ ___
    ;;   / _ \ '_  _ \ / _ |/ __/ __|
    ;;  |  __/ | | | | | (_| | (__\__ \
    ;; (_)___|_| |_| |_|\__,_|\___|___/
    ;;
    ;; This file is NOT part of GNU Emacs.k
    ;;; Commentary:
    ;;  Citations
    ;;
    ;;     "Show me your ~/.emacs and I will tell you who you are."
    ;;                                                         [Bogdan Maryniuk]
    ;;
    ;;     "You should find this file in /home/mpucci directory or elsewhere on the net"
    ;;                                                         [Anonymous]`
    ;;

  * 1- Install emacs

  * 2- Download via git into .emacs.d folder

  * 3- Remove or backup any previous ~/.emacs file

  * 4- Clean .elc and recompile
`	cd .emacs.d/other-parts/
	find . -name '*.elc' exec rm -f '{}' \;
	emacs --batch --eval "(byte-recompile-directory \"elpa/\" 0)"`
	
	or
	
`	C-u 0 M-x byte-recompile-directory `

  * 5- Run emacs
  
  
  6- bash profile link for cygwin required
  
  $ ls -l .bashrc
  lrwxrwxrwx 1 HP-Meware NESSUNO 41 Dec 20 19:10 .bashrc -> /cygdrive/c/cygwin/home/HP-Meware/.bashrc

Enjoy!

P.S. If you are completely new to Emacs you should use C-h t (That is press Control-h and then t) 
     to launch inbuilt Emacs tutorial from within Emacs
