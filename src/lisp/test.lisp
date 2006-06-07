(in-module "clojure")

#+:JVM(import "java.lang" '(String Class Math System))
#+:CLI(import "System, mscorlib" '(String Type Math Console))

(defn f0 ())

(defn f1 (x) x)

(defn f2 (x y) y)

(defn f5 (a b c d e) (d e) (f1 a))


(defn* f01
       (())
       ((x) x))

(defn fa (x)
      (.foo x))

(defn fk (x)
      (:foo x))

(defn fl (a b c)
      (let ((d (let ((x a))
                 x)))
        d)
      (let ((e c))
        e))

(defn fl* (a b c)
      (let* ((d b)
             (e d))
        e))

(defn always (x)
      (fn () x))

(defn fletfn (x)
      (letfn ((a (b) b)
              (c (d) (a d))
              (d (x) (d a)))
             (c x)))


(defn fif (a b x y z)
      (if a
           (if (if x y z)
               0
             z)
         b))

(defn fr (a b & c) c)

(defn fnot (x y z)
      (if (not x)
          (not y)
        (not z)))

(defn forf (x y z)
      (if (or x y)
          x
        (or x y z)))


(defn fand (x y z)
      (if (and x y)
          x
        (and x y z)))

(defn fset (x y z)
      (set x 1)
      (set b #\y)
      (if (set (:foo x) z)
          (set (.bar y) z)
        (set (foo x y) z)))

(defn fdo (a b c)
      (do ((a b a)
           (b c b))
          (c)
        a b c)
      (do ((a b a)
           (b c b))
          (c b)
        a b c))

(defn fg (x)
      y)

(defn ftry (x)
      (try
       (foo x)
       nil
       (bar x))
      (try
       (let ((ex x))
         (try
          (foo x 2)
          (fred ex "string")
          (bar x)))
       (foo x)
       (fred ex)
       (bar x))
      (try
       (foo x)
       (fred ex)
       (bar x)
       "foo"))

(defn fbind (a b c x)
      (bind ((x t)
             (y 17))
            c)
      (bind ((x nil)
             (y b))
            c))

(defn fq (x)
      (if ':key '.foo 'a))

(defn fql ()
      '(1 2 3 (4 5)))

(defn fcast ()
      (if (int 7) (char 17) (long 29999)))

(defn fmem ()
      #+:JVM
      (if (Class.forName "Object")
          (String.valueOf 7)
        Math.PI)
      #+:CLI
      (if (Type.GetType "Object")
          (String.Intern "fred")
        Math.PI)
      (set Math.PI 3.14))

(defn finst (x)
      (if (instance? x String.)
          1 
        2))

(defn prn (x)
      #+:JVM (.println System.out x)
      #+:CLI (Console.WriteLine x))

(defn fmain (args)
      (prn "Hello World!"))

(defmain fmain)