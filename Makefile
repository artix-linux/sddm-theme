Version=0.2

PREFIX = /usr/local

THEME = \
	artix/theme.conf \
	artix/Main.qml \
	artix/metadata.desktop \
	artix/rectangle.png \
	artix/angle-down.png

install:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/sddm/themes/artix
	install -m0644 ${THEME} $(DESTDIR)$(PREFIX)/share/sddm/themes/artix

uninstall:
	for f in ${THEME}; do rm -f $(DESTDIR)$(PREFIX)/share/sddm/themes/artix/$$f; done

dist:
	git archive --format=tar --prefix=sddm-theme-$(Version)/ $(Version) | gzip -9 > sddm-theme-$(Version).tar.gz
	gpg --detach-sign --use-agent sddm-theme-$(Version).tar.gz

.PHONY: install uninstall dist
