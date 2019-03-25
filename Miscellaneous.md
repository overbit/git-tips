git diff  --name-only  origin/master..origin/30.0 '*.js' > /c/Users/diasella/Desktop/gitDiff.txt

git diff  --name-only 6c27351c21bae27f29ffda49ca230ce3adcc9c6a..f63db5965d81b66cb3476bc4b89d1d7c1449ed78  > /c/Users/diasella/Desktop/gitDiff.txt

gitk 165bdc979b7bc3f7e7b0ed1fabb459d60783b232..HEAD db/

Number of commits went live :  git rev-list --count v30.6.0..v30.7.0
Number of files changed :  git whatchanged v30.6.0..v30.7.0 --format=oneline | wc -l
Top authors (it won't take into account pairing): git shortlog -sn  v30.6.0..v30.7.0

------------------- ATTENTION -------------------
do a "git pull" to get the new branch 27.0
do a "git checkout 27.0" followed by a "git branch -u origin/27.0" to update your upstream
------------------- ATTENTION END -------------------
and cherry-pick whatever needs to go on the 27.0 release 



git log v33.1.0...HEAD --pretty=format:'<li> <a href="http://gitlab.abcam.com/abcamrepo/PWS/commit/%H">view commit &bull;</a> %s</li> ' --reverse | grep "#changelog"

git push origin --delete 14.0 15.0 15.2 15.3 16.0 16.1 16.2 17.0 18.0 18.1 18.2 19.0 19.1 20.0 21.0 22.0 23.0 24.0 25.0 25.1 26.0 27.0 28.0 29.0 