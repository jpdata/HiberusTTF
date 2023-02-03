import 'package:flutter/material.dart';
import 'package:hiberus_ttf/presentation/components/mtg_card_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/constants.dart';
import '../../data/data_sources/api/api_reader.dart';
import '../../domain/models/mtg_card_model.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final int _pageSize = Constants.defaultPageSize;

  Future<List<MtgCardModel>> future = Future(() => []);
  List<MtgCardModel> cards = [];
  ScrollController? controller;
  int totalRecord = 0;

  final PagingController<int, MtgCardModel> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<MtgCardModel> cardList =
          await ApiReader().getCards(page: pageKey, pageSize: _pageSize);

      final isLastPage = cardList.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(cardList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(cardList, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Image _getImage(String? url) {
    url = url ?? "";
    return url.isNotEmpty
        ? Image.network(url)
        : Image.asset("assets/images/mtgBack.jpg");
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => _pagingController.refresh()),
        child: PagedListView<int, MtgCardModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<MtgCardModel>(
            itemBuilder: (context, item, index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: MtgCardWidget(
                  name: item.name,
                  ruleText: item.ruleText,
                  image: _getImage(item.imageUrl),
                )),
          ),
        ),
      ),
    );
    // return SnackBar(
    //   content: Text(
    //       'Error undefinec action for ${snapshot.connectionState.toString()}'),
    // );
  }
}
