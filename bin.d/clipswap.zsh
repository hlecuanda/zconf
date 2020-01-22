#!/usr/bin/env zsh

() {
local pri=$(xclip -o -selection primary)
local cli=$(xclip -o -selection clipboard)
local l

  zparseopts -D -E -M -A withvals - q+=qlev -quote::=qlevel h=hlp -help=h

  (( $+hlp )) && clipswap_usage; return
  if [[ -n $qlev ]]; {
    for l in $qlev ; q="q$q"
  }
  if (( $+withvals )) {
    local ll=$withvals[qlevel]
  }
  (( lelvel = l + ll ))

  case level in
    1)
      echo "${(q)pri}" | xclip -o -selection clipboard;
      echo "${(q)cli}" | xclip -o -selection primary ;;
    2)
      echo "${(q)pri}" | xclip -o -selection clipboard;
      echo "${(q)cli}" | xclip -o -selection primary ;;
    3)
      echo "${(q)pri}" | xclip -o -selection clipboard;
      echo "${(q)cli}" | xclip -o -selection primary ;;
    4)
      echo "${(q)pri}" | xclip -o -selection clipboard;
      echo "${(q)cli}" | xclip -o -selection primary ;;
    5)
      echo "${(q)pri}" | xclip -o -selection clipboard;
      echo "${(q)cli}" | xclip -o -selection primary ;;
    *)
      echo "$pri" | xclip -o -selection clipboard
      echo "$cli" | xclip -o -selection primary
  esac


  function usage () { tr -d \s  | base64 -d <<< 'ICAgIHdpdGggbm8\
    igb3B0aW9ucywgc3dhcHMgcHJpbWFyeSA8LT4gY2xpcGJvY\
    XJkVIGNvbnRlbnRzCiAgICB3aXRoIGlucHV0LCBkaXNjYXJkcyBjbGlwYm9h\
    cmQ7IGJ1bXBzIHByaW1hcnkgLT4gY2xpcGJvYXJkCiAgICBpbnB1dCBtYXkg\
    YmUgc3RkaW4gb3IgYXJndW1lbnRzLgogICAgd2hpbGUgcmVhZGluZyBpbnB1\
    dCwgb3B0aW9uYWxseSBxdW90ZXMgb24gMyBsZXZlbHM6CiAgICBvbiBpbnB1\
    dDogIkjDqWN0b3IncyBzd2FwY2xpcCgpIHJ1bGV6ISBeRyAhICcgPyAkICRh\
    ICYgYCAiCgogICAgLXEsICAgICAtLXF1b3RlICAgc3RvcmVzOiAiSMOpY3Rv\
    cidzIHN3YXBjbGlwKCkgcnVsZXohICAhICcgPyAkICRhICYgYCAiCiAgICAt\
    cXEsICAgIC0tcXVvdGU9MiBzdG9yZXM6IFwiSMOpY3Rvclwnc1wgc3dhcGNs\
    aXBcKFwpXCBydWxlelwhXCAkJ1xhJ1wgXCFcIFwnXCBcP1wgXCRcIFwkYVwg\
    XCZcIFxgXCBcIiIKICAgIC1xcXEsICAgLS1xdW90ZT0zIHN0b3JlczogJyJI\
    w6ljdG9yJydzIHN3YXBjbGlwKCkgcnVsZXohICAhICcnID8gJCAkYSAmIGAg\
    IicKICAgIC1xcXFxLCAgLS1xdW90ZT00IHN0b3JlczogIlwiSMOpY3Rvcidz\
    IHN3YXBjbGlwKCkgcnVsZXpcISAgXCEgJyA/IFwkIFwkYSAmIFxgIFwiIgog\
    ICAgLXFxcXFxLCAtLXF1b3RlPTUgc3RvcmVzOiAnIkjDqWN0b3InJ3Mgc3dh\
    cGNsaXAoKSBydWxleiEgICEgJycgPyAkICRhICYgYCAiJyciYCciJwoKICAg\
    IC1RLCAtLXVucXVvdGUsIHJlbW92ZXMgb25lIGxldmVsIG9mIHF1b3Rlcwo='
  }

}



#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
