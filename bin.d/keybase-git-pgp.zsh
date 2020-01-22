#!/usr/bin/env zsh
#  _              _                                _ _
# | | _____ _   _| |__   __ _ ___  ___        __ _(_) |_      _ __   __ _ _ __
# | |/ / _ \ | | | '_ \ / _` / __|/ _ \_____ / _` | | __|____| '_ \ / _` | '_ \
# |   <  __/ |_| | |_) | (_| \__ \  __/_____| (_| | | ||_____| |_) | (_| | |_) |
# |_|\_\___|\__, |_.__/ \__,_|___/\___|      \__, |_|\__|    | .__/ \__, | .__/
#           |___/                            |___/           |_|    |___/|_|
# h@h-lo.me 20191005 190116 -0700 PDT 1570327276 d(-_- )b...

usage=$(cat - <<- EOD
${0:t}

   this is an adapter program that enables using keybase instead of
   pgp when signing commits. it just homologates the expected inputs
   and outputs from git. it should be enabled thusly:

      # git config --global gpg.program "${0:a}"

   you can do this by running

      # ${0:t} -c

usage:

      # ${0:t} [options]

options:
      -c : configure git to use this adapter

   When installed the adapter will behave identically to
   gpg --verify $file - <$signature  # when verifying
   gpg -bsau $key < cat -            # when signing

see also:

   # man git config gpg.program
EOD
)

typeset -A opts
zparseopts -A opts b s a u: -verify:

[[ "${(k)opts}" =~ '--verify' ]] \
    && { keybase pgp verify -i ${opts[--verify]} -d $(<&0) || : } \
    || { keybase pgp sign -t -d -i $(<&0) }


