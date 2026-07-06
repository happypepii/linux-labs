Get this archive first:

https://d3s.mff.cuni.cz/f/teaching/nswi177/202526/labs/nswi177-lab02-wildcards.tar.gz

Get contents of all files in subdirectory `login` that
start with a decimal digit, ends with `z.txt` and the middle letter is
any letter (i.e., a to z, not numbers) from your GitLab login
(in lowercase).

For example, if your login is `johndoe`, you should paste contents from files
`0jz.txt`, `1ez.txt` but not from `ajz.txt` or `2wz.txt` or
`0jx.txt`.

Sort the list of files alphabetically before getting their content, duplicate
letters should be ignored (i.e., use wildcards naturally and you will be fine).


**Q1** Paste the contents of the files here
(do not insert any extra characters such as newlines, though).

Insert your answer between the markers below, replacing the three dots.
Leading and trailing whitespace in your answer will be ignored but
keep the starred A1 markers without changes (tests will check that).

**[A1]** lrtuyalrtuyalrtuyalrtuyalrtuyalrtuya **[/A1]**


**Q2** Insert here the wildcard pattern that you have used
(only the pattern without `ls` or any other command you have used).

**[A2]** [0-9][jiangpe]z.txt **[/A2]**


**Q3** Paste here a full command (including `ls`) to print all
files in the `letters` directory that end with the letter `o`.
Please, assume that you are executing `ls`
from the `letters` subdirectory and **use a proper wildcard**.

**[A3]** ls -- *o **[/A3]**