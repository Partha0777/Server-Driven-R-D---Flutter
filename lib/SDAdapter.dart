import 'package:flutter/material.dart';
import 'package:sdui_flutter/model/WidgetConfig.dart';

Widget SDAdapter() {
  List<WidgetConfig> widgetList = [];
  List<WidgetConfig> contentWidget = [];
  List<WidgetConfig> contentProfile = [];
  List<WidgetConfig> profileImage = [];
  List<WidgetConfig> profileContentHolder = [];
  List<WidgetConfig> profileContentHolder1 = [];
  List<WidgetConfig> profileContent = [];

  profileImage
      .add(WidgetConfig(Elements.Image, [], "assets/flutter_Dash.jpeg"));

  profileContent.add(WidgetConfig(Elements.Text, [], "Partha"));
  profileContent.add(WidgetConfig(Elements.Text, [], "Flutter developer"));

  profileContentHolder.add(WidgetConfig(Elements.Column, profileContent, ""));
  // profileContentHolder1.add(WidgetConfig(Elements.Column, profileImage, ""));

  contentProfile
      .add(WidgetConfig(Elements.Expand, profileContentHolder, "", flex: 8));
  contentProfile.add(WidgetConfig(Elements.Expand, profileImage, "", flex: 2));

  //Row
  contentWidget.add(WidgetConfig(Elements.Row, contentProfile, ""));

  //Column

  widgetList.add(WidgetConfig(Elements.Column, contentWidget, ""));
  contentWidget.add(WidgetConfig(Elements.Row, [WidgetConfig(Elements.Expand, profileImage, "",flex: 5),WidgetConfig(Elements.Expand, profileImage, "",flex: 5)], ""));
  contentWidget.add(WidgetConfig(Elements.Column, [WidgetConfig(Elements.Column, profileImage, ""),WidgetConfig(Elements.Column, profileImage, "")], ""));

  return buildChild(widgetList);
}

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
