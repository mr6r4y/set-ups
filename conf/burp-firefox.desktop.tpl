[Desktop Entry]
Version=1.0
Name=Firefox Web Browser
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=firefox -p {{FIREFOX_PROFILE}} %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=firefox
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=new-window;new-private-window;

Name[en_US]=Burp Firefox Web Browser

Path=

[Desktop Action new-window]
Name=Open a New Window
Exec=firefox -new-window

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=firefox -private-window
