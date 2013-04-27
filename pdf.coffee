var pdftohpub = require('pdftohpubjs');
var converter = new pdftohpub("/Users/keyvan/Desktop/Node.jsinAction.pdf", 'test/book');

converter.options = {
  buildThumbs: true
};

converter.progress(function(progress) {
  console.log("progress", progress)
});

converter.convert(function(err, obj) {
  console.log(obj);
});
