import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/base/base_view_model.dart';
import 'package:food_furniture_app/core/enum/view_model_state.dart';
import 'package:provider/provider.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: Consumer<T>(
        builder: (context, viewModel, _) =>
            bodyWithoutScaffold(context, viewModel) ??
            Scaffold(
              appBar: appBar,
              backgroundColor: backgroundColor,
              body: viewModel.initialStateCompleted
                  ? Stack(
                      children: [
                        if (body(context, viewModel) != null)
                          body(context, viewModel)!,
                        if (viewModel.state == ViewModelState.loading)
                          Container(
                            color: Colors.black.withOpacity(.5),
                            child: const Center(
                              child: const CircularProgressIndicator(),
                            ),
                          )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              bottomNavigationBar: bottomNavigationBar(viewModel),
            ),
      ),
    );
  }

  T get viewModel;

  Widget? body(BuildContext context, T viewModel) => null;

  Widget? bodyWithoutScaffold(BuildContext context, T viewModel) =>
      null;

  PreferredSizeWidget? get appBar => null;

  Color? get backgroundColor => null;

  Widget? bottomNavigationBar(T viewModel) => null;
}
