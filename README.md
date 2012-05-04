# MapBox iOS Example

This is an example showing usage of the [MapBox iOS SDK](https://github.com/mapbox/mapbox-ios-sdk) for: 

 1. Online tile sources (e.g., [MapBox Hosting](http://mapbox.com/plans/)) with `RMMapBoxSource`
 1. Offline tile sources ([MBTiles](http://mbtiles.org)) with `RMMBTilesSource`
 1. Interactive tile sources of both types ([example](http://mapbox.com/demo/visiblemap/)) with `RMInteractiveSource`

![](https://github.com/mapbox/mapbox-ios-example/raw/master/screenshot.png)

### Build instructions

 1. `git clone --recursive` to pull down dependencies
 1. Build & go!

Be sure to select the proper target -- the application itself -- so that both the app and its dependent libraries will build and the app will run from Xcode. 

![](https://github.com/mapbox/mapbox-ios-example/raw/master/target.png)