(asdf:defsystem #:cg
  :description "Matteo's command guesser"

  :author "Matteo Landi <matteo@matteolandi.net>"
  :license  "MIT"

  :version "0.0.1"

  :depends-on (#:cl-ppcre)

  :defsystem-depends-on (:deploy :unix-opts)
  :build-operation "deploy-op"
  :build-pathname "cg"
  :entry-point "cg:toplevel"

  :serial t
  :components ((:file "package")
               (:module "src" :serial t
                        :components
                        ((:file "main")))))
