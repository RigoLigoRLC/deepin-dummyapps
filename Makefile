# SPDX-FileCopyrightText: 2024 UnionTech Software Technology Co., Ltd.
#
# SPDX-License-Identifier: CC0-1.0

all: build

build:

install:
	install -Dm 644 ./assets/dummyapp-dummyapptestreserved.svg ${DESTDIR}/usr/share/icons/hicolor/scalable/apps/dummyapp-dummyapptestreserved.svg

	install -Dm 644 ./misc/dummyapp-dummyapptestreserved.desktop ${DESTDIR}/usr/share/applications/dummyapp-dummyapptestreserved.desktop
	install -Dm 644 ./misc/dummyapp-dummyapptestreserved.metainfo.xml ${DESTDIR}/usr/share/metainfo/dummyapp-dummyapptestreserved.metainfo.xml
