class WidgetConfig{
   Elements widgetType;
   String value;
   int flex = 0;
   List<WidgetConfig> childWidgets;
  WidgetConfig(this.widgetType, this.childWidgets, this.value, {this.flex = 0});
}

enum Elements {
  Column,
  Row,
  Container,
  Text,
  Image,
  Expand,
  Center
}
