import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


abstract class CommonRichTextContent{}

class CommonRichTextSpan extends CommonRichTextContent{
     final TextSpan textSpan;

  CommonRichTextSpan({required this.textSpan, });
}

class CommonSimpleRichTextContent extends CommonRichTextContent{
  final Function()? ontap;
  final String text;
  final TextStyle? style;

  CommonSimpleRichTextContent({required this.text, this.style, this.ontap});
}
  
class CommonRichText extends StatelessWidget {

  final List<CommonRichTextContent> richTextContent;
///usage:
  ///richTextContent: [CommonSimpleRichTextContent(text: '', style: TextStyle, ontap: (){}), 
  ///CommonRichTextSpan(textSpan : TextSpan() , ontap: (){})]
  const CommonRichText({super.key, required this.richTextContent});

  @override
  Widget build(BuildContext context) {
     return _content();
  }
  
Widget _content() {
  return Flexible(
  child: Text.rich(
    TextSpan(
      children: List.generate(richTextContent.length, (index) {
        final rContent = richTextContent[index];

        if (rContent is CommonSimpleRichTextContent) {
          final style = rContent.style ?? theme.textTheme.bodyMedium!;
          return TextSpan(
            text: rContent.text,
            style: style,
            recognizer: rContent.ontap == null
                ? null
                : (TapGestureRecognizer()..onTap = rContent.ontap),
          );
        } else if (rContent is CommonRichTextSpan) {
          return rContent.textSpan;
        } else {
          return const TextSpan(text: '');
        }
      }),
    ),
    softWrap: true,
    overflow: TextOverflow.visible,
    textAlign: TextAlign.start,
  ),
);

}

}


