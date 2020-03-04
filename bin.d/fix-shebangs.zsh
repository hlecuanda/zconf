#!/usr/bin/env zsh
#:
#   __ _               _          _
#  / _(_)_  __     ___| |__   ___| |__   __ _ _ __   __ _ ___
# | |_| \ \/ /____/ __| '_ \ / _ \ '_ \ / _` | '_ \ / _` / __|
# |  _| |>  <_____\__ \ | | |  __/ |_) | (_| | | | | (_| \__ \
# |_| |_/_/\_\    |___/_| |_|\___|_.__/ \__,_|_| |_|\__, |___/
#                                                   |___/
# h@h-lo.me 20200303 202945 -0800 PST 1583296185 d(-_- )b...
# prepends the correct shebang for each script type
#:
check-shebangs \
  | grep -v env \
  | cut -f1 -d : \
  | cut -f2 -d \. \
  | sort \
  | uniq \
  | awk '/^\w/ {printf "%s\n", $1 }' \
  | grep -vEe 'log|Makefile|md|pgp' \
  | while read xt
  do
    echo "processing $xt ....................."
    ls *.$xt \
      | while read f
        do
          echo $f...
          safeguard="$(cat $f)"
          cp -v $f $f-
          echo "#!/usr/bin/env $xt" > $f
          len=$(wc -l $f | cut -f1 -d' ')
          tail -$(( len -1 )) >> $f
          diff -c --color  $f- $f
          echo "ok to proceed? "
          read -q proceed
          { case proceed in
              y)
                /bin/rm -rfv $f-
                ;;
              *)
                $echo recovering $f
                rm -rfv $f
                /bin/mv -v $f- $f
                ;;
            esac
          } always {
            if (( TRY_BLOCK_ERROR == 1 )) {
              echo recovering $f ...
              echo $f >>! erred.log
              echo $safeguard >! $f
              /bin/rm -fv $f-
              TRY_BLOCK_ERROR=0
            }
          }
        done
    echo "done with type $xt"
  done
echo all done


#  d(-_-;)bm  hlo.mx 1583302772
#  vim:  et :
