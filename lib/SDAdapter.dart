import 'package:flutter/material.dart';
import 'package:sdui_flutter/model/WidgetConfig.dart';

int widgetPosition = 1;

Widget SDAdapter() {
  List<WidgetConfig> widgetList = [];
  List<WidgetConfig> contentWidget = [];
  List<WidgetConfig> contentProfile = [];
  List<WidgetConfig> profileImage = [];
  List<WidgetConfig> profileContentHolder = [];
  List<WidgetConfig> profileContentHolder1 = [];
  List<WidgetConfig> profileContent = [];
  profileImage
      .add(WidgetConfig(Elements.Image, [], value: "assets/flutter_Dash.jpeg"));

  // profileContentHolder1.add(WidgetConfig(Elements.Column, profileImage, ""));

  profileContent.add(WidgetConfig(Elements.Sizedbox, [], height: 20));
  profileContent
      .add(WidgetConfig(Elements.Text, [], value: "Flutter developer"));
  profileContent.add(WidgetConfig(Elements.Sizedbox, [], height: 20));
  profileContent.add(WidgetConfig(Elements.Text, [], value: "Partha"));
  profileContent.add(WidgetConfig(Elements.Sizedbox, [], height: 20));
  profileContent
      .add(WidgetConfig(Elements.Column, profileImage, value: "Partha"));

  profileContentHolder1.add(WidgetConfig(Elements.Column, profileContent));

  profileContentHolder
      .add(WidgetConfig(Elements.Expand, profileContentHolder1, flex: 5));
  profileContentHolder
      .add(WidgetConfig(Elements.Expand, profileContentHolder1, flex: 5));

  contentProfile.add(WidgetConfig(Elements.Center, profileImage, flex: 2));
  contentProfile.add(WidgetConfig(Elements.Row, profileContentHolder, flex: 8));

  contentWidget.add(WidgetConfig(Elements.Sizedbox,[],height: 20));
  contentWidget.add(WidgetConfig(Elements.Column, contentProfile));

  widgetList.add(WidgetConfig(Elements.Column, contentWidget));

  return baseWidget(widgetList);
}



/*-----------------------------------------------------------------------------------------------------------*/


Widget baseWidget(List<WidgetConfig> widgetList) {
  Widget widgetBase = Column();
  for (WidgetConfig widget in widgetList) {
    widgetBase = customWidget(widget);
  }
  return widgetBase;
}


List<Widget> customWidgetList(List<WidgetConfig> widgetList) {
  List<Widget> chilledList = [];
  for (WidgetConfig widget in widgetList) {
    chilledList.add(customWidget(widget));
  }
  return chilledList;
}


Widget customWidget(WidgetConfig widget) {
  print("$widgetPosition ${widget.widgetType}");

  widgetPosition++;
  switch (widget.widgetType) {
    case Elements.Text:
      return Text(widget.value);

    case Elements.Image:
      return Image(image: AssetImage(widget.value));

    case Elements.Column:
      return Column(children: customWidgetList(widget.childWidgets));

    case Elements.Row:
      return Row(children: customWidgetList(widget.childWidgets));

    case Elements.Expand:
      return Expanded(
          flex: widget.flex, child: baseWidget(widget.childWidgets));

    case Elements.Center:
      return Center(child: baseWidget(widget.childWidgets));

    case Elements.CircleAvatar:
      return CircleAvatar(backgroundImage: AssetImage(widget.value));

    case Elements.Sizedbox:
      return SizedBox(width: widget.width, height: widget.height);

    case Elements.Padding:
      return Padding(
          padding: EdgeInsets.only(
              top: widget.top,
              left: widget.left,
              right: widget.right,
              bottom: widget.bottom));

    case Elements.FittedBox:
      return FittedBox(child: baseWidget(widget.childWidgets));

    case Elements.Wrap:
      return Wrap(children: customWidgetList(widget.childWidgets));

    default:
      return Column();
  }
}

/*-----------------------------------------------------------------------------------------------------------*/














Widget buildChild(List<WidgetConfig> widgetList) {
  List<Widget> chilledList = [];
  for (WidgetConfig widget in widgetList) {
    switch (widget.widgetType) {
      case Elements.Text:
        return Text(widget.value);

      case Elements.Image:
        return CircleAvatar(backgroundImage: AssetImage(widget.value));

      case Elements.Column:
        return Column(
          children: buildChildren(widget.childWidgets),
        );

      case Elements.Row:
        return Row(
          children: buildChildren(widget.childWidgets),
        );

      case Elements.Center:
        return Center(
          child: buildChild(widget.childWidgets),
        );
    }
  }
  return Column();
}

List<Widget> buildChildren(List<WidgetConfig> listWidget) {
  List<Widget> widgetList = [];

  for (WidgetConfig widget in listWidget) {
    switch (widget.widgetType) {
      case Elements.Text:
        widgetList.add(Text(widget.value));
        break;

      case Elements.Image:
        widgetList.add(CircleAvatar(
          backgroundImage: AssetImage(widget.value),
        ));
        break;

      case Elements.Column:
        widgetList.add(Column(children: buildChildren(widget.childWidgets)));
        break;

      case Elements.Row:
        widgetList.add(Row(children: buildChildren(widget.childWidgets)));
        break;

      case Elements.Expand:
        print(widget.childWidgets.toString());
        widgetList.add(Expanded(
            flex: widget.flex, child: buildChild(widget.childWidgets)));
        break;

      case Elements.Center:
        widgetList.add(Center(child: buildChild(widget.childWidgets)));
        break;

      case Elements.Container:
        widgetList.add(Container(color: Colors.brown, height: 100, width: 100));
        break;
    }
  }
  return widgetList;
}
