import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class NavigationPage {
 static void navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.push('/HomePage');
        break;
      case 1:
        context.push('/Categories');
        break;
      case 2:
        context.push('/SubCategories');
        break;
      case 3:
        context.push('/Brands');
        break;
      case 4:
        context.push('/VariantType');
        break;
    }
  }
}
