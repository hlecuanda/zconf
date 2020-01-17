# googler @t alias list
# Author:Hector Lecuanda
# email: h@hlo.mx
# twitter @hlecuanda
# Based on work by
# Author: Arun Prakash Jana
# email: engineerarun@gmail.com
#
# To request key addition or removal upstream, please drop an email.
if [[ $commands[googler] ]] {

  function googler () {
    # setopt localoptions xtrace sourcetrace
    local opts uh handleropt=""
    local -a opts=( -w )
    handlers=( c chrome f firefox w w3m )
    if [[ -n $DISPLAY ]] {
      zmodload zsh/zutil        || { <<< 'Requires zparseopts'; false; return }
      [ -z $commands[googler] ] && { <<< 'Requires googler'   ; false; return }
      zparseopts -D -E -M -K -a opts -- \
        c     -chrome=c                 \
        f     -firefox=f                \
        w     -w3m=w
      #
      for opt in $opts
        case $opt in
          -c)
            (( $+commands[google-chrome] )) \
              && uh="google-chrome" \
              || uh="chromium"
            break ;;
          -f)
            uh="firefox" ;;
          -w)
            uh="w3m"
            break ;;
          *)
            invalid option "$opt"
            return 2
        esac
      #
      handleropt="--url-handler $uh"
      # print "opts: $handleropt"
      =googler -n4 ${(z)handleropt} $*
    }
  }

  autoload googler;

