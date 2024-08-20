import 'package:flutter/material.dart';

class AdditionalCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: SizedBox(
        height: 170,
        child: Card(
          color: const Color.fromARGB(255, 72, 174, 255),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: 56,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Text(label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                Text('$value%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
