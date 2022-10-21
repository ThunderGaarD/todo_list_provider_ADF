import 'package:flutter/cupertino.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_page.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _router;
  final List<SingleChildWidget>? _bindings;

  TodoListModule(
      {List<SingleChildWidget>? bindings,
      required Map<String, WidgetBuilder> router})
      : _router = router,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _router.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => TodoListPage(
          page: pageBuilder,
          bindings: _bindings,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _router[path];
    if (widgetBuilder != null) {
      return TodoListPage(
        page: widgetBuilder,
        bindings: _bindings,
      );
    }
    throw Exception();
  }
}
