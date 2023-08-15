import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../themes/constants.dart';

List<SingleChildWidget> providers = [
 ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
];