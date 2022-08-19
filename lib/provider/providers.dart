import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:website/provider/navigation_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => NavigationProvider())
];