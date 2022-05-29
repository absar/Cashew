import 'package:budget/widgets/tappable.dart';
import 'package:flutter/material.dart';
import 'package:budget/colors.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

// Set snap to false if there is a keyboard
openBottomSheet(context, child, {bool maxHeight: true, bool snap: true}) {
  //minimize keyboard when open
  FocusScope.of(context).unfocus();
  showSlidingBottomSheet(context,
      resizeToAvoidBottomInset: true,
      bottomPaddingColor: Theme.of(context).colorScheme.lightDarkAccent,
      builder: (context) {
    return SlidingSheetDialog(
      elevation: 8,
      isBackdropInteractable: true,
      dismissOnBackdropTap: true,
      snapSpec: SnapSpec(
        snap: snap,
        snappings: [
          0.6,
          1 -
              MediaQuery.of(context).padding.top /
                  MediaQuery.of(context).size.height
        ],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      color: Theme.of(context).colorScheme.lightDarkAccent,
      // headerBuilder: (context, _) {
      //   if (handle) {
      //     return Padding(
      //       padding: const EdgeInsets.only(bottom: 5.0),
      //       child: Container(
      //         width: 40,
      //         height: 5,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(100),
      //           color: Theme.of(context)
      //               .colorScheme
      //               .lightDarkAccent
      //               .withOpacity(0.5),
      //         ),
      //       ),
      //     );
      //   } else {
      //     return SizedBox();
      //   }
      // },
      cornerRadius: 20,
      duration: Duration(milliseconds: 300),
      builder: (context, state) {
        return Material(
          child: SingleChildScrollView(
            child: child,
          ),
        );
      },
    );
  });
}

// openBottomSheetWithKeyboard(context, child,
//     {bool maxHeight: true, bool handle: true}) {
//   //minimize keyboard when open
//   FocusScope.of(context).unfocus();
//   showModalBottomSheet(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16),
//     ),
//     isScrollControlled: true,
//     isDismissible: false,
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (contextBuilder) {
//       return Padding(
//         padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//         child: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(contextBuilder).viewInsets.bottom,
//               ),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.lightDarkAccent,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   topLeft: Radius.circular(20),
//                 ),
//               ),
//               child: child,
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }