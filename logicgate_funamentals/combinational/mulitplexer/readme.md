## hierarchial multiplexer
* here a 16to1 mux was created using the behavioural model. we used the 4to1 mux and then 2to1 mux. 
* 2to1 mux was made in the structural model. the key take away was how we can transition from  behavioural model to the structural model. 
## theory 
* a mux is basically a swith which connects multiple input to a single output under the influence of select line.'
* we used the concept of mux tree to make 16:1 using 4:1 and so on.
## common problem and solutin
* problems were plenty though this is a simple code.
* i used number at the beginning of the module name
* and i defined the 16:1 without first defining the 4:1 and 2:1 so it had nothing to instantiate
* portmismatch was a issue as well
## About the file
* contains a vcd file containg the wave form to verify the output.
##  AUTHOR
* ridam katwal
* pulchowk campus, TU

## continue the journey.