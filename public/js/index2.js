var timePerImage = 6;
var timeFading   = 1;
var images = <%= Dir['img/*'].to_json %>;
];

var timePerImageMs = timePerImage * 1000;
var timeFadingMs   = timeFading * 1000;

$(document).ready(function() {
	console.log('ready...');
  var img1 = $('#img1');
  var img2 = $('#img2');
  doAnimationLoop(img1, img2);
	setInterval(function(){ doAnimationLoop(img1, img2); }, timePerImageMs);
});

async function doAnimationLoop(img1, img2) {
	console.log('doAnimationLoop...');
  var currentImage = images.shift();
  images.push(currentImage);

	if (img1.is(':visible')) {
    // set img2 to the new pic, fade out img1

		img2.attr('src', currentImage);
    img2.show();
		img1.fadeOut(timeFadingMs);
  } else {
    // set img1 to the new pic, fade in img1
		img1.attr('src', currentImage);
		img1.fadeIn(timeFadingMs);
  }

  // img1.attr('src', currentImage);
  // img1.show();
}
