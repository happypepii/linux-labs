# Unix-style Access Rights

## Core principal
- Every file and process has an owner and owning group
- Permissions are evaluated in order: Owner -> Group -> Others

## Sets of permissions
each file has three sets of permissions, including:
- Owner (u): the user who owns the file
- Group (g): users in the group
- Others (o): everyone else
*Note:* a (all): everyone (u+g+o)

## Sets of rights

### For *files*
each file contains 3 rights:
1. read (r): view file content
2. write (w): modify the file content
3. execute (x): run file as a program

*Note:* 
- a readable, but not executable script can still be run by launching the appropriate interpreter manually. e.g. `test.py` does not have `x` bit, when `./test.py` => `permission denied`. However if `python3 test.py`, shell checks if python3 is excutable, if so, check if `test.py` has `r` bit => successfully launched

- when a program is run, the new process will inherit the owner and groups of its parent (e.g., of the shell that launched it)
 
### For *directory*
each directory contains 3 rights:
1. read (r): list the directory entries, such as `ls`
2. write (w): **add or remove entries in the directory**
3. execute (x): open the entries, such as `cd`

*Note:* 
- removing write permission from a file inside a writable directory is pointless as it does not prevent the user from overwriting the file completely with a new one.

- it is the w in dir controlling if a file can be removed or not, while the w for file is about modifying the content

- If a directory has x, but not r, you can use the files inside it if you know their names; however, you cannot list them. On the contrary, if a directory has r, but not x, you can only view the entries, but not use them.

- Permissions of a file or directory can be changed only by its owner, regardless of the current permissions. That is, the owner can deny access to themselves by removing all access rights, but can always restore them later.

