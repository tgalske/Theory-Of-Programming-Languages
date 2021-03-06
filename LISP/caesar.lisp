(defun shift (letter num-shift)
  (let* (
    (chcode (char-code letter))
    (letter-value (cond ((and (>= chcode 97) (<= chcode 122)) 97)
	                    ((and (>= chcode 65) (<= chcode 90)) 65))
    )
  )
    (if letter-value (code-char (+ (mod (+ (- chcode letter-value) num-shift) 26) letter-value)) letter)
  )
)

(defun enc (sentence num-shift)
  (map 'string #'(lambda (c) (shift c num-shift)) sentence)
)

(defun decrypt (sentence num-shift)
  (enc sentence (- num-shift))
)


(defun solve (sentence max-shift)
  (let ((i 0))
    (loop while (>= max-shift 0) do
      (format t "Caesar ~a: ~a ~%" max-shift (decrypt sentence i))
      (setq max-shift (- max-shift 1))
      (setq i (+ i 1))
    )
  )
)


(let* ((sentence-to-encrypt "Hello world!")
       (sentence-to-decrypt "Ohwwf Aohurznpcpun")
       (num-shift 3)
       (encrypted-string (enc sentence-to-encrypt num-shift))
       (num-shift 7)
       (decrypted-string (decrypt sentence-to-decrypt num-shift))
       )
    (format t "~a ~%" sentence-to-encrypt)
    (format t "~a ~%" encrypted-string)
    (format t "~a ~%" decrypted-string)
    (solve "HAL" 26)
)