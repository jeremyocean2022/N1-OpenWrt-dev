#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 clone/passwall
git clone https://github.com/sbwml/luci-app-mosdns -b v5 clone/package/luci-app-mosdns
git clone https://github.com/sbwml/v2ray-geodata clone/package/v2ray-geodata
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# Update packages
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/packages/lang/golang

cp -rf clone/amlogic/luci-app-amlogic clone/passwall/luci-app-passwall clone/package/luci-app-mosdns feeds/luci/applications/
cp -rf clone/package/v2ray-geodata feeds/packages/net/

# Clean packages
rm -rf clone
