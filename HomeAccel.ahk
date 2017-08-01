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
vk1Dsc07B & h::decorateModifier("Left")
vk1Dsc07B & j::decorateModifier("Down")
vk1Dsc07B & k::decorateModifier("Up")
vk1Dsc07B & l::decorateModifier("Right")
vk1Dsc07B & u::decorateModifier("BS")
vk1Dsc07B & i::decorateModifier("Del")
vk1Dsc07B & m::decorateModifier("Enter")
vk1Dsc07B & n::decorateModifier("PgDn")
vk1Dsc07B & p::decorateModifier("PgUp")
vk1Dsc07B & vkBAsc028::decorateModifier("vkF3sc029") ; vkBAsc028=:, vkF3sc029=”¼Šp/‘SŠp
vk1Dsc07B & ,::decorateModifier("Home")
vk1Dsc07B & .::decorateModifier("End")
vk1Dsc07B & o::decorateModifier("Tab")
vk1Dsc07B & `;::decorateModifier("Esc")
vk1Dsc07B & w::moveToNextWord()
vk1Dsc07B & b::moveToPreviousWord()
vk1Dsc07B & e::selectCurrentLine()
vk1Dsc07B & r::deleteCurrentLine()
vk1Dsc07B & q::closeActiveWindow()
vk1Dsc07B & 1::decorateModifier("F1")
vk1Dsc07B & 2::decorateModifier("F2")
vk1Dsc07B & 3::decorateModifier("F3")
vk1Dsc07B & 4::decorateModifier("F4")
vk1Dsc07B & 5::decorateModifier("F5")
vk1Dsc07B & 6::decorateModifier("F6")
vk1Dsc07B & 7::decorateModifier("F7")
vk1Dsc07B & 8::decorateModifier("F8")
vk1Dsc07B & 9::decorateModifier("F9")
vk1Dsc07B & 0::decorateModifier("F10")
;----------------------------------------
vk1Dsc07B & c::Return	; second modifier.see:isVirtualCtrlDown().
vk1Dsc07B & s::Return	; second modifier.see:isVirtualShiftlDown().
vk1Dsc07B & a::Return	; second modifier.see:isVirtualAltDown().
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
