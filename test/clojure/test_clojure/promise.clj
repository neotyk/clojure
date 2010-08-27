;   Copyright (c) Rich Hickey. All rights reserved.
;   The use and distribution terms for this software are covered by the
;   Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
;   which can be found in the file epl-v10.html at the root of this distribution.
;   By using this software in any fashion, you are agreeing to be bound by
;   the terms of this license.
;   You must not remove this notice, or any other, from this software.

;; Author: Hubert Iwaniuk

(ns clojure.test-clojure.promise
  (:use clojure.test))

(deftest promise-deliverable
  (let [p (promise)]
    (deliver p true)
    (is (true? @p))))

(deftest not-delivered-promise-check
  (let [p (promise)]
    (is (false? (delivered? p)))))

(deftest delivered-promise-check
  (let [p (promise)]
    (deliver p 42)
    (is (true? (delivered? p)))))

(deftest delivery-check-of-non-promise
  (is (nil? (delivered? "a"))))
