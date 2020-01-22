#!/usr/bin/env zsh

typeset -a PIXDIRS
typeset -i MAX_W=1280
typeset -i MAX_H=720

OUTPUT="${HOME}/Pictures/bkgr"
ERRFILE="${OUTPUT:h}/.fehrrors"
LOG="logger -p user.info -t HLO"

MINDIMS="200x200"
FEH="$(which feh)"
FEH_OPTS="--min-dimension $MINDIMS --magick-timeout 3 --loadable --recursive"
PICK_CMD="pick-file"
PIXFILE="${OUTPUT:h}/.allpix"
PIXDIRS=(Archive/Pictures Archive/Downloads Archive/Desktop Archive/Documents Archive/Videos Archive/.local/share/TelegramDesktop Archive/.local/share/Trash )
SET_BG_CMD="${FEH:c} --image-bg black --bg-max"
PIXFILE_CREATE_CMD="${FEH:c} ${(z)FEH_OPTS}"

[[ -s "${PIXFILE:P}" ]] && {

    SELECTEDPIC="$(${PICK_CMD:c})"
    ${(z)SET_BG_CMD} "${SELECTEDPIC:P}"
#    [[ -v DISPLAY ]] && ${(z)SET_BG_CMD} "${SELECTEDPIC:P}" || { (( $(date +%m)  > 55 )) && logger -p warning "no xdisplay!" }

 } || for PIXDIR in $PIXDIRS ; do
 ${(z)PIXFILE_CREATE_CMD} ${PIXDIR:P} <& - >>! "${PIXFILE:P}" 2&>! ${ERRFILE:P} &!
    done

#  vim: set ft=zsh sw=4 tw=0 fdm=manual et :
