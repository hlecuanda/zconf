#!/usr/bin/env zsh
# ### Intro:
# ranger supports enhanced previews.  If the option "use_preview_script"
# is set to True and this file exists, this script will be called and its
# output is displayed in ranger.  ANSI color codes are supported.

# NOTES: This script is considered a configuration file.  If you upgrade
# ranger, it will be left untouched. (You must update it yourself.)
# Also, ranger disables STDIN here, so interactive scripts won't work properly

# Meanings of exit codes:

# code | meaning    | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | succesqs. display stdout as preview
# 1    | no preview | failure. dqqisplay no preview
# 2    | plain text | display the plain content of the file
# 3    | fix width  | success. Don't reload when width changes
# 4    | fix height | success. Don't reload when height changes
# 5    | fix both   | success. Don't ever reload
# 6    | image      | success. display the image $cached points to as an image preview
# #..
# Meaningful aliases for arguments: # ###2
setopt localoptions shwordsplit
local thumbs="$HOME/.cache/thumbnails/"

[[ -n $1 ]] && pth="${argv[1]:a}" || { <<< "Not enough arguments" ; exit 1 }  # Full pth of the selected file
[[ -n $2 ]] && width="$argv[2]"   || width="$COLUMNS" # Width of the preview pane (number of fitting characters)
[[ -n $3 ]] && height="$argv[3]"  || height="$LINES"   # Height of the preview pane (number of fitting characters)
[[ -n $4 ]] && cached="$argv[4]"  || cached="$thumbs" # Path that should be used to cache image previews

local maxln=200  # Stop after $maxln lines.  Can be used like ls | head -n $maxln
# #..
# Probe file's mimetype # ###
local mimetype=$( =file --mime-type -pLb "${pth}" )

# #..
# Functions: # ###
# runs a command and saves its output into $output.  Useful if you need
# the exit value AND want to use the output in a pipe
# function try () { output=$(eval '"$@"'); }
function try () { [[ -s ${1:c} ]] && output=$( "$@" ) } || exit 1
function dump () { <<< "$output"; }
function fixy () { head -n "$maxln" | fmt -s -w $COLUMNS }
function fixx () { cut -c1-$LINES }
function dumpfix () { dump | fixx | fixy  && exit 0  }
function highlight () { =highlight "$@"; test $? = 0 -o $? = 141; }
function prettyjson () {  =jq -C '.' < $(<&0) }
function coalesce () {
  < $(<&0) | while read line
           do
             echo ${(z)line} \
               | while read ftyp ; do ftypes="$ftyp $ftypes" done
           done
           echo $ftypes
}

function get_highlightable ()  {
    bat --list-languages \
      | cut -c38- \
      | tr -d , \
      | coalesce
  }
#..
function highlight () {
    && bat ${1} --color=always --language ${1:t:e} || exit 1
}



case "${${pth:e}:l}" in # ###
  7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
    try als          "$pth" && { dumpfix }
    try acat         "$pth" && { dumpfix }
    try bsdtar -lf   "$pth" && { dumpfix }
    exit  1 ;;
  rar)
    try unrar -p- lt "$pth" && { dumpfix } || exit 1;;
  json)
    try jq -C '.'    "$pth" && { dumpfix } || exit 1;;
  pdf)
    try pdftotext  -l 10  -nopgbrk -q "$pth" && { dumpfix } || exit 1;;
  torrent)
    try transmission-show "$pth" && { dumpfix } || exit 1;;
  htm|html|xhtml)
    try w3m    -dump "$pth" && { dumpfix }
    try lynx         "$pth" && { dumpfix }
    try elinks       "$pth" && { dumpfix }
    exit 1;;
  *)
    try highlight "$pth" && { dumpfix }
    # fall back to highlight/cat if the text browsers fail
esac
#..

case "$mimetype" in # ###
  inode/directory)
    try tree -C "$pth" && { dumpfix  } || exit 1 ;;
  text/* | */xml)
    try bat "$pth"     && { dumpfix  } ;
    # try highlight  --out-format=ansi "$pth" && { dumpfix  } || exit 1 ;;
    exit 1 ;;
  image/*) # ###
    local exifargs=' -c "%.8d" -d "%Y%m%d %H%D%S ($s)" -g -s -ColorSpace \
    -CreateDate  -DateTimeOriginal -ExifImageHeight -ExifImageWidth      \
    -ExifVersion  -ExposureMode -ExposureTime -FNumber -FileAccessDate   \
    -FileModifyDate  -FileInodeChangeDate -FileSize -Flash -FocalLength  \
    -GPSAltitude -ISO  -GPSDateTime -GPSImgDirection -GPSPosition -Make  \
    -Model -ModifyDate  -Orientation -ResolutionUnit -SensingMethod      \
    -Software -SubjectArea  -WhiteBalance ';
    try exiftool -@ =(<<< $exifargs) "$pth" && { dumpfix  }  || exit 1 ;; # #..
 audio/* | video/*) # ###
    # try exiftool -a -g1:all -s "$pth" && exit 5 ;
    # try ffmpegthumbnailer -i "$pth" -o "$cached" -s 0 && exit 6 || exit 1;
    try mediainfo "$pth" && { dumpfix | sed 's/  \+:/: /;';  exit 5; } || exit 1;; # ..
esac
# #..1
exit 0

# ###5 Changelog
# h@h-lo.me 20200113 101328 -0800 PST 1578939208 d(-_- )b...
# added this changelog
#  vim: set ft=zsh sw=2 tw=0 fdm=marker fmr=###,#.. et :
