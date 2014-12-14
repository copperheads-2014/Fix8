for i in `git branch -r --merged | cut -d '/' -f2`
git push origin :$i
