
c :
	@ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --langmap=c:+.h --languages=c --c-kinds=+p --fields=+iaS --extra=+q -f ~/mytags/systags /usr/include/*.h /usr/include/sys/*.h /usr/include/netinet/*.h

c++ :
	@ctags --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -R -f ~/mytags/cpp ~/cpp_src

project :
	@ctags --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q --languages=c,c++ -R ./

libev :
	@ctags -I EV_THROW --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q --languages=c,c++ -R ./
