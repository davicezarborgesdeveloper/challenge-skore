import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skore/application/di.dart';
import 'package:skore/data/responses/responses.dart';
import 'package:skore/presentation/home/home_viewmodel.dart';
import 'package:skore/presentation/home/widgets/class_list_item.dart';
import 'package:skore/presentation/resources/assets_manager.dart';
import 'package:skore/presentation/resources/screen_manager.dart';
import 'package:skore/presentation/resources/value_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  void _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Aulas'),
        centerTitle: true,
      ),
      body: ListenableBuilder(
          listenable:
              Listenable.merge([_viewModel.state, _viewModel.listClass]),
          builder: (BuildContext context, Widget? child) {
            return _viewModel.state.value == FlowState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (_viewModel.state.value == FlowState.success
                    ? (_viewModel.listClass.value == null ||
                            _viewModel.listClass.value!.isEmpty
                        ? Center(
                            child: SizedBox(
                                width: context.screenWidth - AppPadding.p48,
                                child: SvgPicture.asset(ImageAssets.noData)),
                          )
                        : ListView.separated(
                            itemCount: _viewModel.classCount,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) {
                              Discipline discipline =
                                  _viewModel.listClass.value![index];
                              return ClassListItem(
                                  discipline: discipline,
                                  onDelete: () =>
                                      _viewModel.onDelete(discipline));
                            }))
                    : Container());
          }),
    );
  }
}
