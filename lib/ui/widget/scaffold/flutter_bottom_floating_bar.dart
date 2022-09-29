import 'package:flutter/material.dart';

class FloatingNavigationBar extends StatefulWidget {
  ///It is items what you want to add
  List<FloatingNavigationItem> items;

  ///
  int selectedIndex;

  ///You can take what is current index when you tap navigation item
  Function(int index) onTap;

  ///A double that determines how far it is from the bottom
  double bottomMargin;

  ///Determines how much evocation effect you want to add.
  double elevation;

  ///Decide the padding you want to put inside of NavigationBar
  EdgeInsets padding;

  ///Decide how much flexion you want to give to the corner.
  BorderRadius? borderRadius;

  ///Set up how fast movement of Cursor
  Duration duration;

  ///The Curve of item movement
  Curve? curves;

  ///You can change the navigationbar color, but default color follows at the 'ThemeData.ColorScheme.SurfaceColor'
  Color? backgroundColor;

  FloatingNavigationBar(
      {
        Key? key,
        required this.items,
        required this.selectedIndex,
        required this.onTap,
        this.bottomMargin = 15,
        this.elevation = 5,
        this.padding = const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 2),
        this.duration = const Duration(milliseconds: 300),
        this.curves,
        this.borderRadius,
        this.backgroundColor})
      : super(key: key);

  @override
  State<FloatingNavigationBar> createState() => _FloatingNavigationBarState();
}

class _FloatingNavigationBarState extends State<FloatingNavigationBar> with TickerProviderStateMixin {
  final double _itemWidth = 40;
  final double _cursorWidth = 5;

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    List<Widget> navigationItems = [];
    for (int i = 0; i < widget.items.length; i++) {
      navigationItems.add(_getNavigationItem(i, widget.items[i], widget.onTap));
    }

    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
            elevation: widget.elevation,
            color: Colors.transparent,
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(30),
                color: widget.backgroundColor ?? themeData.colorScheme.surface,
                // boxShadow: [BoxShadow(color: themeData.colorScheme.shadow, blurRadius: 10,spreadRadius: 1, offset: const Offset(0, 4))]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: _itemWidth*navigationItems.length,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                            left: _getCurrentCursorPosition(_itemWidth, _cursorWidth, navigationItems.length, widget.selectedIndex),
                            top: 0,
                            bottom: 0,
                            duration: Duration(milliseconds: 200),
                            curve: widget.curves??Curves.easeInOut,
                            child: Container(
                              width: _cursorWidth,
                              decoration: BoxDecoration(color: themeData.colorScheme.primary, borderRadius: BorderRadius.circular(10)),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: navigationItems,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getNavigationItem(int index, FloatingNavigationItem item, Function(int index) onTap) {
    ThemeData themeData = Theme.of(context);
    Color? itemColor = widget.selectedIndex == index ? themeData.colorScheme.primary : null;
    return Container(
      width: _itemWidth,
      height: _itemWidth,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            child: Icon(
              item.icon,
              color: itemColor,
            ),
            onTap: () {
              onTap(index);
              setState(() {});
            },
          )),
    );
  }

  double _getCurrentCursorPosition(double itemWidth, double cursorWidth, int itemCount, int currentIndex) {
    final double defaultPosition = itemWidth / 2 - cursorWidth/2;
    double currentPosition = 0;
    if (currentIndex <= itemCount) {
      currentPosition = defaultPosition + (itemWidth * currentIndex);
    }
    return currentPosition;
  }
}



class FloatingNavigationItem {
  IconData icon;


  FloatingNavigationItem({
    required this.icon,
  });
}

