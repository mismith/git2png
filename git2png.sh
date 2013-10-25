#!/bin/bash


ORIG_BRANCH=$(git rev-parse --abbrev-ref HEAD)
TEMP_BRANCH="webkit2png-$(date +%s)-$RANDOM"
DIR="../git2png"
I=-1
X=10


git checkout -b $TEMP_BRANCH							# create a temporary branch just to make sure we don't mess anything up
echo ""

for COMMIT in $(git rev-list $TEMP_BRANCH)				# loop through commits
do
	let I=I+1											# count which commit we're at
	if [ $(($I % $X)) -ne 0 ]; then						# skip over every X commits (useful for debugging)
		continue
	fi
	
	printf "Capturing HEAD~$I.$COMMIT... "
	git reset --hard $COMMIT >/dev/null							# change git HEAD to current commit, [silence output]
	git submodule -q foreach git pull -q origin master  		# update submodules (because they fall out of sync somehow?)
	git clean -f -d												# clean up any leftover files
	webkit2png -D $DIR -o "HEAD~$I.$COMMIT" $@ >/dev/null		# take a screenshot of the current commit, [silence output]
	echo "Done."
done
echo ""

git checkout $ORIG_BRANCH								# switch back to our original branch
git branch -D $TEMP_BRANCH								# get rid of our temporary branch
