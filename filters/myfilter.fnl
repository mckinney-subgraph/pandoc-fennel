;; Import fennel to create pprint utility function for testing
(local fennel (require :filters.fennel))
(global pprint (fn [x] (print (fennel.view x))))

;; Replace the first word of the header (multiple words = multiple inlines)
(global Header (fn pandoc.Header [el]
                 (if (= el.level 1)
                     (tset el.content 1 (pandoc.Str "My Header")))
                 el))

