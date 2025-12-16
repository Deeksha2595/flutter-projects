import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: HomePage(),
    ),
  );
}

// Model class with JSON serialization
class CheckItem {
  final String id;
  final String title;
  bool isChecked;
  String quantity;
  DateTime createdAt;

  CheckItem({
    String? id,
    required this.title,
    this.isChecked = false,
    this.quantity = '',
    DateTime? createdAt,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked,
      'quantity': quantity,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory CheckItem.fromJson(Map<String, dynamic> json) {
    return CheckItem(
      id: json['id'],
      title: json['title'],
      isChecked: json['isChecked'] ?? false,
      quantity: json['quantity'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

// HomePage: Checklist
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<CheckItem> items = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? itemsJson = prefs.getString('shopping_items');

      if (itemsJson != null) {
        final List<dynamic> decoded = json.decode(itemsJson);
        setState(() {
          items = decoded.map((item) => CheckItem.fromJson(item)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          items = [
            // Oils
            CheckItem(title: "நல்லெண்ணெய்", quantity: "3 லி"),
            CheckItem(title: "கடலையெண்ணெய்", quantity: "2 லி"),
            CheckItem(title: "தேங்காய் எண்ணெய்", quantity: "1/2 லி"),
            CheckItem(title: "நெய்", quantity: ""),

            // Rice & Grains
            CheckItem(title: "பொன்னி பச்சரிசி", quantity: "1 கிலோ"),
            CheckItem(title: "இட்லி அரிசி", quantity: ""),
            CheckItem(title: "சாப்பாட்டு அரிசி", quantity: ""),
            CheckItem(title: "கோதுமை மாவு", quantity: "2 கிலோ"),
            CheckItem(title: "ரவை", quantity: "1/2 கிலோ"),
            CheckItem(title: "கடலை மாவு", quantity: "1/2 கிலோ"),
            CheckItem(title: "அதிரச மாவு", quantity: ""),

            // Dals & Pulses
            CheckItem(title: "துவரம் பருப்பு", quantity: "1/2 கிலோ 2 பாக்கெட்"),
            CheckItem(title: "உருட்டு உளுந்து", quantity: "2 கிலோ"),
            CheckItem(title: "கடலைப்பருப்பு", quantity: "1/2 கிலோ"),
            CheckItem(title: "பாசிப்பருப்பு", quantity: "1/2 கிலோ"),
            CheckItem(title: "பொரி கடலை", quantity: "1/2 கிலோ"),
            CheckItem(title: "கருப்பு சுண்டல்", quantity: "1/2 கிலோ"),
            CheckItem(title: "வெள்ளை சுண்டல்", quantity: ""),

            // Spices & Powders
            CheckItem(title: "ஆச்சி சாம்பார் தூள்", quantity: "300 கிராம்"),
            CheckItem(title: "ஆச்சி மல்லி தூள்", quantity: "300 கிராம்"),
            CheckItem(title: "மஞ்சள் தூள்", quantity: ""),
            CheckItem(title: "மிளகாய் வத்தல்", quantity: "1/2 கிலோ"),
            CheckItem(title: "எல்ஜி பெருங்காயத்தூள்", quantity: "டப்பா"),
            CheckItem(title: "சீரகம்", quantity: "200 கிராம்"),
            CheckItem(title: "கடுகு", quantity: "100 கிராம்"),
            CheckItem(title: "மிளகு", quantity: "100 கிராம்"),
            CheckItem(title: "வெந்தயம்", quantity: "150 கிராம்"),
            CheckItem(title: "சோம்பு", quantity: "150 கிராம்"),
            CheckItem(title: "கிராம்பு", quantity: "30 ரூபாய்"),
            CheckItem(title: "கேசரி பவுடர்", quantity: ""),

            // Food Items
            CheckItem(title: "சீனி", quantity: "2 கிலோ"),
            CheckItem(title: "கல் உப்பு", quantity: "2 பாக்கெட்"),
            CheckItem(title: "டேபிள் சால்ட்", quantity: ""),
            CheckItem(title: "காபி தூள்", quantity: ""),
            CheckItem(title: "த்ரீ ரோசஸ் நேச்சுரல் கேர் டீ தூள்", quantity: ""),
            CheckItem(title: "புளி", quantity: "1/2 கிலோ"),
            CheckItem(title: "அப்பளம்", quantity: ""),
            CheckItem(title: "தயிர்", quantity: ""),

            // Cleaning Products
            CheckItem(title: "ரின் பவுடர்", quantity: "1/2 கிலோ 2 பாக்கெட்"),
            CheckItem(title: "ரின் பார்", quantity: "5"),
            CheckItem(title: "ரின் லிக்விட் பிரண்ட் லோட்", quantity: ""),
            CheckItem(title: "விம் லிக்விட்", quantity: ""),
            CheckItem(title: "லைசால்", quantity: ""),
            CheckItem(title: "ஹார்பிக்", quantity: ""),
            CheckItem(title: "ஃபினைல்", quantity: ""),
            CheckItem(title: "ஹேண்ட் வாஷ்", quantity: ""),
            CheckItem(title: "டெட்டால்", quantity: ""),

            // Personal Care
            CheckItem(title: "Colgate toothpaste", quantity: "200 கிராம்"),
            CheckItem(title: "ஹமாம் சோப்பு", quantity: "2"),
            CheckItem(title: "சிந்தால் சோப்பு", quantity: "2"),

            // Others
            CheckItem(title: "ஒடோமாஸ் பச்சை", quantity: ""),
            CheckItem(title: "வாழை இலை", quantity: ""),
            CheckItem(title: "வாழைப்பழம்", quantity: ""),
            CheckItem(title: "வெற்றிலை பாக்கு", quantity: ""),
            CheckItem(title: "பூ", quantity: ""),
          ];
          _isLoading = false;
        });
        _saveItems();
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showSnackBar('Error loading items', isError: true);
    }
  }

  Future<void> _saveItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encoded = json.encode(
        items.map((item) => item.toJson()).toList(),
      );
      await prefs.setString('shopping_items', encoded);
    } catch (e) {
      _showSnackBar('Error saving items', isError: true);
    }
  }

  void _clearCheckboxes() {
    setState(() {
      for (var item in items) {
        item.isChecked = false;
      }
    });
    _saveItems();
    _showSnackBar('All selections cleared');
  }

  void _deleteItem(CheckItem item) {
    final index = items.indexOf(item);
    setState(() {
      items.removeAt(index);
    });
    _saveItems();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.title} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              items.insert(index, item);
            });
            _saveItems();
          },
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _updateCheckbox(CheckItem item, bool value) {
    setState(() {
      item.isChecked = value;
    });
    _saveItems();
  }

