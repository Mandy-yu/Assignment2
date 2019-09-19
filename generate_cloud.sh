#!/bin/bash
if [ -z "$1" ]; then echo "usage: wordcloud_cli [-h] [--text file] [--regexp regexp] [--stopwords file]
                     [--imagefile file] [--fontfile path] [--mask file]
                     [--colormask file] [--contour_width width]
                     [--contour_color color] [--relative_scaling rs]
                     [--margin width] [--width width] [--height height]
                     [--color color] [--background color] [--no_collocations]
                     [--version]

A simple command line interface for wordcloud module.

optional arguments:
  -h, --help            show this help message and exit
  --text file           specify file of words to build the word cloud
                        (default: stdin)
  --regexp regexp       override the regular expression defining what
                        constitutes a word
  --stopwords file      specify file of stopwords (containing one word per
                        line) to remove from the given text after parsing
  --imagefile file      file the completed PNG image should be written to
                        (default: stdout)
  --fontfile path       path to font file you wish to use (default:
                        DroidSansMono)
  --mask file           mask to use for the image form
  --colormask file      color mask to use for image coloring
  --contour_width width
                        if greater than 0, draw mask contour (default: 0)
  --contour_color color
                        use given color as mask contour color - accepts any
                        value from PIL.ImageColor.getcolor
  --relative_scaling rs
                        scaling of words by frequency (0 - 1)
  --margin width        spacing to leave around words
  --width width         define output image width
  --height height       define output image height
  --color color         use given color as coloring for the image - accepts
                        any value from PIL.ImageColor.getcolor
  --background color    use given color as background color for the image -
                        accepts any value from PIL.ImageColor.getcolor
  --no_collocations     do not add collocations (bigrams) to word cloud
                        (default: add unigrams and bigrams)
  --version             show program's version number and exit"    
elif [ $1=='--term' ]
then
    TERM=$2' '$3' '$4
    echo $TERM
    esearch -db pubmed -query "$TERM" | efetch -format abstract > pubmed.txt
    wordcloud_cli --text pubmed.txt --imagefile wordcloud.png
fi
