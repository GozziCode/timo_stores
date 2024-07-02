import 'package:flutter/material.dart';

typedef OnItemChanged = void Function(int newPosition);

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final OnItemChanged onItemChanged;
  final List<NavBarData> navBarItems;
  const BottomNavBar({
    super.key,
    required this.onItemChanged,
    required this.navBarItems,
    required this.currentIndex,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.fromLTRB(32, 0, 32, 24),
      height: size.height * 0.4 / 5,
      decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: const Offset(5, 10)),
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: const Offset(-5, -10))
          ],
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.navBarItems.map((item) {
          final index = widget.navBarItems.indexOf(item);
          return GestureDetector(
            onTap: () {
              widget.onItemChanged(index); // Notify parent about the change
            },
            child: NavBarItem(
              key: UniqueKey(),
              size: size,
              data: item,
              isSelected: index == widget.currentIndex,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final NavBarData data;
  final bool isSelected;
  final Size size;
  const NavBarItem({
    super.key,
    required this.data,
    required this.isSelected,
    required this.size,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _sizeAnimation = Tween<double>(
      begin: 0,
      end: widget.isSelected ? 60 : 26,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _colorAnimation = ColorTween(
            begin:
                widget.isSelected ? Colors.white : Colors.black.withOpacity(.1),
            end: widget.isSelected ? Colors.white : Colors.white)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * .15,
      height: widget.size.height * .1,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: _sizeAnimation.value,
              width: _sizeAnimation.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _colorAnimation.value,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              widget.data.icon,
              size: widget.size.height * .03,
              color: widget.isSelected ? Colors.deepOrange : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class NavBarData {
  final String? iconPath;
  final IconData? icon;

  NavBarData({this.iconPath, this.icon}) {
    assert(icon != null || iconPath != null, "Icon or path must be provided");
  }
}
