;;; befunge-help.el --- Show help for befunge commands

;; Author: Noah Peart <noah.v.peart@gmail.com>
;; URL: https://github.com/nverno/befunge
;; Package-Requires: 
;; Copyright (C) 2016, Noah Peart, all rights reserved.
;; Created: 28 August 2016

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:

;;  Show help for befunge commands

;;; Code:

(defvar befunge-docs-file nil)
(setq befunge-docs-file
      (when load-file-name
        (expand-file-name "docs" (file-name-directory load-file-name))))

(defvar befunge-help-cache nil)
(defun befunge-help-data ()
  (or befunge-help-cache
      (progn
        (with-temp-buffer
          (insert-file-contents befunge-docs-file)
          (let ((data (car
                       (read-from-string
                        (buffer-substring-no-properties (point-min)
                                                        (point-max))))))
            (setq befunge-help-cache data)))
        befunge-help-cache)))

;;;###autoload
(defun befunge-help ()
  (interactive)
  (let ((data (befunge-help-data)))
    (pp data)))

;; (cl-loop for (k . v) in befunge-help-cache
;;      collect )

(provide 'befunge-help)

;;; befunge-help.el ends here
