import 'dart:async';
import 'dart:convert';

import 'package:baru_nih/models/application/errors.dart';
import 'package:baru_nih/models/application/tunkin.dart';
import 'package:baru_nih/providers/auth.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import './index.dart';

class TunkinBloc extends Bloc<TunkinBlocEvent, TunkinBlocState> {
  final Auth auth = new Auth();
  TunkinBloc();

  @override
  Stream<TunkinBlocEvent> transform(Stream<TunkinBlocEvent> events) {
    return (events as Observable<TunkinBlocEvent>)
        .debounce(Duration(milliseconds: 000));
  }

  @override
  get initialState => TunkinUninitialized();

  @override
  Stream<TunkinBlocState> mapEventToState(currentState, event) async* {
    if (event is TunkinFetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is TunkinUninitialized) {
          final dataList = await _fetchData();
          yield TunkinDataLoaded(
              dataList: dataList, hasReachedMax: true, nextPage: 1);
        }
      } catch (err) {
        yield TunkinDataError(dataError: err);
      }
    } else if (event is TunkinUpdate) {
      try {
        final dataList = await _fetchData();
        yield TunkinDataLoaded(
            dataList: dataList, hasReachedMax: false, nextPage: 1);
      } catch (err) {
        yield TunkinDataError(dataError: err);
      }
    }
  }

  bool _hasReachedMax(TunkinBlocState state) =>
      state is TunkinDataLoaded && state.hasReachedMax;

  Future<Tunkin> _fetchData() async {
    var _url = BASE_URL + '/api/tunkin';
    print('[D] TunkinBloc { function: _fetchData , url GET: $_url }');

    var client = new http.Client();

    try {
      final response = await client.get(
        _url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + await auth.getToken()
        },
      );
      if (response.statusCode == 200) {
        // print(response.body);
        final data = json.decode(response.body);
        return Tunkin.fromJson(data);
      } else {
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
