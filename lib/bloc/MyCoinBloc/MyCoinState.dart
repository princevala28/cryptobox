
import 'package:crypto_app/models/my_coin_list_item_model.dart';

abstract class CoinState{}

List<MyCoinListItemModel> globalList;


// Base coin state
class CoinLoadingState extends CoinState{}


class CoinErrorState extends CoinState {
  final error;
  CoinErrorState(this.error);
}

// My coin state
class MyCoinStateInitialState extends CoinState{}

class MyCoinListState extends CoinState{
  final List<MyCoinListItemModel> myCoinList;
  MyCoinListState(this.myCoinList);
}

