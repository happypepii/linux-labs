# Viewing and changing the permission

## Viewing using `ls -l'

you get something like this:
```
drwxr-xr-x 1 intro intro 48 Feb 23 16:00 02/
drwxr-xr-x 1 intro intro 60 Feb 23 16:00 03/
-rw-r--r-- 1 intro intro 51 Feb 23 16:00 README.md
```
the first bit refers to the type of entry:
- `d`: directory
- `-`: for a file

then there are 3 triplets:
1. the 1st triplet for *Owner*
2. the 2nst triplet for *Group*
3. the 3rd triplet for *Others*

the third and forth column are the Owner and Group the file belongs to respectively.

Note:
- Most of the files in your home directory are actually world-readable
- However the permission for your home directory is 
  `drwx------. 1 jiangpe     jiangpe      526 May  9 19:40 jiangpe`
  it indicates that only Owner `jiangpe` can access this directory.

## Changing the permission

`chmod WHO[+=-]PERMISSION file1 file2 ...`
WHO can be empty or `a` (for all three of user, group and others) or specification of `u`, `g` or `o`. And PERMISSION can be `r`, `w` or `x`.

or

`chmod ACL_NUMBER file1 file2`
r: 4
w: 2
x: 1

e.g. `chmod 777 file1` gives everyone rwx permissions 


## Sticky and other bits




