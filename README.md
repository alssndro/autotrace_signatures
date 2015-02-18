## Autotracing signatures

This is a simple Rails app that explores potential options for automatic
[vectorization](http://en.wikipedia.org/wiki/Image_tracing) of signature images.

### Dependencies

You will need to install [ImageMagick](http://www.imagemagick.org/)   and
[Potrace](http://potrace.sourceforge.net/). Both can be easily installed on OS X
via Homebrew. You will also need Ghostrace if you wish to vectorize PDF files.

```
brew install imagemagick
brew install ghostscript
brew install potrace
```

Then `bundle install` as usual.

### Tools Used

The app has two 'modes':

  - **Draw mode** - allows signatures to be 'drawn' directly within the app, which uses
  [jSignature](https://github.com/willowsystems/jSignature).
  - **Trace mode** - allows the upload an image file of a signature, which is then
  processed using a combination of [ImageMagick](http://www.imagemagick.org/)
  and [Potrace](http://potrace.sourceforge.net/).
