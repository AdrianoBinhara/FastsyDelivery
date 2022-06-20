class CategoryItem {
  final String title;
  final bool isSelected;

  const CategoryItem({
    required this.title,
    required this.isSelected,
  });
}

class CategoryItems {
  static const popular = CategoryItem(title: 'Popular', isSelected: true);
  static const fish = CategoryItem(title: 'Fish', isSelected: false);
  static const meat = CategoryItem(title: 'Meat', isSelected: false);
  static const salad = CategoryItem(title: 'Salad', isSelected: false);
  static const hamburguer = CategoryItem(title: 'Hamburguer', isSelected: false);

  static final List<CategoryItem> all = [popular, fish, meat, salad, hamburguer];
}
