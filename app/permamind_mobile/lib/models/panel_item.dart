class Item {
  Item({
    this.id,
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
    this.isChecked = false
  });

  String id;
  String expandedValue;
  String headerValue;
  bool isExpanded;
  bool isChecked;
}