# SPDX-FileCopyrightText: 2024 UnionTech Software Technology Co., Ltd.
#
# SPDX-License-Identifier: CC0-1.0

all: build

build: generate_mo

install:
	install -Dm 644 ./assets/dummyapp-wpsoffice.svg ${DESTDIR}/usr/share/icons/hicolor/scalable/apps/dummyapp-wpsoffice.svg
	install -Dm 644 ./misc/dummyapp-wpsoffice.desktop ${DESTDIR}/usr/share/applications/dummyapp-wpsoffice.desktop
	install -Dm 644 ./misc/dummyapp-wpsoffice.metainfo.xml ${DESTDIR}/usr/share/metainfo/dummyapp-wpsoffice.metainfo.xml

	install -Dm 644 ./i18n/zh_CN.mo ${DESTDIR}/usr/share/locale/zh_CN/LC_MESSAGES/dummyapp-entrypoint.mo
	install -Dm 755 ./src/dummyapp-entrypoint.sh ${DESTDIR}/usr/bin/dummyapp-entrypoint.sh

clean:
	rm -f i18n/**/*.mo

# For translation
# --no-translator stops msginit from asking for an email address
generate_po:
	xgettext -o i18n/dummyapp-entrypoint.pot src/dummyapp-entrypoint.sh
	msginit --no-translator -i ./i18n/dummyapp-entrypoint.pot -l zh_CN.UTF-8 -o i18n/zh_CN.po

generate_mo:
	msgfmt i18n/zh_CN.po -o i18n/zh_CN.mo

