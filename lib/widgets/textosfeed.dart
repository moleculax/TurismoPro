import 'package:flutter/material.dart';


Row AvatarCard(String name) {
  return Row(
    children: [

      CircleAvatar( // ← WIDGET
        child: Text(
          name.isNotEmpty
              ? name.substring(0, 2).toUpperCase()
              : "??",
        ),
      ),

      const SizedBox(width: 10), // ← WIDGET

      Text( // ← WIDGET
        name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

    ],
  );
}


 Padding DescriptionCard (String texto) {
   return Padding(
    padding:  const EdgeInsets.only(left:10, right: 10, bottom: 10),
     child: Text( // ← WIDGET
       texto, // viene de objeto data.dart
       maxLines: 2,
       overflow: TextOverflow.ellipsis,
       textAlign: TextAlign.left,
       style: TextStyle(color: Colors.grey),
     ),
   );
 }// ← WIDGET