  void _editItemInline(CheckItem item, String field) {
    final isTitle = field == 'title';
    final controller = TextEditingController(
      text: isTitle ? item.title : item.quantity,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isTitle ? 'Edit Item Name' : 'Edit Quantity'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: isTitle
                ? TextCapitalization.words
                : TextCapitalization.none,
            decoration: InputDecoration(
              labelText: isTitle ? 'Item name' : 'Quantity',
              hintText: isTitle ? 'e.g., Tomatoes' : 'e.g., 1 kg, 2 liters',
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                isTitle ? Icons.shopping_cart : Icons.format_list_numbered,
              ),
            ),
            onSubmitted: (value) {
              if (value.trim().isNotEmpty) {
                setState(() {
                  if (isTitle) {
                    final index = items.indexOf(item);
                    items[index] = CheckItem(
                      id: item.id,
                      title: value.trim(),
                      isChecked: item.isChecked,
                      quantity: item.quantity,
                      createdAt: item.createdAt,
                    );
                  } else {
                    item.quantity = value.trim();
                  }
                });
                _saveItems();
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    if (isTitle) {
                      final index = items.indexOf(item);
                      items[index] = CheckItem(
                        id: item.id,
                        title: controller.text.trim(),
                        isChecked: item.isChecked,
                        quantity: item.quantity,
                        createdAt: item.createdAt,
                      );
                    } else {
                      item.quantity = controller.text.trim();
                    }
                  });
                  _saveItems();
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _clearAllItems() {
    if (items.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Clear All Items?'),
          content: Text(
            'This will delete all ${items.length} items from your list.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                final backup = List<CheckItem>.from(items);
                setState(() {
                  items.clear();
                });
                _saveItems();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('All items cleared'),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        setState(() {
                          items = backup;
                        });
                        _saveItems();
                      },
                    ),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text('Clear All'),
            ),
          ],
        );
      },
    );
  }

  void _copyCheckedItems() {
    final checkedItems = items.where((item) => item.isChecked).toList();

    if (checkedItems.isEmpty) {
      _showSnackBar('No items selected to copy', isError: true);
      return;
    }

    // Check if all checked items have quantities
    final itemsWithoutQuantity = checkedItems
        .where((item) => item.quantity.trim().isEmpty)
        .toList();

    if (itemsWithoutQuantity.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Include Items Without Quantity?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${itemsWithoutQuantity.length} item(s) don\'t have quantities:',
                ),
                SizedBox(height: 8),
                Container(
                  constraints: BoxConstraints(maxHeight: 150),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: itemsWithoutQuantity
                          .map(
                            (item) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                '• ${item.title}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text('How would you like to copy them?'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _copyCheckedItemsToClipboard(
                    checkedItems,
                    includeWithoutQuantity: false,
                  );
                },
                child: Text('Skip These'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  _copyCheckedItemsToClipboard(
                    checkedItems,
                    includeWithoutQuantity: true,
                  );
                },
                child: Text('Include All'),
              ),
            ],
          );
        },
      );
    } else {
      _copyCheckedItemsToClipboard(checkedItems, includeWithoutQuantity: true);
    }
  }

  void _copyCheckedItemsToClipboard(
    List<CheckItem> checkedItems, {
    required bool includeWithoutQuantity,
  }) {
    final textLines = <String>[];

    for (var item in checkedItems) {
      if (item.quantity.trim().isNotEmpty) {
        textLines.add('${item.title} - ${item.quantity}');
      } else if (includeWithoutQuantity) {
        textLines.add(item.title);
      }
    }

    if (textLines.isEmpty) {
      _showSnackBar('No items to copy', isError: true);
      return;
    }

    final text = textLines.join('\n');
    Clipboard.setData(ClipboardData(text: text));

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 28),
              SizedBox(width: 8),
              Text('Copied to Clipboard!'),
            ],
          ),
          content: Container(
            constraints: BoxConstraints(maxHeight: 300),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: SingleChildScrollView(
              child: SelectableText(
                text,
                style: TextStyle(fontFamily: 'monospace', fontSize: 14),
              ),
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : null,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  List<CheckItem> get filteredItems {
    if (_searchQuery.isEmpty) return items;
    return items
        .where(
          (item) =>
              item.title.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  int get selectedCount => items.where((item) => item.isChecked).length;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading your shopping list...'),
            ],
          ),
        ),
      );
    }

    final displayItems = filteredItems;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping List',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            if (items.isNotEmpty)
              Text(
                '${items.length} items${selectedCount > 0 ? ' • $selectedCount selected' : ''}',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddItemDialog(),
            tooltip: 'Add item',
          ),
          if (items.any((item) => item.isChecked))
            IconButton(
              icon: Icon(Icons.clear_all),
              onPressed: _clearCheckboxes,
              tooltip: 'Clear selections',
            ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'clear') _clearAllItems();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'clear',
                child: Row(
                  children: [
                    Icon(Icons.delete_sweep, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Clear all items'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          if (items.length > 3)
            Container(
              color: Colors.teal,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search items...',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

          // Items list
          Expanded(
            child: displayItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _searchQuery.isEmpty
                              ? Icons.shopping_cart_outlined
                              : Icons.search_off,
                          size: 80,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No items in your list'
                              : 'No items found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          _searchQuery.isEmpty
                              ? 'Tap "Add Item" to get started'
                              : 'Try a different search',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: displayItems.length,
                    itemBuilder: (context, index) {
                      final item = displayItems[index];
                      return Dismissible(
                        key: Key(item.id),
                        background: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => _deleteItem(item),
                        child: Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          elevation: 2,
                          color: item.isChecked
                              ? Colors.teal[50]
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: item.isChecked
                                ? BorderSide(color: Colors.teal, width: 2)
                                : BorderSide.none,
                          ),
                          child: InkWell(
                            onTap: () => _updateCheckbox(item, !item.isChecked),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: item.isChecked,
                                    onChanged: (value) =>
                                        _updateCheckbox(item, value!),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () =>
                                              _editItemInline(item, 'title'),
                                          child: Text(
                                            item.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        InkWell(
                                          onTap: () =>
                                              _editItemInline(item, 'quantity'),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: item.quantity.isEmpty
                                                  ? Colors.grey[100]
                                                  : Colors.teal[100],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  item.quantity.isEmpty
                                                      ? Icons.add_circle_outline
                                                      : Icons.shopping_basket,
                                                  size: 14,
                                                  color: item.quantity.isEmpty
                                                      ? Colors.grey[600]
                                                      : Colors.teal[700],
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  item.quantity.isEmpty
                                                      ? 'Add quantity'
                                                      : item.quantity,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: item.quantity.isEmpty
                                                        ? Colors.grey[600]
                                                        : Colors.teal[700],
                                                    fontWeight:
                                                        item.quantity.isEmpty
                                                        ? FontWeight.normal
                                                        : FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  IconButton(
                                    icon: Icon(Icons.delete_outline, size: 20),
                                    onPressed: () => _deleteItem(item),
                                    tooltip: 'Delete',
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Bottom action button
          if (selectedCount > 0)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _copyCheckedItems,
                    icon: Icon(Icons.content_copy, size: 20),
                    label: Text(
                      'Copy Selected Items ($selectedCount)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showAddItemDialog() {
    final nameController = TextEditingController();
    final quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Item name',
                  hintText: 'e.g., Tomatoes, Rice',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.add_shopping_cart),
                ),
                onSubmitted: (_) {},
              ),
              SizedBox(height: 16),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity (optional)',
                  hintText: 'e.g., 1 kg, 2 liters',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.format_list_numbered),
                ),
                onSubmitted: (value) {
                  if (nameController.text.trim().isNotEmpty) {
                    final newItem = CheckItem(
                      title: nameController.text.trim(),
                      quantity: quantityController.text.trim(),
                    );
                    setState(() {
                      items.insert(0, newItem);
                    });
                    _saveItems();
                    Navigator.pop(context);
                    _showSnackBar('${nameController.text.trim()} added');
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (nameController.text.trim().isNotEmpty) {
                  final newItem = CheckItem(
                    title: nameController.text.trim(),
                    quantity: quantityController.text.trim(),
                  );
                  setState(() {
                    items.insert(0, newItem);
                  });
                  _saveItems();
                  Navigator.pop(context);
                  _showSnackBar('${nameController.text.trim()} added');
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
