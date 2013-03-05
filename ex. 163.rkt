;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex. 163|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.ss" "teachpack" "2htdp")))))
; Andrew Tran Ex. 163

(define-struct mail (from date message))
; A Mail Message is a structure: 
; – (make-mail String Number String)
; interp. (make-mail f d m) represents text m sent by
; f, d seconds after the beginning of time 

(define mail1 (make-mail "andrew" 12 "hi"))
(define mail2 (make-mail "pearce" 834 "whats up"))
(define mail3 (make-mail "joseph" 100034 "not much"))


; A List-of-mail is one of:
; empty
; (cons Mail List-of-mail)
; interp. a List-of-mail as a list of email messages 

; List-of-mail -> List-of-mail
; to take a list-of-mail and sort the mail by date.
(check-expect (sort-date (list mail1 mail3 mail2)) 
              (list mail1 mail2 mail3))
(define (sort-date lom) 
  (cond
    [(empty? lom) empty]
    [(cons? lom) (insert-date (first lom) (sort-date (rest lom)))]))

; Mail List-of-mail -> List-of-mail
; insert the mail into the sorted list of mail,lom, by date, newest to oldest
(check-expect (insert-date mail2 (list mail1 mail3)) 
              (list mail1 mail2 mail3))
(define (insert-date m lom) 
  (cond
    [(empty? lom) (cons m empty)]
    [else (if (<= (date m) (date (first lom)))
              (cons m lom)
              (cons (first lom) (insert-date m (rest lom))))])) 

; mail -> number
; take the date out of a mail structure
(check-expect (date mail1) 12)
(define (date m) (mail-date m))

; List-of-mail -> List-of-mail
; to take a list-of-mail and sort the mail by name.
(check-expect (sort-name (list mail1 mail3 mail2)) (list mail1 mail3 mail2))
(define (sort-name lom) 
    (cond
    [(empty? lom) empty]
    [(cons? lom) (insert-name (first lom) (sort-name (rest lom)))]))

; Mail List-of-mail -> List-of-mail
; insert the mail into the sorted list of mail,lom, by name
(check-expect (insert-name mail2 (list mail1 mail3)) 
              (list mail1 mail3 mail2))
(define (insert-name m lom) 
  (cond
    [(empty? lom) (cons m empty)]
    [else (if (string<? (name m) (name (first lom)))
              (cons m lom)
              (cons (first lom) (insert-name m (rest lom))))]))

; mail -> string
; take the name out of a mail structure
(check-expect (name mail1) "andrew")
(define (name m) (mail-from m))

