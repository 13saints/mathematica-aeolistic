# Gaylord D'Andria Simulating Society Logs



| 2020   | Tasks                                              |
| ------ | -------------------------------------------------- |
| Dec 12 | Appendix A, Appendix B till p173.                  |
| Dec 19 | Chapter 1 programs replicated. Exercises not done. |
|        |                                                    |
|        |                                                    |
|        |                                                    |
|        |                                                    |

Dec19_  I was able to replicate the results presented by the code in chapter 1. RasterArray and GraphicsArray have been deprecated, but wolfram auto-translates them into what is required. 100x100 grid for 10000 iterations takes about 16 minutes to compute (using Nest instead of NestList, which takes forever). 

![comp10k](C:\Users\Cystennin\Desktop\scriptresults\comp10k.png)

![ch1](/outputs/ch1.png)

MapThread is an important concept. I don't know how to put it in words. Think the following: you have a command that requires multiple arguments; each argument can be obtained through a simple translation of the current state. You layer these translations one on top of the other. MapThread takes each element of the base layer, and strings it together with the element right on top of it, and then the element on top of that, and so on until arrival at the element on the topmost layer. Each string now contains the arguments necessary to execute the command. 