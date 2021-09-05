# Python

Now we look at some python programming. This is not intended to be an exhaustive guide to how to use Python. Rather it will get you started on a few things that will help to make you a more effective python developer.

## Running Python

There are really 2 ways to run python programs.

1. Run interactively.
2. Run as a program.

### Running Interactively

If you have a terminal session open you can start an interactive python shell by simply typing `python3`. It should introduce itself and start a line waiting to accept python code looking something like this:

```python
>>> 
```

Go ahead and write `print("Hello World!")` and hit enter there to see python execute that line of code immediately. People usually use this interactive shell as a way to do one-off tasks or to test things on a small scale. Most of the time however you will end up writing your python program in a file and then you will execute that file somehow. That is what I am referring to as running python as a program. You can exit the python interactive shell byt running `exit()` or poke around some more if you like.

### Running as a Program

Running a python program is 2 part. First you write the program, then you run it. People who say "Python is not a _real_ programming language, it is just a scripting language" are ass hats. You can do anything in python that you want. It is a fully fledged and fully featured programming language. It is "interpreted" instead of "compiled". Meaning that unlike some languages, Python is read and then run in one fell swoop from the same file where as some other languages are "complied" which creates an entirely separate file that can be executed. Your source code and your executable are one and the same in python. For compiled languages that is not the case.

So! Let's create a python file called `foobar.py` and inside of it put the following:

```python
#!/usr/bin/env python3
print("Hello World from my python script!")
```

then once the file is created run `./foobar.py` on the terminal to see if it will execute. If it does not, try to change to file permissions or fix the error that you are facing.
