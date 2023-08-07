@Echo OFF
Echo Desprotegendo Arquivos Ocultos...
Attrib -r -a -s -h /s
Echo Limpando tudo...
if exist _*.* del _*.*
if exist *.~?? del *.~??
if exist *.dcu del *.dcu
if exist *.dof del *.dof
if exist *.ddp del *.ddp
if exist *.opt del *.opt
if exist *.dsm del *.dsm
if exist *.dsk del *.dsk
if exist *.mb del *.mb
if exist *.bak del *.bak
if exist *.lck del *.lck
if exist Pdoxusrs.net del Pdoxusrs.net
Echo Pronto