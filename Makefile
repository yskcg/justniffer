#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=justniffer
PKG_RELEASE:=1

PKG_LICENSE:=GPLv2 GPLv2+
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/justniffer
  SECTION:=utils
  CATEGORY:=Base system
  DEPENDS:=+lboost_regex +lboost_program_options  +libpcap +lstdc++
  TITLE:=morewifi system justniffer
endef


define Package/justniffer/description
 This package contains an daemon to upgrade the system use web and  morewifi cloud server
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--without-python2.7 \
	)
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/justniffer/install
	$(INSTALL_DIR) $(1)/usr/sbin
	 $(CP) $(STAGING_DIR)/root-ramips/usr/lib/{libboost_program_options,libboost_regex,libstdc++}.so.* $(1)/usr/sbin/
	 $(CP) $(STAGING_DIR)/root-ramips/lib/{libpthread,librt}.so.* $(1)/usr/sbin/
	 $(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/justniffer $(1)/usr/sbin/
endef


$(eval $(call BuildPackage,justniffer))
