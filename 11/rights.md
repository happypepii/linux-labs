Assume that we have a file `test.txt` for which `ls -l` prints the following:

    -rw-r----- 1 bjorn ursidae 13 Mar 21 14:54 test.txt

Which of the following users will be able to read the contents of the file?

 1. `bjorn` in group `ursidae`
 2. `bjorn` in groups `carnivora` and `mammalia`
 3. `iorek` in group `ursidae`
 4. `iorek` in groups `carnivora` and `mammalia`
 5. `root` (the superuser)
 6. everybody

**[A1]** 1,2,3,5  **[/A1]**

Consider that the file from the previous example is stored within
the directory `/data` with the following permissions as printed by `ls -l`:


    drwxrwx-wx 3 bjorn ursidae 4096 Mar 21 14:53 data


Which of the following users will be able to delete the file?

 1. `bjorn` in group `ursidae`
 2. `bjorn` in groups `carnivora` and `mammalia`
 3. `iorek` in group `ursidae`
 4. `iorek` in groups `carnivora` and `mammalia`
 5. `root` (the superuser)
 6. everybody

You can assume that the root directory `/` is readable and executable
by everybody.

**[A2]** 6 **[/A2]**

Continuing with the previous questions, which commands can be used to make
the file `test.txt` readable and writeable only to the owner and nobody else?

 1. `chmod u=rw test.txt`
 2. `chmod =rw test.txt`
 3. `chmod g= test.txt`
 4. `chmod o= test.txt`
 5. `chmod g=,o= test.txt`
 6. `chmod g-r test.txt`
 7. `chmod g-rwx test.txt`

**[A3]** 3,5,6,7  **[/A3]**
