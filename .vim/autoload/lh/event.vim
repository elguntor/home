"=============================================================================
" $Id: event.vim 520 2012-03-19 18:09:15Z luc.hermitte $
" File:		autoload/lh/event.vim                               {{{1
" Author:	Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
"		<URL:http://code.google.com/p/lh-vim/>
" License:      GPLv3 with exceptions
"               <URL:http://code.google.com/p/lh-vim/wiki/License>
" Version:	3.0.0
" Created:	15th Feb 2008
" Last Update:	$Date: 2012-03-19 19:09:15 +0100 (Mon, 19 Mar 2012) $
"------------------------------------------------------------------------
" Description:	
" 	Function to help manage vim |autocommand-events|
" 
"------------------------------------------------------------------------
" Installation:
" 	Drop it into {rtp}/autoload/lh/
" 	Vim 7+ required.
" History:
" 	v2.0.6: Creation
"       v3.0.0: GPLv3
" TODO:		
" }}}1
"=============================================================================

let s:cpo_save=&cpo
set cpo&vim

"------------------------------------------------------------------------
" ## Functions {{{1
" # Debug {{{2
function! lh#event#verbose(level)
  let s:verbose = a:level
endfunction

function! s:Verbose(expr)
  if exists('s:verbose') && s:verbose
    echomsg a:expr
  endif
endfunction

function! lh#event#debug(expr)
  return eval(a:expr)
endfunction

"------------------------------------------------------------------------
" # Event Registration {{{2
function! s:RegisteredOnce(cmd, group)
  " We can't delete the current augroup autocommand => increment a counter
  if !exists('s:'.a:group) || s:{a:group} == 0 
    let s:{a:group} = 1
    exe a:cmd
  endif
endfunction

function! lh#event#register_for_one_execution_at(event, cmd, group)
  let group = a:group.'_once'
  let s:{group} = 0
  exe 'augroup '.group
  au!
  exe 'au '.a:event.' '.expand('%:p').' call s:RegisteredOnce('.string(a:cmd).','.string(group).')'
  augroup END
endfunction
function! lh#event#RegisterForOneExecutionAt(event, cmd, group)
  return lh#event#register_for_one_execution_at(a:event, a:cmd, a:group)
endfunction
"------------------------------------------------------------------------
let &cpo=s:cpo_save
"=============================================================================
" vim600: set fdm=marker:
