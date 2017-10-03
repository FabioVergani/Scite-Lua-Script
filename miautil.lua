find.replace.regexp.posix=1

ext.lua.startup.script=$(SciteDefaultHome)/fabio.lua
command.name.1.*=FABIO
command.subsystem.1.*=3
command.1.*=pippo
command.mode.1.*=savebefore:no
command.shortcut.1.*=Ctrl+U


function pippo()
 local s=editor:GetText()
 s=s:gsub('(%s*[\(]%s*)','(')
 s=s:gsub('(%s*[\(][\!]%s*)','(!')
 s=s:gsub('(%s*[\)])%s*',')')
 s=s:gsub('(%s*,%s*)',',')
 s=s:gsub('(%s*=%s*)','=')
 s=s:gsub('(%s*(=>)%s*)','=>')
 s=s:gsub('(%s*(->)%s*)','->')
 s=s:gsub('([\)]&&)',') &&')
 s=s:gsub('([}]%s*)','}')
 editor:SetText(s) 
end
