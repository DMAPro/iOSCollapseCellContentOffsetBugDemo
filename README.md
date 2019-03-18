The purpose of this repository is to demonstrate a possible bug in iOS UITableView:
On iOS 11 and 12 there's an issue with collapsing the cells. Sometimes tableView ends up having a negative contentOffset. It doesn't seem to happen on iOS 10.

Steps to reproduce:
1. Pick iPhone SE Simulator (or a device) with iOS 12.1 (or 11.x) and launch the app. The bug can be reproduced (as it seems) on any device, but it depends on the combination of cells height and screen size, so cells height in this project is tuned for iPhone SE.
2. Expand all the cells (by tapping on them).
3. Collapse cells in the following sequence: 3, 1, 2 (without touching cell #0 or scrolling the screen).
4. The tableView's contentOffset is negative, which results in a white area at the top of the screen that doesn't go away until you touch the screen.

The bug seems to be called by a `0` estimated cell height (set in the storyboard). It can be fixed by setting estimated row height to "Automatic" in the storyboard, or by implementing a proper `estimatedHeightForRow:atIndexPath:` method.
