

#  The next line updates PATH for the Google Cloud SDK.
# it ahiukd bebsourced by zprofile for non interactive 
# scripts sill pick up rhw path
# if [ -f /home/hector/google-cloud-sdk/path.zsh.inc ]; then
#   source '/home/hector/google-cloud-sdk/path.zsh.inc'
# fi

# command completion shoukd be handled with the prezto source.d 
# mechabism
# The next line enables shell command completion for gcloud.
if [ -f /home/hector/google-cloud-sdk/completion.zsh.inc ]; then
  source '/home/hector/google-cloud-sdk/completion.zsh.inc'
fi
