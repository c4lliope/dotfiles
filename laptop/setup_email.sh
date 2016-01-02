# Dependencies
brew install \
  lastpass-cli \
  sqlite \
  urlview \

# Install offlineimap,
# using the method suggested by http://stevelosh.com/blog/2012/10/the-homely-mutt/
git clone git://github.com/spaetz/offlineimap.git ~/src/offlineimap
cd ~/src/offlineimap
git checkout 679c491c56c981961e18aa43b31955900491d7a3
python setup.py install

# make a folder for storing our mail
mkdir ~/.mail

# Make mutt's temp directory (see mutt/muttrc)
mkdir ~/.mutt/tmp

# Install Mutt with sidebar (from https://github.com/sgeb/homebrew-mutt
brew tap sgeb/mutt
brew install sgeb/mutt/mutt --with-sidebar-patch
