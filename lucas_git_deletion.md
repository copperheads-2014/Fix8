for i in `/usr/local/bin/git branch -r --merged | cut -d '/' -f2`
/usr/local/bin/git push origin :$i
