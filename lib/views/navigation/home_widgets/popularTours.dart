import 'package:flutter/material.dart';

class PopularTours extends StatefulWidget {
  const PopularTours({super.key});

  @override
  State<PopularTours> createState() => _PopularToursState();
}

class _PopularToursState extends State<PopularTours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Most Popular Tours",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PopularToursCards(
                image: "assets/images/mazar-e-quid.jpg",
                category: "Karachi",
                placeName: "Mazar-e-Quid",
                press: () {},
              ),
              PopularToursCards(
                image: "assets/images/minar-e-pakistan.jpg",
                category: "Lahore",
                placeName: "Minar-e-Pakistan",
                press: () {},
              ),
              PopularToursCards(
                image: "assets/images/khyber-gate.jpg",
                category: "KPK",
                placeName: "Khyber Gate",
                press: () {},
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text("See more"),
        ),
      ],
    );
  }
}

class PopularToursCards extends StatelessWidget {
  const PopularToursCards({
    Key? key,
    required this.category,
    required this.image,
    required this.placeName,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final String placeName;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 210,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$placeName")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
