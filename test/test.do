TITLE: Syntax Testing
AUTHOR: Ethan Rietz
DATE: today

======= Section =======

This is sentence with _bold_ and *italics*, `code`, and a ``quote'' in it.

o Numbered lists look like this
  o They can be nested

===== Subsection =====

* Bullet lists look like this
  * They can be nested too

We can have a footnote [^note]

[^note]: Though it is completely unncessary here.

!bquiz 
Q: What is $\int x dx$?
Cr: \(\frac{x^2}{2}\)
E: This is how integrals work
Cw: foo
Cw: bar
!equiz

Some figure here

FIGURE: [./syntax.png]

# A comment here

And here is an inline comment [Ethan: change this sentence]

Some equation here

!bt
\begin{equation}
e^{i\pi} + 1 = 0
\end{equation}
!et

Some code here

!bc
for i in range(10):
  print(i)
!ec
