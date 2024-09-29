import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SearchField()),
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          hintStyle: const TextStyle(color: Color(0xFF757575)),
          fillColor: const Color(0xFF979797).withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          hintText: "Search places",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class IconBtnWithCounter extends StatefulWidget {
  const IconBtnWithCounter(
      {super.key,
      required this.svgSrc,
      required this.numOfitem,
      required this.press});

  @override
  State<IconBtnWithCounter> createState() => _IconBtnWithCounterState();

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;
}

class _IconBtnWithCounterState extends State<IconBtnWithCounter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: widget.press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF979797).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(widget.svgSrc),
          ),
          if (widget.numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$widget.numOfitem",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
