This is the needed usage scenario to reproduce the 

Blauer Engel measurement of Okular: https://www.blauer-engel.de/en/products/kde-okular

The original repository files with actiona are in the Feep repository: https://invent.kde.org/teams/eco/feep

This version is the compatible one for the Green Metrics Tool.


# Instructions
This flow expects Ubuntu 22.04 as the host operating system with a 2560x1440 resolution with a 100% scaling and no fractional scaling.

The document in question (a PDF with at least 60 pages) is expected to on the desktop in the left top most corner and the desktop must be visible. 
All other GUI applications should be closed.

Your menu bar must also be active and on the left side

## Testing

This directory is excluded from our automated testing pipeline, due to the long
runtime and flaky test reliability in case of display resolution changes.
Thes reliability is due to the restrictions from the original Blauer Engel submission.

