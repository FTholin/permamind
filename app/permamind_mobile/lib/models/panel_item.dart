class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
    this.isChecked = false
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  bool isChecked;
}