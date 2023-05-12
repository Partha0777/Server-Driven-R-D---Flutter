class WidgetConfig{
   Elements widgetType;
   String value;
   List<WidgetConfig> childWidgets;
  WidgetConfig(this.widgetType, this.childWidgets, this.value);
}

enum Elements {
  Column,
  Row,
  Container,
  Text,
  Image,
  Expand
}
