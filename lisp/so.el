(require 'json)

(defun my-get-stackoverflow-answers (query)
  (interactive "sQuestion: ")
  (let* ((question_ids
          (with-current-buffer
              (url-retrieve-synchronously
               (concat "https://google.com/search?ie=utf-8&oe=utf-8&hl=en&as_qdr=all&q="
                       (url-hexify-string (concat query " site:stackoverflow.com"))))
            (let (ids)
              (while (re-search-forward "https://stackoverflow.com/questions/\\([0-9]+\\)" nil t)
                (push (match-string-no-properties 1) ids))
              (setq ids (reverse ids))
              (if (> (length ids) 5)
                  (seq-subseq ids 0 5)
                ids))))

         (url_template (format "https://api.stackexchange.com/2.2/questions/%s%%s?site=stackoverflow.com"
                               (string-join question_ids ";")))

         (questions (with-current-buffer
                        (url-retrieve-synchronously
                         (format url_template ""))
                      (goto-char (point-min))
                      (search-forward "\n\n")
                      (append (assoc-default 'items (json-read)) nil)))

         (answers (with-current-buffer
                      (url-retrieve-synchronously
                       (concat (format url_template "/answers")
                               "&order=desc&sort=activity&filter=withbody"))
                    (goto-char (point-min))
                    (search-forward "\n\n")
                    (sort (append (assoc-default 'items (json-read)) nil)
                          (lambda (x y)
                            (> (assoc-default 'score x)
                               (assoc-default 'score y)))))))

    (switch-to-buffer "*stackexchange*")
    (erase-buffer)

    (dolist (question_id (mapcar 'string-to-number question_ids))
      (let ((question (some (lambda (question)
                              (if (equal (assoc-default 'question_id question)
                                         question_id)
                                  question))
                            questions)))
        (insert "<hr><h2 style='background-color:paleturquoise'>Question: "
                (format "<a href='%s'>%s</a>"
                        (assoc-default 'link question)
                        (assoc-default 'title question))
                "</h2>"
                "\n"
                (mapconcat
                 'identity
                 (let ((rendered
                        (remove-if
                         'null
                         (mapcar (lambda (answer)
                                   (if (and (equal question_id
                                                   (assoc-default 'question_id answer))
                                            (>= (assoc-default 'score answer) 0))
                                       (concat "<hr><h2 style='background-color:"
                                               "#c1ffc1'>Answer - score: "
                                               (number-to-string (assoc-default 'score answer))
                                               "</h2>"
                                               (assoc-default 'body answer))))
                                 answers))))
                   (if (> (length rendered) 5)
                       (append (seq-subseq rendered 0 5)
                               (list (format "<br><br><a href='%s'>%s</a>"
                                             (assoc-default 'link question)
                                             "More answers...")))
                     rendered))
                 "\n")
                )))
    (shr-render-region (point-min) (point-max))
    (goto-char (point-min))
    (save-excursion
      (while (search-forward "^M" nil t)
        (replace-match "")))))

(provide 'so)
