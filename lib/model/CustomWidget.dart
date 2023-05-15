

class CustomWidget {
	String widgetType;
	String value;
	List<CustomWidget> children;

	CustomWidget({
		required this.widgetType,
		required this.value,
		required this.children,
	});

	factory CustomWidget.fromJson(Map<String, dynamic> json) => CustomWidget(
		widgetType: json["widgetType"],
		value: json["value"],
		children: json["children"] == null? [] : List<CustomWidget>.from(json["children"].map((x) => CustomWidget.fromJson(x))),
	);

	Map<String, dynamic> toJson() => {
		"widgetType": widgetType,
		"value": value,
		"children": List<dynamic>.from(children.map((x) => x.toJson())),
	};
}
