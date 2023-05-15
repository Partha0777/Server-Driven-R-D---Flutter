class WidgetConfig {
  Elements widgetType;
  String value;
  int flex = 0;
  double height = 0;
  double width = 0;
  List<WidgetConfig> childWidgets;
  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  WidgetConfig(this.widgetType, this.childWidgets,
      {this.flex = 0,
      this.width = 0,
      this.height = 0,
      this.value = "",
      this.left = 0,
      this.bottom = 0,
      this.right = 0,
      this.top = 0});
}

enum Elements {
  Column,
  Row,
  Container,
  Text,
  Image,
  Expand,
  Center,
  Sizedbox,
  CircleAvatar,
  Padding,
  SafeArea,
  FittedBox,
  Wrap,

}
