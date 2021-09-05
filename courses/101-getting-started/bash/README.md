# Bash

So what will we be using bash for? Also how do you even use it in general? Bash is easy enough to get started. If you are on Mac or Linux, you need only to open up the `terminal` application. On windows I believe you can start by running either the `command prompt` or `PowerShell` and then entering the command `bash` to start a bash session.

## What is it

Bash is the "Bourne Again SHell" and it has been around for a very very long time. It is quite standard to find it installed on almost any server you could interact with anywhere. Usually you do not have a graphical interface to interact with those computers (i.e. your mouse is useless because there is nothing to click on). You can think of it as a text conversation between you and your computer. You give it a command and it gives you a response. There are plenty of other shells out there that can do similar things with different syntax but this one is probably the most common.

## The task at hand

What I want to see here is really just an exploration of a few of the common commands and some ways you can use it to do things without having to have a graphical interface on your servers. Bash has a bunch of commands you can use to interact with the computer to accomplish these tasks.

Here is what you will do.

- Create a folder called `newfolder`.
  - Try using the `mkdir` command to "MaKe DIRectory"
- Position your terminal's present working directory in that folder.
  - Try using the `cd` command to "Change Directory"
- Inside that folder, create an empty file called `foobar.sh`.
  - Try using the `touch` command to "touch" the directory there I guess? (Creepy name for a utility)
- List out files that are in your current directory.
  - Try using `ls` to "LiSt" files.
- Edit the `foobar.sh` file and add the following lines of code to it:

```bash
#!/usr/bin/env bash
echo 'Hello there from this bash script!'
```
(the first line starting with the `#!` is called an shebang and it tells your terminal what kind of code it is in the file.)

  - Try using `nano` to edit the file.
  - Ctrl X to exit, Y to save, Enter to return here. You should be able to see that in the menu at the bottom though.
- Try to execute your newly created bash script like so `./foobar.sh`
  - If you see Permission denied, inspect the file's permissions via `ls -l`.
  - If the first few parts say `-rw-r--r--` then you need to change the file to executable like so

```bash
chmod +x foobar.sh
```

  - `chmod` "CHange or MODify" a file.
  - `ls -l` should now show the file is `-rwxr-xr-x`. 
    - `r` = readable
    - `w` = writable
    - `x` = executable
- Now try to execute your newly created bash script like so `./foobar.sh` and you should see this appear in your terminal.

```
Hello there from this bash script!
```

- Try to execute the script again but this time, send the output to a new file called `output.txt`
  - Use the `>` operator to redirect output to a file.
  - Did it work? (list files to see if it worked)
- Now display the contents of the file `output.txt`
  - Try the `cat` command to "conCATenate" and print file contents.
- Repeat the command you used to write the output of the `foobar.sh` script to `output.txt`, what happened?
- Now try again using `>>` instead of one `>`. What changed about the file now?
- Now change your working directory back to the directory you came from
  - Try `cd ..` to go back
- Now destroy that whole folder and everything in it.
  - Try `rm` to "ReMove" the folder.
  - You will need to add a "flag" for this command, flags are usually one or two hyphens and either a letter a word or a few words.
  - To see all available flags for any given command, see the manual page by running `man rm` (you can exit the manual by pressing `q`)

That is probably good enough for now. There are so many more commands to learn. Also using the "tab" key on your keyboard is very helpful to auto-complete certain commands or file names/folder names that you have started typing. Usually you can hit tab twice to show all possible options.
