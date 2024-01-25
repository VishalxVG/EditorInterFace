import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextPaga extends HookWidget {
  const TextPaga({super.key});

  @override
  Widget build(BuildContext context) {
    final position = useState(Offset(100, 100));
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: position.value.dx,
            top: position.value.dy,
            child: Draggable(
              feedback: Icon(Icons.ice_skating),
              childWhenDragging: Opacity(
                opacity: .3,
                child: Icon(Icons.ice_skating),
              ),
              onDragEnd: (details) => position.value = details.offset,
              child: Icon(Icons.ice_skating),
            ),
          )
        ],
      ),
    );
  }
}
