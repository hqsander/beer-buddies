import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;

  const StarRating({
    @required this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
  });

  @override
  Widget build(BuildContext context) {
    final size = 36.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: onChanged != null
              ? () {
                  onChanged(index + 1);
                }
              : null,
          color: index < value ? Colors.amber : Colors.amber.shade100,
          iconSize: size,
          icon: Icon(
            index < value //
                ? filledStar ?? Icons.star
                : unfilledStar ?? Icons.star_border,
          ),
          padding: EdgeInsets.zero,
          tooltip: '${index + 1} de 5',
        );
      }),
    );
  }
}
