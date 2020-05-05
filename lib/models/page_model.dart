class PageModel {
  final String assetImagePath;
  final String text;
  PageModel({this.assetImagePath, this.text});
}

List<PageModel> pages = [
  PageModel(
    assetImagePath: 'assets/images/walkthrough_1.png',
    text: 'Select State & City',
  ),
  PageModel(
    assetImagePath: 'assets/images/walkthrough_2.png',
    text: 'List of services available in your city',
  ),
  PageModel(
      assetImagePath: 'assets/images/walkthrough_3.png',
      text: 'Service contact information'),
];
