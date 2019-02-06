

#  The next line updates PATH for the Google Cloud SDK.
# it should be sourced by zprofile for non interactive
# scripts
# if [ -f ${GCPSDK}/path.zsh.inc ]; then
#   source ${GCPSDK}/path.zsh.inc
# fi

# The next line enables shell command completion for gcloud.
[[ -f ${GCPSDK}/completion.zsh.inc ]] && \
  source "${GCPSDK}completion.zsh.inc"
