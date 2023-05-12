import 'package:flutter/material.dart';
import 'package:sdui_flutter/model/WidgetConfig.dart';


Widget SDAdapter() {
  List<WidgetConfig> widgetList = [];
  List<WidgetConfig> contentWidget = [];
  List<WidgetConfig> coWidget = [];
  List<WidgetConfig> toWidget = [];
  List<WidgetConfig> lastWidget = [];

  contentWidget.add(WidgetConfig(Elements.Text, [],"Flutter Developer"));
  contentWidget.add(WidgetConfig(Elements.Text, [],"Partha"));

  lastWidget.add(WidgetConfig(Elements.Container, [],"Sarathiiiii"));


  toWidget.add(WidgetConfig(Elements.Image, [],"assets/flutter_Dash.jpeg"));
  toWidget.add(WidgetConfig(Elements.Text, []," <> "));
  toWidget.add(WidgetConfig(Elements.Text, [],"Flutter birds"));

  toWidget.add(WidgetConfig(Elements.Column,lastWidget ,""));


  coWidget.add(WidgetConfig(Elements.Row, toWidget,"assets/flutter_Dash.jpeg"));
  //coWidget.add(WidgetConfig(Elements.Text, [],"HIIOO"));
  contentWidget.add(WidgetConfig(Elements.Column, coWidget,""));

  widgetList.add(WidgetConfig(Elements.Column, contentWidget,""));

  return widgetBuilder(widgetList);
}

Widget currentWidget = Column();
Widget widgetBuilder(List<WidgetConfig> widgetList) {
  for (WidgetConfig widget in widgetList) {
    int i = 0;
    print("${widget.widgetType}  $currentWidget");

    switch (widget.widgetType) {
      case Elements.Column:
        currentWidget = Column(
            children: buildChildren(widget.childWidgets),
        );
        break;

      case Elements.Row:
        currentWidget = Row(
          children: buildChildren(widget.childWidgets),
        );
        break;

      case Elements.Expand:
        currentWidget = Expanded(flex: 1,child: widgetBuilder(widget.childWidgets));
        break;

      case Elements.Container:
        currentWidget =  Container(
          color: Colors.brown,
          height: 300,
          width: 300,
          child: widgetBuilder(widget.childWidgets),
        );
        break;
    }
    i++;
  }
  return currentWidget;
}


List<Widget> buildChildren(List<WidgetConfig> listWidget) {
  List<Widget> widgetList = [];

  for (WidgetConfig widget in listWidget) {

    switch (widget.widgetType) {
      case Elements.Text:
        widgetList.add(Text(widget.value));
        break;

      case Elements.Image:
        widgetList.add(CircleAvatar(backgroundImage: AssetImage(widget.value),));
        break;

      case Elements.Column:
        widgetList.add(Column(children: buildChildren(widget.childWidgets)));
        break;

      case Elements.Row:
        widgetList.add(Row(children: buildChildren(widget.childWidgets)));
        break;

      case Elements.Container:
        widgetList.add(Container(color: Colors.brown, height: 100,width: 100));
        break;

    }
  }
  return widgetList;

}


void nextWidgetBuild(WidgetConfig widget){
  if(widget.childWidgets.length > 0){
    widgetBuilder(widget.childWidgets);
  }
}
