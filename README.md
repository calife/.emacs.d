<!-- Deploy -->
<!-- Tuesday, 08. November 2016 -->
<!-- Author: califerno@gmail.com -->

  * 1- Install emacs

  * 2- Download via git into .emacs.d folder

  * 3- Remove or backup any previous ~/.emacs file

  * 4- Clean .elc and recompile
`	cd .emacs.d/other-parts/
	find . -name '*.elc' exec rm -f '{}' \;
	emacs --batch --eval "(byte-recompile-directory \"elpa/\" 0)"`

  * 5- Run emacs

Enjoy!
