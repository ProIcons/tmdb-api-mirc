/*
**********************************************************************************************************************
** * ************************************************************************************************************ * **
** * The Movie Database mIRC GUI          * _/_/_/_/_/  _/   _/    _/_/_/   _/              _/_/_/ _/_/  _/_/ _/_/_/**
** * Written by ProIcons                  *    _/     _/_/ _/_/   _/   _/  _/             _/       _/    _/    _/ * **
** * Version: 1.1.0                       *   _/     _/ _/_/ _/  _/    _/ _/_/_/_/  _/_/ _/ _/_/  _/    _/    _/  * **
** * API Version: 3                       *  _/    _/   _/  _/  _/   _/  _/    _/       _/    _/  _/  _/     _/   * **
** * TDMb API - GUI                       * _/    _/       _/  _/_/_/   _/_/_/_/        _/_/_/    _/_/    _/_/_/  * **
** * ************************************************************************************************************ * **
** *                                                                                                              * **
** * Requirements                                                                                                 * **
** * - TMDb mIRC Wrapper API          by ProIcons   (included)                                                    * **
** * - money function                 by kirbi      (included)                                                    * **
** * - mIRC Version 6.35+                                                                                         * **
** * - TMDb API-key                                                                                               * **
** *                                                                                                              * **
** * Basic Concept:                                                                                               * **
** * - From Menu TMDb You have 5 Options.                                                                         * **
** *   1) Change Font                                                                                             * **
** *      - It changes the font of the displayed results.                                                         * **
** *                                                                                                              * **
** *   2) Search Movie.                                                                                           * **
** *      - With this option an input prompt shows up and asks for movie name. After you click ok, it searches    * **
** *        for every available movie it can find and appearing it in another input prompti with each movie's     * **
** *        title release_date and id. If you want to view any of these movies, you simply type in its id, and    * **
** *        click ok.                                                                                             * **
** *                                                                                                              * **
** *   3) Movie from IMDb Link.                                                                                   * **
** *      - Basicaly it gets the ID from the link and appearing the movie by ID.                                  * **
** *                                                                                                              * **
** *   4) Movie from TMDb Link.                                                                                   * **
** *      - Basicaly it gets the ID from the link and appearing the movie by ID.                                  * **
** *                                                                                                              * **
** *   5) Movie from ID.                                                                                          * **
** *      - Basicaly it gets the movie by ID.                                                                     * **
** *                                                                                                              * **
** * - From Menu in Movie's Details Window                                                                        * **
** *   1) Save Picture                                                                                            * **
** *      - It saves the window you are seeing as a picture.                                                      * **
** *   2) Close                                                                                                   * **
** *      - Closes the window.                                                                                    * **
** *                                                                                                              * **
** * Version                                                                                                      * **
** * - v1.1.0                                                                                                     * **
** *  * Fixed an issue, causing an infinity loop while displaying the results.                                    * **
** *  + Added Change font Property. You can now define the font of your choice for the displayed results.         * **
** * - v1.0.0-Alpha                                                                                               * **
** *  * Initial Release                                                                                           * **
** *                                                                                                              * **
** * Versioning                                                                                                   * **
** *  - For transparency and insight into release cycle, and for striving to maintain backward compatibility,     * **
** *    mIRC TMDb will be maintained under the Semantic Versioning guidelines as much as possible.                * **
** *    Releases will be numbered with the following format:                                                      * **
** *                                                                                                              * **
** *    <major>.<minor>.<patch>                                                                                   * **
** *                                                                                                              * **
** *    And constructed with the following guidelines:                                                            * **
** *    * Breaking backward compatibility bumps the major (and resets the minor and patch)                        * **
** *    * New additions without breaking backward compatibility bumps the minor (and resets the patch)            * **
** *    * Bug fixes and misc changes bumps the patch                                                              * **
** *                                                                                                              * **
** *    For more information on SemVer, please visit http://semver.org/.                                          * **
** *                                                                                                              * **
** *                                                                                                              * **
** * Bug tracker                                                                                                  * **
** *  - Have a bug or a feature request? Post comment here.                                                       * **
** *                                                                                                              * **
** **************************************************************************************************************** **
**********************************************************************************************************************
*/


