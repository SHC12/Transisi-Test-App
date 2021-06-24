part of 'shared.dart';

const double defaultMargin = 24;
const animationDuration = Duration(milliseconds: 200);

Color blackPrimary = Color(0xFF323232);
Color whitePrimary = Color(0xFFFFFFFF);
Color bluePrimary = Color(0xFF74D9D4);
Color accentColor2 = Color(0xFFADADAD);
Color accentColor1 = Color(0xFFFFC727);
Color accentColor3 = Color(0xFFE62525);

TextStyle blackTextFont = GoogleFonts.quicksand()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w400);
TextStyle whiteTextFont = GoogleFonts.quicksand()
    .copyWith(color: whitePrimary, fontWeight: FontWeight.w400);
TextStyle blueTextFont = GoogleFonts.quicksand()
    .copyWith(color: bluePrimary, fontWeight: FontWeight.w400);
TextStyle greyTextFont = GoogleFonts.quicksand()
    .copyWith(color: accentColor2, fontWeight: FontWeight.w400);
