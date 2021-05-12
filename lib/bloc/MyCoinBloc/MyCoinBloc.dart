import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:crypto_app/bloc/MyCoinBloc/MyCoinEvents.dart';
import 'package:crypto_app/bloc/MyCoinBloc/MyCoinState.dart';
import 'package:crypto_app/models/my_coin_list_item_model.dart';
import 'package:crypto_app/repositories/NetworkRepository.dart';

class MyCoinBloc extends Bloc<MyCoinEvents, CoinState> {
  MyCoinBloc() : super(MyCoinStateInitialState());

  @override
  Stream<CoinState> mapEventToState(MyCoinEvents event) async* {
    if (event is MyCoinEventList) {
      yield* _fetchMyCoins(event.ids, event.filterList);
    } else if(event is MyCoinSearchFilter){
      yield* _filterSearch(event.filterText);
    }
  }

  Stream<CoinState> _fetchMyCoins(String ids, String filterList) async* {

    yield CoinLoadingState();

    var connectionResult = Connectivity().checkConnectivity();

    // ignore: unrelated_type_equality_checks
    if (connectionResult == ConnectivityResult.none)
      yield CoinErrorState("No internet");
    else {
      var res = await NetworkRepository().getMyCoinData(ids, "inr", filterList);
      if (res.statusCode == 200) {
        try {
          var coinList = List<MyCoinListItemModel>.from(
            res.data.map(
              (e) {
                return MyCoinListItemModel.fromJson(e);
              },
            ),
          );
          globalList = coinList;
          yield MyCoinListState(coinList);
        } catch (e) {
          print("NetworkRepo: Error-> ${e.toString()}");
          yield CoinErrorState(e.toString());
        }
      } else {
        yield CoinErrorState(res.statusMessage ?? "Something went wrong");
      }
    }

  }


  Stream<CoinState> _filterSearch(String filterText) async* {
    if(filterText.isEmpty){
      yield MyCoinListState(globalList);
    } else {
      yield MyCoinListState(globalList?.where((e) => e.name.contains(filterText))?.toList());
    }
  }


}