on *:start:{ _tmdb_gui_init }
on *:load:{ _tmdb_gui init }
alias -l _tmdb_gui_init {
  if (!%_tmdb_gui_default_font) set %_tmdb_gui_default_font "Courier New"
  set %_tmdb_gui_version Version 1.1.0
}
alias _tmdb_api_movie {
  _tmdb_gui_init
  var %hwnd @movie_ $+ $1
  if (!$window(%hwnd)) window -apdBkow0fC +bd %hwnd 0 0 700 278
  drawfill -r %hwnd $rgb(105,105,105) $rgb(105,105,105) 0 0
  drawtext -po %hwnd 1 "Courier New" 25 50 110 Please Wait. Data are beeing loaded...
  var %json = $tmdb().method(movie/ [ $+ [ $1 ] ] [ $+ [ ).cache() ] ]
  if (!%json) { window -c %hwnd | halt }
  var %id = $json_utf8(%json,id)
  var %url = $json_utf8(%json,poster_path)
  var %poster = $tmdb().method(image/pow185/ [ $+ [ $remove(%url,/) ] ] [ $+ [ ) ] ]
  var %title = $json_utf8(%json,original_title)
  var %desc = $json_utf8(%json,overview)
  var %tagline = $json_utf8(%json,tagline)
  var %release_date = $gettok($json_utf8(%json,release_date),1,$asc(-))
  var %runtime = $json_utf8(%json,runtime)
  var %rating = $json_utf8(%json,vote_average)
  var %rusers = $json_utf8(%json,vote_count)
  var %revenue = $json_utf8(%json,revenue)
  var %budget = $json_utf8(%json,budget)
  var %i = 0
  var %genres
  while (%i < $numtok($json_utf8(%json,genres),44) ) {
    var %genres = $json_utf8(%json,genres,%i,name) $+ , $+ %genres
    inc %i
  }
  var %sc
  var %director
  var %i = 0
  while (%i < $numtok($json_utf8(%json,casts,crew),44) ) {
    var %dept = $json_utf8(%json,casts,crew,%i,department)
    var %name = $json_utf8(%json,casts,crew,%i,name)
    var %job = $json_utf8(%json,casts,crew,%i,job)
    if (%job == Director) var %director = %name
    if (%job == Story) { 
      var %sc %name $+ $chr(44) %sc
    }
    inc %i
  }
  drawfill %hwnd $rgb(105,105,105) $rgb(105,105,105) 0 0
  drawfill -nr %hwnd $rgb(105,105,105) $rgb(105,105,105) 0 0
  drawpic -nc %hwnd 0 0 %poster
  drawtext -npo %hwnd 1 %_tmdb_gui_default_font 18 190 0 %title
  drawtext -nrpo %hwnd $rgb(66,66,66) %_tmdb_gui_default_font 15 680 0 X
  drawtext -nrpo %hwnd $rgb(66,66,66) %_tmdb_gui_default_font 15 665 -5 _
  ;drawtext -nrpo %hwnd $rgb(66,66,66) %_tmdb_gui_default_font 15 685 129 >
  drawtext -nrpo %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 190 18 $iif(%tagline,$v1,-)
  drawline -rn %hwnd $rgb(133,133,133) 1 205 41 680 41
  drawline -rn %hwnd $rgb(133,133,133) 1 205 41 205 76
  drawline -rn %hwnd $rgb(133,133,133) 1 680 41 680 76
  drawline -rn %hwnd $rgb(133,133,133) 1 205 76 680 76
  drawpic -ncs %hwnd 207 45 200 28 tmdb\system\g-rating.png
  drawline -rn %hwnd $rgb(133,133,133) 1 410 41 410 76
  drawtext -porn %hwnd $rgb(194,194,194) "Calibri" 30 415 39 %release_date
  drawline -rn %hwnd $rgb(133,133,133) 1 480 41 480 76
  var %i = 1
  while (%i <= $ceil($calc($len(%genres) / 24))) {
    drawtext -npoc %hwnd 1 %_tmdb_gui_default_font 13 485 $calc(27 + (%i * 15)) 200 55 $mid(%genres,$calc((%i - 1) * 24 + 1),24)
    inc %i
  }
  drawline -nr %hwnd $rgb(133,133,133) 1 280 76 280 156
  drawline -nr %hwnd $rgb(133,133,133) 1 380 116 380 156
  drawline -nr %hwnd $rgb(133,133,133) 1 445 116 445 156
  ;Director Box
  drawline -nr %hwnd $rgb(133,133,133) 1 205 76 205 96
  drawline -nr %hwnd $rgb(133,133,133) 1 680 76 680 96
  drawline -nr %hwnd $rgb(133,133,133) 1 205 96 680 96
  drawtext -npor %hwnd $rgb(0,0,0) %_tmdb_gui_default_font 12 210 78 Director
  drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 285 78 %director
  ;Writers Box
  drawline -nr %hwnd $rgb(133,133,133) 1 205 96 205 116
  drawline -nr %hwnd $rgb(133,133,133) 1 680 96 680 116
  drawline -nr %hwnd $rgb(133,133,133) 1 205 116 680 116
  drawtext -npor %hwnd $rgb(0,0,0) %_tmdb_gui_default_font 12 210 98 Writer(s)
  drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 285 98 $iif(%sc,%sc,None)
  ;Misc Box
  drawline -nr %hwnd $rgb(133,133,133) 1 205 116 205 136
  drawline -nr %hwnd $rgb(133,133,133) 1 680 116 680 136
  drawline -nr %hwnd $rgb(133,133,133) 1 205 136 680 136
  drawtext -npor %hwnd $rgb(0,0,0) %_tmdb_gui_default_font 12 210 118 Run Time
  drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 285 118 %runtime Minutes
  drawtext -npor %hwnd $rgb(0,0,0) %_tmdb_gui_default_font 12 385 118 Rating
  drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 450 118 $round(%rating,1) ( $+ %rusers Votes)
  ;Misc2 Box
  drawline -nr %hwnd $rgb(133,133,133) 1 205 136 205 156
  drawline -nr %hwnd $rgb(133,133,133) 1 680 136 680 156
  drawline -nr %hwnd $rgb(133,133,133) 1 205 156 680 156
  drawtext -npor %hwnd $rgb(0,0,0) %_tmdb_gui_default_font 12 210 138 Budget
  drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 285 138  $+ $money(%budget)
  drawtext -npor %hwnd $rgb(0,0,0) %_tmdb_gui_default_font 12 385 138 Revenue
  drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 12 450 138  $+ $money(%revenue)
  ;Plot Box
  drawline -nr %hwnd $rgb(133,133,133) 1 205 156 205 256
  drawline -nr %hwnd $rgb(133,133,133) 1 680 156 680 256
  drawline -nr %hwnd $rgb(133,133,133) 1 205 256 680 256
  var %a = 1
  :start
  while ($left(%desc,1) == $chr(32)) { %desc = $mid(%desc,2,$len(%desc)) }
  var %new_text
  var %i = 1
  while (%desc) {
    %new_text = %new_text $gettok(%desc,%i,32)
    if ($len(%new_text) > 78) && ($len(%desc) >= 78) {
      %new_text = $deltok(%new_text,$numtok(%new_text,32),32)
      %desc = $remove(%desc,%new_text)
      drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 10 210 $calc(148 + (%a * 10)) %new_text
      %new_Text = $null
      inc %a
      goto start
    }
    elseif ($len(%new_text) <= 78) && ($len(%desc) <= 78) {
      drawtext -npr %hwnd $rgb(33,33,33) %_tmdb_gui_default_font 10 210 $calc(148 + (%a * 10)) %desc
      break
    }
    inc %i
  }
  drawdot %hwnd
}
alias money {
  if ($1 isnum) {
    if ($chr(46) isin $1) { var %dollars $gettok($1,1,46) | var %cents $remove($round($+($chr(46),$gettok($1,2,46)),2),0.) }
    else { var %dollars $1 }
    var %length $ceil($calc($len(%dollars)/3))
    if (%length > 1) {
      dec %length
      var %result $addtok(%result,$left(%dollars,$calc($len(%dollars)-$calc( [ %length ] * 3))),44) | var %stuff -3
      while (%length) {
        var %result $instok(%result,$mid(%dollars,$calc( [ %stuff ] * [ %length ] ),3),$calc($numtok(%result,44)+1),44) | dec %length
      }
    }
    else { var %result %dollars }
    if ($chr(46) isin $1) { return $+($chr(36),%result,$chr(46),%cents) }
    else { return $+($chr(36),%result) }
  }
}
alias -l movewin {
  if ($window($1)) {
    window $1 $calc($mouse.cx -$2) $calc($mouse.cy -$3)
    if ($mouse.key & 1) {
      .timer $+ $1 -o 1 0 movewin $1-
    }
  }
}
alias w_dl {
  window -c $active
}
menu * {
  TMDb
  .-
  . $style(2) TheMovieDB GUI:noop
  . $style(3) %_tmdb_gui_version $+ :noop
  .-
  .Change Font:$iif(!$dialog(_tmdb_gui_font),dialog -md _tmdb_gui_font _tmdb_gui_font,dialog -v _tmdb_gui_font)
  .-
  .Serach Movie:_tmdb_search_movie
  .Movie from ID:_tmdb_api_movie $input(Please provide the IMDb/TMDb ID of the movie you want to see.,eo,TMDb GUI) 
  .Movie from IMDb Link:_tmdb_imdb_search
  .Movie from TMDb Link:_tmdb_tmdb_search
}
alias -l _tmdb_imdb_search {
  var %input $input(Please provide the IMDb Link,eo,TMDb GUI)
  var %mlink = $gettok($remove(%input,http://,https://,www.,imdb.com,/,title),1,$asc(?))
  if (%mlink) _tmdb_api_movie %mlink
}
alias -l _tmdb_tmdb_search {
  var %input $input(Please provide the TMDb Link,eo,TMDb GUI)
  var %mlink = $gettok($remove(%input,http://,https://,www.,themoviedb.org,/,movie),1,$asc(-))
  echo -a a %mlink
  if (%mlink) _tmdb_api_movie %mlink
}
alias -l _tmdb_search_movie {
  var %input $input(Please provide the title of movie you are searching,eo,TMDb GUI)
  var %json $tmdb(%input).method(search/movie)
  var %num = $json_utf8(%json,total_results)
  var %i = 0
  var %results Movie $str($chr(9),5) Date $str($chr(9),1) ID $+ $crlf
  while (%i < %num) {
    if ($len($json_utf8(%json,results,%i,original_title)) > 38) {
      %results = %results $+ $mid($json_utf8(%json,results,%i,original_title),1,38) $iif($len($json_utf8(%json,results,%i,original_title)) >= 28,$chr(9),$iif($len($json_utf8(%json,results,%i,original_title)) >= 27,$str($chr(9),2),$iif($len($json_utf8(%json,results,%i,original_title)) > 13,$str($chr(9),3),$str($chr(9),4)))) $gettok($json_utf8(%json,results,%i,release_date),1,$asc(-)) $chr(9) $+ $json_utf8(%json,results,%i,id) $+ $crlf
      %results = %results $+ $chr(9) $+ $mid($json_utf8(%json,results,%i,original_title),39,$len($json_utf8(%json,results,%i,original_title))) $+ $crlf
    }
    else {
      %results = %results $+ $mid($json_utf8(%json,results,%i,original_title),1,38) $iif($len($json_utf8(%json,results,%i,original_title)) >= 28,$chr(9),$iif($len($json_utf8(%json,results,%i,original_title)) >= 27,$str($chr(9),2),$iif($len($json_utf8(%json,results,%i,original_title)) > 13,$str($chr(9),3),$str($chr(9),4)))) $gettok($json_utf8(%json,results,%i,release_date),1,$asc(-)) $chr(9) $+ $json_utf8(%json,results,%i,id) $+ $crlf

    }
    inc %i
  }
  _tmdb_api_movie $$input(Please type the id of the movie you want: $crlf $+ %results,eo,TMDb GUI)
}
menu * {
  mouse: {
    if (*movie* iswm $active) && (*casts* !iswm $active) {
      if ($inrect($mouse.x,$mouse.y,680,0,$width(X,%_tmdb_gui_default_font,15),$height(X,%_tmdb_gui_default_font,15))) {
        set %_tmdb_gui_x_inside 1
        drawrect -rf $active $rgb(105,105,105) 1 680 0 $width(X,%_tmdb_gui_default_font,15) $height(X,%_tmdb_gui_default_font,15)
        drawtext -rpo $active $rgb(33,33,33) %_tmdb_gui_default_font 15 680 0 X
      }
      elseif (%_tmdb_gui_x_inside == 1) {
        set %_tmdb_gui_x_inside 0 
        drawrect -rf $active $rgb(105,105,105) 1 680 0 $width(X,%_tmdb_gui_default_font,16) $height(X,%_tmdb_gui_default_font,15)
        drawtext -rpo $active $rgb(66,66,66) %_tmdb_gui_default_font 15 680 0 X
      }
      if ($inrect($mouse.x,$mouse.y,665,-5,$width(_,%_tmdb_gui_default_font,15),$height(_,%_tmdb_gui_default_font,15))) {
        set %_tmdb_gui_-_inside 1
        drawrect -rf $active $rgb(105,105,105) 1 665 -5 $width(_,%_tmdb_gui_default_font,15) $height(_,%_tmdb_gui_default_font,15)
        drawtext -rpo $active $rgb(33,33,33) %_tmdb_gui_default_font 15 665 -5 _
      }
      elseif (%_tmdb_gui_-_inside == 1) {
        set %_tmdb_gui_-_inside 0 
        drawrect -rf $active $rgb(105,105,105) 1 665 -5 $width(_,%_tmdb_gui_default_font,16) $height(_,%_tmdb_gui_default_font,15)
        drawtext -rpo $active $rgb(66,66,66) %_tmdb_gui_default_font 15 665 -5 _
      }
      if ($inrect($mouse.x,$mouse.y,207,45,200,28)) {
        set %_tmdb_gui_mpaa_inside 1 
        drawtext -r $active $rgb(0,0,0) %_tmdb_gui_default_font 10 210 260 MPAA: http://www.mpaa.org/ratings/what-each-rating-means
      }
      elseif (%_tmdb_gui_mpaa_inside == 1) {
        set %_tmdb_gui_mpaa_inside 0
        drawrect -rf $active $rgb(105,105,105) 1 210 260 $width(MPAA: http://www.mpaa.org/ratings/what-each-rating-means,%_tmdb_gui_default_font,15) $height(MPAA: http://www.mpaa.org/ratings/what-each-rating-means,%_tmdb_gui_default_font,10)
      }
    }
  }
  sclick:{
    if (*movie* iswm $active) && (*casts* !iswm $active) {
      if ($inrect($mouse.x,$mouse.y,207,45,200,28)) {
        if ($?!="You are about to open webpage: http://www.mpaa.org/ratings/what-each-rating-means. Are you sure you want to continnue?") {
          run http://www.mpaa.org/ratings/what-each-rating-means
        }
      }
      if ($inrect($mouse.x,$mouse.y,665,-5,$width(_,%_tmdb_gui_default_font,15),$height(_,%_tmdb_gui_default_font,15))) {
        var %win = $active
        window -n %win
      }
      if ($inrect($mouse.x,$mouse.y,680,0,$width(X,%_tmdb_gui_default_font,15),$height(X,%_tmdb_gui_default_font,15))) {
        var %win = $active
        window -c %win
        window -c %win $+ .casts
        window -c @buffer $+ $remove(%win,@) $+ .casts
        halt
      }
      movewin $active $calc($mouse.cx -$window($active).x) $calc($mouse.cy -$window($active).y) 
    }
  }
  $iif($window($active).type == picture && *casts* !iswm $active,Close) :  var %win = $active | window -c %win | window -c %win $+ .casts | window -c @buffer $+ $remove(%win,@) $+ .casts
  $iif(*movie* iswm $active && *casts* !iswm $active,-)
  $iif(*movie* iswm $active && *casts* !iswm $active,Save Picture) : picsave $active 
}
alias picsave {
  window -hp +bd @tosave 0 0 700 278
  drawcopy $1 0 0 $window($1).w $window($1).h @tosave 0 0
  drawtext -npor @tosave $rgb(0,0,0) %_tmdb_gui_default_font 12 200 260 TheMovieDB.org API Wrapper & GUI by ProIcons. Contact: info@devian.gr
  drawrect -rf @tosave $rgb(105,105,105) 1 680 0 $width(X,%_tmdb_gui_default_font,15) $height(X,%_tmdb_gui_default_font,15)
  drawrect -rf @tosave $rgb(105,105,105) 1 665 0 $width(_,%_tmdb_gui_default_font,15) $height(_,%_tmdb_gui_default_font,15)
  var %file = $sfile($+($iif(%_tmdb_gui_last_save_path,$v1,C:\),*.bmp))
  if ($exists(%file)) {
    if ($input(Are you sure you want to overwrite this file?,yw,Replace Warning!)) {
      .remove %file
      drawsave -q100 @tosave %file
    }
  }
  else {
    drawsave -q100 @tosave $iif($numtok(%file,46) == 1,%file $+ .bmp,%file)
  }
  set %_tmdb_gui_last_save_path $nofile(%file)
  window -c @tosave
}
alias get_font_list {
  if ($isid) {
    var %c = fontlist
    if (!$com(%c)) {
      .comopen %c MSScriptControl.ScriptControl
      noop $com(%c,language,4,bstr*,VBScript)
      var %code Function get_font_list() $crlf Set objFSO=CreateObject("Scripting.FileSystemObject") $crlf outFile=" $+ $mircdir $+ \stdout.a" $crlf Set objFile = objFSO.CreateTextFile(outFile,True) $crlf Const HKEY_LOCAL_MACHINE = &H80000002 $crlf strComputer = "." $crlf strRes = "" $crlf Set objReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _ $crlf strComputer & "\root\default:StdRegProv") $crlf strKeyPath = "Software\Microsoft\Windows NT\CurrentVersion\Fonts" $crlf objReg.EnumValues HKEY_LOCAL_MACHINE, _ $crlf strKeyPath,arrEntryNames $crlf For Each strValue in arrEntryNames $crlf objFile.Write strValue & vbCrLf $crlf Next $crlf get_font_list=" $+ $mircdir $+ \stdout.a" $crlf objFile.Close $crlf End Function
      noop $com(%c,addcode,1,bstr*,%code)
      var %t $+(get_font_list,$chr(40),$chr(41))
      .timer 1 1 comclose %c
      if ($com(%c,eval,1,bstr*,%t)) return $com(%c).result

    }
  }
}
dialog _tmdb_gui_font {
  title "mIRC TMDb GUI"
  size -1 -1 158 10
  option dbu
  combo 1, 0 0 122 96, size drop
  button "Save", 2, 121 0 37 10
}
on *:dialog:_tmdb_gui_font:init:0:{
  .timer 1 0 font_init
}
alias font_init {
  var %fontlist = $get_font_list
  var %i = 1
  while (%i <= $lines(%fontlist) ) {
    var %font = $gettok($read(%fontlist,%i),1,40)
    while ($left(%font,1) == $chr(32)) { %font = $mid(%font,2,$len(%font)) }
    while ($right(%font,1) == $chr(32)) { %font = $mid(%font,1,$calc($len(%font) - 1))) }
    did $iif(%i == 1,-ra,-a) _tmdb_gui_font 1 %font
    if (%font == %_tmdb_gui_default_font) { 
      did -c _tmdb_gui_font 1 %i 
    }
    inc %i
  }
  .remove %fontlist
}
on *:dialog:_tmdb_gui_font:sclick:2:{ set %_tmdb_gui_default_font $qt($did($dname,1)) }
