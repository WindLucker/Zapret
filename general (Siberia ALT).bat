@echo off
chcp 65001 > nul

cd /d "%~dp0"
call service_status.bat zapret
call check_updates.bat soft
echo:

set BIN=%~dp0bin\

start "zapret: general" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=443,50000-50100 ^
--filter-udp=443 --hostlist="list-general(siberia).txt" --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-50100 --ipset="ipset-discord.txt" --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=4 --new ^
--filter-tcp=80 --hostlist="list-general(siberia).txt" --dpi-desync=fake,multisplit --dpi-desync-autottl=2:4-20 --dpi-desync-fooling=md5sig,badseq --dpi-desync-split-pos=method+2 --new ^
--filter-tcp=443 --hostlist="list-general(siberia).txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=5 --dpi-desync-fooling=md5sig,badseq --dpi-desync-autottl=2:4-20 --new ^
--filter-tcp=443 --hostlist="list-youtube.txt" --dpi-desync=fake,multisplit --dpi-desync-repeats=4 --dpi-desync-fooling=md5sig,badseq --dpi-desync-split-pos=1,midsld --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --new ^
--filter-udp=443 --ipset="ipset-cloudflare.txt" --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80 --ipset="ipset-cloudflare.txt" --dpi-desync=fake,multisplit --dpi-desync-autottl=2:4-20 --dpi-desync-fooling=md5sig,badseq --dpi-desync-split-pos=method+2 --new ^
--filter-tcp=443 --ipset="ipset-cloudflare.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=4 --dpi-desync-fooling=md5sig,badseq --dpi-desync-autottl=2:4-20