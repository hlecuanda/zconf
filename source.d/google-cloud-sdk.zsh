

# The next line updates PATH for the Google Cloud SDK.
sdkpath='/usr/local/google-cloud-sdk' 
snappath='/snap/bin/google-cloud-sdk/path.zsh.inc'

if [ -d $sdkpath ]; then
  source $sdkpath/path.zsh.inc
  source $sdkpath/completion.zsh.inc
elif [ -d $snappath ]; then
  source $snappath/path.zsh.inc
  source $snappath/completion.zsh.inc
fi
