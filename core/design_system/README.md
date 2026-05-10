# Atomic Design for Flutter (Project-Specific Structure)

This implementation of Atomic Design is tailored for Flutter projects where the hierarchy is strictly divided between constants, basic reusable components, complex stateful components, and structural layouts.

---



## 1. Atoms
**Atoms** are the foundational constants and the most basic "primitive" widgets of your project. They are typically `const` and serve as the DNA of your design system.

* **Project Constants:** `AppColors`, `AppTextStyles`, `AppSizes`, `AppSpacing`.
* **Basic Widgets:** Custom `Divider`, `VerticalSpacer`, `BulletPoint`, or a custom `AppIcon`.
* **Key Characteristic:** They represent "Values" and "Primitives" that don't depend on other components.

```dart
// lib/ui/atoms/app_colors.dart
class AppColors {
  static const primary = Color(0xFF6200EE);
  static const divider = Color(0xFFE0E0E0);
}

// lib/ui/atoms/spacers.dart
class VerticalSpacer extends StatelessWidget {
  final double height;
  const VerticalSpacer(this.height, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
```

## 2. Molecules
**Molecules** are basic, functional UI components. In this project structure, they are typically **StatelessWidgets** that represent a single unit of the interface. They are built by combining **Atoms** (colors, spacing, typography) and serve as the standard building blocks used throughout the application.

* **Examples:** `AppButton`, `AppCard`, `AppChip`, `AppTextField`, `CustomDialog`.
* **Key Characteristic:** They are highly reusable and "pure" in the sense that they receive data via the constructor and emit events via callbacks.

### Implementation Example: Custom Card Molecule

```dart
// lib/ui/molecules/app_card.dart
import 'package:flutter/material.dart';
import '../atoms/app_colors.dart';
import '../atoms/app_sizes.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final Color? backgroundColor;

  const AppCard({
    required this.child,
    this.elevation,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p16), // Atom: Size
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface, // Atom: Color
        borderRadius: BorderRadius.circular(AppSizes.r12), // Atom: Radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: elevation ?? 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
```

## 3. Organisms
**Organisms** are complex, often **Stateful** widgets that form distinct, standalone sections of the interface. While molecules are generic and stateless, organisms often handle internal logic, manage user interactions (like selections or scrolling), or combine several molecules into a functional block.

* **Examples:** `ImageCarousel`, `TabNavigation`, `SelectionList`, `CustomListView`, `BottomNavBar`.
* **Key Characteristic:** They are the "features" of your UI. They manage their own state (e.g., tracking the active tab or a list of selected items) and provide a higher level of abstraction for the UI.

### Implementation Example: Selection List Organism
This organism manages the internal state of which item is currently selected, using the `AppChip` molecule.

```dart
// lib/ui/organisms/selection_list.dart
import 'package:flutter/material.dart';
import '../molecules/app_chip.dart';
import '../atoms/app_sizes.dart';

class SelectionList extends StatefulWidget {
  final List<String> items;
  final Function(String) onSelected;

  const SelectionList({
    required this.items,
    required this.onSelected,
    super.key,
  });

  @override
  State<SelectionList> createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.h50, // Atom: Height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.p8), // Atom: Spacing
        itemBuilder: (context, index) {
          return AppChip( // Molecule
            label: widget.items[index],
            isSelected: _selectedIndex == index,
            onTap: () {
              setState(() => _selectedIndex = index);
              widget.onSelected(widget.items[index]);
            },
          );
        },
      ),
    );
  }
}
```

## 4. Templates
**Templates** are structural layouts that define the "skeleton" of a page. In this architecture, they act as predefined configurations for the `Scaffold` or major scrolling areas. They focus on the placement of **Organisms** and **Molecules** without being coupled to specific domain data or business logic.

* **Examples:** `ScrollableActionTemplate` (scrolling body + floating button), `StickyHeaderTemplate`, `SearchLayoutTemplate`, `SplitScreenTemplate`.
* **Key Characteristic:** They typically use "slots" (passing `Widget` as a parameter) so that different pages can inject different content into the same structural layout.

### Implementation Example: Scrollable Action Template
This template ensures that every screen following this layout has a consistent AppBar, a scrollable body with standard padding, and a primary action button at the bottom.

```dart
// lib/ui/templates/scrollable_action_template.dart
import 'package:flutter/material.dart';
import '../atoms/app_sizes.dart';

class ScrollableActionTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final List<Widget>? actions;

  const ScrollableActionTemplate({
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p16), // Atom: Standard Padding
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
```
