

class CustomWidget {
	String widgetType = "";
	String value = " ";
	CustomWidget? child;
	List<CustomWidget> children = [];

	CustomWidget({
		required this.widgetType,
		required this.value,
		required this.children,
		required this.child
	});

	CustomWidget.empty(): this(widgetType: "",value: "",children: [], child: null);

	factory CustomWidget.fromJson(Map<String, dynamic> json){
			return CustomWidget(
				widgetType: json["widgetType"],
				value: json["value"],
				child: json["child"] != null ? CustomWidget.fromJson(json["child"]) : CustomWidget.empty(),
				children: json["children"] == null ? []: List<CustomWidget>.from(json["children"].map((x) => CustomWidget.fromJson(x))),
			);
	}

	Map<String, dynamic> toJson() => {
		"widgetType": widgetType,
		"value": value,
		"child": child,
		"children": List<dynamic>.from(children.map((x) => x.toJson())),
	};
}
