;----------------------------------------
; key input accelerator on home-position.
;
;-----
;
; (*) means hotkey is assigned.
;  *  means hotkey is NOT assigned.
;
; [case 1 - –³•ÏŠ·(vk1Dsc07B)]
;	(1)(2)(3)(4)(5)(6)(7)(8)(9)(0)
;	(q)(w)(e)(r) t  y (u)(i)(o)(p) 
;	(a)(s) d  f  g (h)(j)(k)(l)(;)(:)
;	 z  x (c) v (b)(n)(m)(,)(.) /
;
;----------------------------------------
sc07B & h::decorateModifier("Left")
sc07B & j::decorateModifier("Down")
sc07B & k::decorateModifier("Up")
sc07B & l::decorateModifier("Right")
sc07B & u::decorateModifier("BS")
sc07B & i::decorateModifier("Del")
sc07B & m::decorateModifier("Enter")
sc07B & n::decorateModifier("PgDn")
sc07B & p::decorateModifier("PgUp")
sc07B & sc028::decorateModifier("sc029") ; vkBAsc028=:, vkF3sc029=”¼Šp/‘SŠp
sc07B & ,::decorateModifier("Home")
sc07B & .::decorateModifier("End")
sc07B & o::decorateModifier("Tab")
sc07B & `;::decorateModifier("Esc")
sc07B & w::moveToNextWord()
sc07B & b::moveToPreviousWord()
sc07B & e::selectCurrentLine()
sc07B & r::deleteCurrentLine()
sc07B & q::closeActiveWindow()
sc07B & 1::decorateModifier("F1")
sc07B & 2::decorateModifier("F2")
sc07B & 3::decorateModifier("F3")
sc07B & 4::decorateModifier("F4")
sc07B & 5::decorateModifier("F5")
sc07B & 6::decorateModifier("F6")
sc07B & 7::decorateModifier("F7")
sc07B & 8::decorateModifier("F8")
sc07B & 9::decorateModifier("F9")
sc07B & 0::decorateModifier("F10")
;----------------------------------------
sc07B & c::Return	; second modifier.see:isVirtualCtrlDown().
sc07B & s::Return	; second modifier.see:isVirtualShiftlDown().
sc07B & a::Return	; second modifier.see:isVirtualAltDown().
;----------------------------------------
isVirtualCtrlDown()
{
	Return GetKeyState("c", "P")
}
;----------------------------------------
isVirtualShiftDown()
{
	Return GetKeyState("s", "P")
}
;----------------------------------------
isVirtualAltDown()
{
	Return GetKeyState("a", "P")
}
;----------------------------------------
decorateModifier(_key)
{
	sentCommand := ""
	hasModifier := False

	If ( isVirtualCtrlDown() )
	{
		hasModifier := True
		sentCommand := sentCommand . "^"	; Control
	}
	If ( isVirtualShiftDown() )
	{
		hasModifier := True
		sentCommand := sentCommand . "+"	; Shift
	}
	If ( isVirtualAltDown() )
	{
		hasModifier := True
		sentCommand := sentCommand . "!"	; Alt
	}
	
	if ( !hasModifier )
	{
		sentCommand := sentCommand . "{Blind}"
	}
	
	sentCommand := sentCommand . "{" . _key . "}"
	Send, % sentCommand
}
;------------------------------
moveToNextWord()
{
	Send, % "^{Right}"
}
;------------------------------
moveToPreviousWord()
{
	Send, % "^{Left}"
}
;------------------------------
selectCurrentLine()
{
	Send, % "{Blind}{End}+{Home}"
}
;------------------------------
deleteCurrentLine()
{
	selectCurrentLine()
	Send, % "+{Home}{Delete 2}"
}
;------------------------------
closeActiveWindow()
{
	Send, % "!{F4}"
}
;------------------------------
; For Debugging.
; z::ExitApp
