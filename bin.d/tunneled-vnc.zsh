#!/usr/bin/env zsh

function bg-ssh () { 
  ssh -N ${1} & 
}

function bg-vnc () { 
  xvncviewer localhost:6901  &
}

bg-ssh ${argv[1]} && bg-vnc

jobs
