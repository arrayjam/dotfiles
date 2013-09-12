(require 'package)
(add-to-list 'package-archives
	    '("marmalade" .
	      "http://marmalade-repo.org/packages/"))
(package-initialize)

(load-theme 'solarized-dark t)

(menu-bar-mode -1)