# zstyle :googler:*:*:searchtype:site {stub,descr}
  function sitesearch () {
    setopt localoptions xtrace sourcetrace ;
    local -AU siteurls sitedscr sitesrch ;
    sitedb \
      | awk -F : '{ $1 $2 $3 $4 }' \
      | while read stub url desc styp
        do
          siteurls+=( $stub $url ) ;
          sitedscr+=( $stub $desc ) ;
          sitesrch+=( $stub $styp ) ;
        done
  };

  function sitedb () {
    setopt localoptions xtrace sourcetrace ;
    <<< ' @a              : amazon.com                                : Amazon.com                                         :   :
  @alt            : alternativeto.net                         : AlternativeTo                                      :   :
  @android        : developer.android.com                     : Android Developers                                 :   :
  @arm            : infocenter.arm.com                        : ARM Information Center                             :   :
  @asciinema      : asciinema.org                             : asciinema                                          :   :
  @askubuntu      : askubuntu.com                             : Ask Ubuntu                                         :   :
  @aur            : aur.archlinux.org                         : Arch User Repository                               :   :
  @aw             : wiki.archlinux.org                        : Arch Wiki                                          :   :
  @azl            : azlyrics.com                              : AZLyrics                                           :   :
  @bbc            : bbc.co.uk                                 : BBC                                                :   :
  @britannica     : britannica.com                            : Encyclopaedia Britannica                           :   :
  @cb             : crunchbase.com                            : crunchbase                                         :   :
  @chrome         : chrome.google.com                         : Chrome Extensions                                  :   :
  @cl             : craigslist.org                            : craigslist                                         :   :
  @cmd            : commandlinefu.com                         : commandlinefu                                      :   :
  @cnn            : cnn.com                                   : CNN                                                :   :
  @comedy         : cc.com                                    : Comedy Central                                     :   :
  @cpp            : en.cppreference.com                       : CPP Reference                                      :   :
  @cracked        : cracked.com                               : Cracked.com                                        :   :
  @cricinfo       : espncricinfo.com                          : Cricinfo                                           :   :
  @d              : thefreedictionary.com                     : The Free Dictionary                                :   :
  @di             : dictionary.com                            : Dictionary.com                                     :   :
  @distrowatch    : distrowatch.com                           : DistroWatch                                        :   :
  @dpkg           : packages.debian.org                       : Debian Package Search                              :   :
  @e              : ebay.com                                  : eBay                                               :   :
  @eg             : epguides.com                              : Episode Guides                                     :   :
  @embedded       : embedded.com                              : Embedded                                           :   :
  @espn           : espn.com                                  : ESPN                                               :   :
  @etsy           : etsy.com                                  : Etsy                                               :   :
  @etym           : etymonline.com                            : Online Etymology Dictionary                        :   :
  @fb             : facebook.com                              : Facebook                                           :   :
  @fd             : fandango.com                              : Fandango Movie Reviews                             :   :
  @firefox        : addons.mozilla.org                        : Firefox Add-ons                                    :   :
  @fk             : flipkart.com                              : Flipkart                                           :   :
  @forbes         : forbes.com                                : Forbes                                             :   :
  @forvo          : forvo.com                                 : Forvo                                              :   :
  @ft             : markets.ft.com                            : Financial Times                                    :   :
  @g              :                                           : Google Search                                      :   :
  @genius         : genius.com                                : Genius Lyrics                                      :   :
  @gh             : github.com                                : GitHub                                             :   :
  @gnu            : gnu.org                                   : GNU                                                :   :
  @goal           : goal.com                                  : Goal                                               :   :
  @goear          : goear.com                                 : Goear Music                                        :   :
  @gpg            : gnupg.org                                 : The GNU Privacy Guard                              :   :
  @gutenberg      : gutenberg.org                             : Project Gutenberg                                  :   :
  @had            : hackaday.com                              : Hackaday                                           :   :
  @history        : history.com                               : History                                            :   :
  @hn             : news.ycombinator.com                      : Hacker News                                        :   :
  @hsw            : howstuffworks.com                         : HowStuffWorks                                      :   :
  @htf            : howtoforge.com                            : HowtoForge                                         :   :
  @hulu           : hulu.com                                  : Hulu                                               :   :
  @ieee           : ieee.org                                  : IEEE                                               :   :
  @ietf           : ietf.org                                  : IETF                                               :   :
  @ietfd          : datatracker.ietf.org                      : IETF Datatracker                                   :   :
  @ig             : instagram.com                             : Instagram                                          :   :
  @imdb           : imdb.com                                  : IMDB                                               :   :
  @iradio         : internet-radio.com                        : Internet Radio                                     :   :
  @kernel         : kernel.org                                : The Linux Kernel Archives                          :   :
  @khan           : khanacademy.org                           : Khan Academy                                       :   :
  @lfm            : last.fm                                   : Last.fm                                            :   :
  @li             : linkedin.com                              : LinkedIn                                           :   :
  @linux          : linux.com                                 : Linux.com                                          :   :
  @lj             : linuxjournal.com                          : Linux Journal                                      :   :
  @lq             : linuxquestions.org                        : LinuxQuestions                                     :   :
  @lqw            : wiki.linuxquestions.org                   : LQWiki                                             :   :
  @lwn            : lwn.net                                   : LWN.net                                            :   :
  @lxr            : lxr.free-electrons.com                    : Linux Cross Reference                              :   :
  @man            : manpages.ubuntu.com                       : Ubuntu Manpage                                     :   :
  @man7           : man7.org                                  : Linux manual page                                  :   :
  @mangar         : mangareader.net                           : Manga Reader                                       :   :
  @mlb            : mlb.mlb.com                               : MLB                                                :   :
  @mr             : macrumors.com                             : Mac Rumors                                         :   :
  @n              :                                           : Google News                                        :   :
  @nature         : nature.com                                : Nature Research                                    :   :
  @nba            : nba.com                                   : NBA                                                : N :
  @ng             : nationalgeographic.com                    : National Geographic                                : N :
  @nptel          : nptel.ac.in                               : National Programme on Technology Enhanced Learning : N :
  @ocw            : ocw.mit.edu                               : MIT OpenCourseWare                                 : N :
  @oembedded      : openembedded.org                          : Open Embedded                                      :   :
  @omg            : omgubuntu.co.uk                           : OMG! Ubuntu!                                       :   :
  @op             : opensubtitles.org                         : OpenSubtitles                                      :   :
  @opensource     : opensource.com                            : Opensource.com                                     :   :
  @osalt          : osalt.com                                 : Open Source Alternative                            :   :
  @osdev          : wiki.osdev.org                            : OSDev Wiki                                         :   :
  @owrt           : openwrt.org                               : OpenWrt                                            :   :
  @ox             : en.oxforddictionaries.com                 : Oxford Dictionary                                  :   :
  @patent         : patents.google.com                        : Google Patents                                     :   :
  @tpb            : thepiratebay.org                          : The Pirate Bay                                     :   :
  @play           : play.google.com                           : Android Apps                                       :   :
  @playonlinux    : playonlinux.com                           : PlayOnLinux                                        :   :
  @python         : docs.python.org                           : Python documentation                               :   :
  @q              : quora.com                                 : Quora                                              :   :
  @quotes         : en.wikiquote.org                          : Wikiquote                                          :   :
  @r              : reddit.com                                : Reddit                                             :   :
  @rd             : rd.com                                    : Readers Digest                                     :   :
  @rfc            : rfc-editor.org                            : RFC Reader                                         :   :
  @rpm            : rpmfind.net                               : Rpmfind                                            :   :
  @rt             : rottentomatoes.com                        : Rotten Tomatoes                                    :   :
  @slang          : onlineslangdictionary.com                 : OnlineSlangDictionary                              :   :
  @so             : stackoverflow.com                         : Stack Overflow                                     :   :
  @softpedia      : softpedia.com                             : Softpedia                                          :   :
  @sourceforge    : sourceforge.net                           : SurceForge                                         :   :
  @ss             : subscene.com                              : Subscene                                           :   :
  @st             : store.steampowered.com                    : Steam                                              :   :
  @t              : thesaurus.com                             : Thesaurus.com                                      :   :
  @ted            : ted.com                                   : TED Talks                                          :   :
  @tldp           : tldp.org                                  : The Linux Documentation Project                    :   :
  @tldrlegal      : tldrlegal.com                             : tl:drLegal                                         :   :
  @to             : torrentz2.eu                              : Torrentz2                                          :   :
  @tpb            : thepiratebay.org                          : The Pirate Bay                                     :   :
  @tunein         : tunein.com                                : TuneIn                                             :   :
  @tw             : twitter.com                               : Twitter                                            :   :
  @twitch         : twitch.tv                                 : Twitch                                             :   :
  @ubuntuforums   : ubuntuforums.org                          : Ubuntu Forums                                      :   :
  @ubuntupackages : packages.ubuntu.com                       : Ubuntu Packages                                    :   :
  @uwiki          : wiki.ubuntu.com                           : Ubuntu Wiki                                        :   :
  @vim            : vim.org                                   : Vim Wiki                                           :   :
  @w              : en.wikipedia.org                          : Wikipedia                                          :   :
  @walmart        : walmart.com                               : Walmart                                            :   :
  @weather        : weather.com                               : Weather.com                                        :   :
  @wikia          : wikia.com                                 : Wikia                                              :   :
  @xkcd           : xkcd.com                                  : XKCD                                               :   :
  @y              : yahoo.com                                 : Yahoo                                              :   :
  @yf             : finance.yahoo.com                         : Yahoo Finance                                      :   :
  @yt             : youtube.com                               : YouTube                                            :   :
  @zdnet          : zdnet.com                                 : ZDNet                                              :   :
  '
  }


}
  #  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
