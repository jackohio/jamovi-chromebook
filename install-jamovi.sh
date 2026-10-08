#!/bin/bash
set -e

echo "=================================="
echo " Chromebook jamovi 自動安裝程式"
echo "=================================="

echo "① 更新套件資料..."
sudo apt update

echo "② 安裝 Flatpak..."
sudo apt install -y flatpak

echo "③ 加入 Flathub..."
flatpak --user remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo

echo "④ 安裝 jamovi..."
flatpak install -y --user flathub org.jamovi.jamovi

echo "⑤ 建立快速啟動指令..."

grep -qxF "alias jamovi='flatpak run org.jamovi.jamovi'" ~/.bashrc || \
echo "alias jamovi='flatpak run org.jamovi.jamovi'" >> ~/.bashrc

grep -qxF "alias jamovi-safe='flatpak run org.jamovi.jamovi --disable-gpu'" ~/.bashrc || \
echo "alias jamovi-safe='flatpak run org.jamovi.jamovi --disable-gpu'" >> ~/.bashrc

echo
echo "=================================="
echo " jamovi 安裝完成！"
echo "=================================="
echo
echo "請關閉 Linux，再重新開啟。"
echo "之後在 Terminal 輸入：jamovi"
echo "若畫面異常則輸入：jamovi-safe"
