git2png
=======

Iterate through a website repo's commits taking screenshots along the way.

## Usage

    $ brew install webkit2png                   # install dependency
    $ cd /path/to/git/repo                      # change working directory
    $ curl https://raw.github.com/mismith/git2png/master/git2png.sh -o ../git2png.sh    # install git2png shell script
    $ sh ../git2png.sh [webkit2png options]     # execute it

**NB:** More info on webkit2png can be found here: https://github.com/paulhammond/webkit2png

The website you are working with should be served on a local server that gets updated with each branch change in git.
