;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex. 163|) (read-case-sensitive #t) (teachpacks ((lib "batch-io.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.ss" "teachpack" "2htdp")))))
; Andrew Tran Ex. 163

(define-struct mail (from date message))
; A Mail Message is a structure: 
; – (make-mail String Number String)
; interp. (make-mail f d m) represents text m sent by
; f, d seconds after the beginning of time 

; A List-of-mail is one of:
; empty
; (cons Mail List-of-mail)
; interp. a List-of-mail as a list of email messages 


