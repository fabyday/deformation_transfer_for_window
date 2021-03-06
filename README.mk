#+TITLE: Deformation Transfer in ANSI C

#+CAPTION: Demonstration
#+LABEL:   demonstration
[[https://github.com/Golevka/deformation-transfer/raw/master/RESULTS/dt-horse-camel-face-head.png]]


* What's This?

This is an implementation of Deformation Transfer algorithm in ANSI C, which
could transfer the deformation of one triangle mesh to another. Check this
paper
(http://people.csail.mit.edu/sumner/research/deftransfer/Sumner2004DTF.pdf) for
detailed explaination of this algorithm and here
(http://people.csail.mit.edu/sumner/research/deftransfer/) for demonstrations
and mesh data.


* Compile

You need CHOLMOD (http://www.cise.ufl.edu/research/sparse/cholmod/) and UMFPACK
(http://www.cise.ufl.edu/research/sparse/umfpack/) to compile it, drop the
header files and libs to the ./external folder if you've compiled them on your
own, or just try the precompiled version in this repository.

After these libs has been set properly, type =make= to build them all.


* Try A Shakedown Run

Run sample_run.sh in bin directory, the resulting deformed target model would
be shown by our corrstool. The calculation takes about one minute or so
(resolving corresponence and deforming 10 models).

[[https://github.com/Golevka/deformation-transfer/raw/master/RESULTS/shakedown_run.png]]

You can read the comments in sample_run.sh to see how to apply these tools to
your own .OBJ models.


* Usage of Corrstool

Correspondence phase: You need to pick up a small set of marker points to
specify the semantic correspondence between the source model and the target
model, we provided a tool here (corrstool), you can launch it using

#+BEGIN_SRC shell
    ./corrstool source_model target_model
#+END_SRC

for example, running this command in bin directory
    
#+BEGIN_SRC shell
    ./corrstool horse_ref.obj camel_ref.obj
#+END_SRC
     
would open a window showing the source model at the left panel and target model
at the right panel, drag your mouse with left mouse button pressed to view the
model in a different angle (it would change the view angle of the two panels
simutanously), and drag with right mouse button pressed to zoom the view.

#+CAPTION: Corrstool
#+LABEL:   corrstool
[[https://github.com/Golevka/deformation-transfer/raw/master/RESULTS/correstool.png]]

You can move the cursor to somewhere in the model you want to mark and press
=P= to mark this point, after having specifed marker points on both models,
press =A= to "commit" this point pair to correspondence list, if you hit =A= by
mistake, just hit =U= (undo) to recover from that.

The points you picked up may not right on where your cursor pointed to, this is
because of marker points can *only* appear on vertices of the mesh model, you can
view models in wired mode by pressing =M=, and strike it again to get back to
solid mode. If you want to switch to another point on the same piece of triangle, 
just hit =C= many times until you get what you want.

[[https://github.com/Golevka/deformation-transfer/raw/master/RESULTS/wired_mode.png]]

After all marker points has been specified, press =W= to write the
correspondence to a .cons file (default.cons by default).





cmake install guide
===

hi, this repo is ported repo for windows. you don't need to concern dependencies.

just follow next guide. 


In deforamtion_transfer_cmake directory. open cmd panel. and type bellow commands.
```

mkdir build && cd build && cmake -S . -B _build -DSuiteSparse_DIR=../../_install/lib/cmake/suitesparse-5.1.0

```

then you can find deformation_transfer.sln file in deformation_transfer/**build** directory. 

click slution file and then compile them.


and see deformation_transfer/bin2 , you can find **corrstool**, **corres_resolve**, **modelviz** executable files.

and have fun.