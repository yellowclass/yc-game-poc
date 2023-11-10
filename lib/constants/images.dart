String _imageLocation(String pic) =>
    'https://firebasestorage.googleapis.com/v0/b/contacts-ivykids.appspot.com/o/game%2F$pic?alt=media&token=d3ea417e-c9be-4c26-b749-255ab9aa7821&_gl=1*10i1jye*_ga*NDkzMzU0NTY5LjE2OTM1MTY2OTI.*_ga_CW55HF8NVT*MTY5ODU5MzIyNy40NS4xLjE2OTg1OTUxNTUuNjAuMC4w';

class ImagesBackground {
  static String layer1 = _imageLocation('background%2F1.png');
  static String layer2 = _imageLocation('background%2F2.png');
  static String layer3 = _imageLocation('background%2F3.png');
  static String layer4 = _imageLocation('background%2F4.png');
  static String layer5 = _imageLocation('background%2F5.png');
  static String layer6 = _imageLocation('background%2F6.png');
  static String layer7 = _imageLocation('background%2F7.png');
  static String layer8 = _imageLocation('background%2F8.png');
}

class ImagesSwordsman {
  static String idle = _imageLocation('swordsman%2Fidle.png');
  static String walk = _imageLocation('swordsman%2Fwalk.png');
  static String run = _imageLocation('swordsman%2Frun.png');
}

class ImagesWizard {
  static String idle = _imageLocation('wizard%2Fidle.png');
  static String walk = _imageLocation('wizard%2Fwalk.png');
  static String run = _imageLocation('wizard%2Frun.png');
}
