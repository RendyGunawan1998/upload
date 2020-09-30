import 'dart:async';
import 'dart:convert';

import 'package:baru_nih/models/application/data_gaji.dart';
import 'package:baru_nih/models/application/errors.dart';
import 'package:baru_nih/providers/auth.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import './index.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final Auth auth = new Auth();
  HomeBloc();

  @override
  Stream<HomeBlocEvent> transform(Stream<HomeBlocEvent> events) {
    return (events as Observable<HomeBlocEvent>)
        .debounce(Duration(milliseconds: 000));
  }

  @override
  get initialState => HomeUninitialized();

  @override
  Stream<HomeBlocState> mapEventToState(currentState, event) async* {
    if (event is HomeFetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is HomeUninitialized) {
          final dataList = await _fetchData(event.bulanTahun);
          //=========throw ke block state=======
          yield HomeDataLoaded(
              dataList: dataList, hasReachedMax: true, nextPage: 1);
        }
      } catch (err) {
        //=========throw ke block state=======
        yield HomeDataError(dataError: err);
      }
    } else if (event is HomeUpdate) {
      try {
        yield HomeUninitialized();
        final dataList = await _fetchData(event.bulanTahun);
        yield HomeDataLoaded(
            dataList: dataList, hasReachedMax: false, nextPage: 1);
      } catch (err) {
        yield HomeDataError(dataError: err);
      }
    }
  }

  bool _hasReachedMax(HomeBlocState state) =>
      state is HomeDataLoaded && state.hasReachedMax;

  Future<DataGaji> _fetchData(String bulanTahun) async {
    var _url = BASE_URL + '/api/gaji?bulantahun=' + bulanTahun;
    print('[D] HomeBloc { function: _fetchData , url GET: $_url }');

    var client = new http.Client();

    try {
      //====================== USER INFO? =======================
      final response = await client.get(
        _url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + await auth.getToken()
        },
      );
      //====================== Show Gaji? =======================
      if (response.statusCode == 200) {
        // print(response.body);
        final data = json.decode(response.body);
        return DataGaji.fromJson(data);
      } else {
        //====================== ERROR =======================
        print(response.body);
        // throw Exception('error fetching data');
        throw ErrorModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      throw e;
    } finally {
      client.close();
    }
  }
}
