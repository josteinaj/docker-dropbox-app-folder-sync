# docker-dropbox-app-folder-sync

[![](https://images.microbadger.com/badges/image/josteinaj/docker-dropbox-app-folder-sync.svg)](https://microbadger.com/images/josteinaj/docker-dropbox-app-folder-sync "Get your own image badge on microbadger.com")

Docker image to keep an App folder in sync with a normal folder in Dropbox.

It's kind of a hack and it's currently configured to map a couple of folders
under "Dropbox/fagerheimen.no/" to "Dropbox/Blot/", but can be easily modified
for other folders as well.

To be run 24/7 on a cloud host such as DigitalOcean or similar to keep the
folders in sync.

Use `docker logs [containerId]` when running it the first time to get a link
used for connecting the dropbox daemon to your dropbox account.
