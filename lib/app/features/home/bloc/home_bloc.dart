import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/app/data/crypto_data.dart';
import 'package:gweiland_flutter_task/app/features/home/model/cryptocurrency_listing_model.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  String filterSort = "Default";
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeRadioClickEvent>(homeRadioClickEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    var client = http.Client();
    var headers = {
      // 'Accept': 'application/json',
      // "Content-Type": "multipart/form-data",
      "X-CMC_PRO_API_KEY": "708693de-bb39-4c1b-8029-c87205fe8702",
    };
    try {
      var response = await client.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"),
        headers: headers,
      );
      if (response != null) {
        CryptocurrencyListingModel cryptocurrencyListingModel =
            cryptocurrencyListingModelFromJson(response.body);

        print(cryptocurrencyListingModel);
        cryptocurrencyDataList.addAll(cryptocurrencyListingModel.data!);

        emit(HomeLoadingSuccessState(
            cryptocurrencyList: cryptocurrencyListingModel.data!));
      } else {
        emit(HomeErrorState());
      }
      // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      // var uri = Uri.parse(decodedResponse['uri'] as String);
      // print(await client.get(uri));
    } finally {
      client.close();
    }
  }

  FutureOr<void> homeRadioClickEvent(
      HomeRadioClickEvent event, Emitter<HomeState> emit) {
    switch (event.filterType) {
      case "Default":
        filterSort = event.filterType;
        List<CryptocurrencyList> tempList = cryptocurrencyDataList;
        //
        emit(HomeLoadingSuccessState(cryptocurrencyList: tempList));
      case "Price High To Low":
        filterSort = event.filterType;
        CryptocurrencyList temp;
        List<CryptocurrencyList> tempList = cryptocurrencyDataList;
        for (int i = 0; i < tempList.length; i++) {
          for (int j = 1; j < tempList.length - i; j++) {
            if (tempList[j - 1].quote!.usd!.price! <
                tempList[j].quote!.usd!.price!) {
              temp = tempList[j - 1];
              tempList[j - 1] = tempList[j];
              tempList[j] = temp;
            }
          }
        }
        //
        emit(HomeLoadingSuccessState(cryptocurrencyList: tempList));
      case "Price Low To High":
        filterSort = event.filterType;
        CryptocurrencyList temp;
        List<CryptocurrencyList> tempList = cryptocurrencyDataList;
        for (int i = 0; i < tempList.length; i++) {
          for (int j = 1; j < tempList.length - i; j++) {
            if (tempList[j - 1].quote!.usd!.price! >
                tempList[j].quote!.usd!.price!) {
              temp = tempList[j - 1];
              tempList[j - 1] = tempList[j];
              tempList[j] = temp;
            }
          }
        }

        emit(HomeLoadingSuccessState(cryptocurrencyList: tempList));
      case "Volume Change High To Low":
        filterSort = event.filterType;
        CryptocurrencyList temp;
        List<CryptocurrencyList> tempList = cryptocurrencyDataList;
        for (int i = 0; i < tempList.length; i++) {
          for (int j = 1; j < tempList.length - i; j++) {
            if (tempList[j - 1].quote!.usd!.volume24H! <
                tempList[j].quote!.usd!.volume24H!) {
              temp = tempList[j - 1];
              tempList[j - 1] = tempList[j];
              tempList[j] = temp;
            }
          }
        }
        //
        emit(HomeLoadingSuccessState(cryptocurrencyList: tempList));
      case "Volume Change Low to High":
        filterSort = event.filterType;
        CryptocurrencyList temp;
        List<CryptocurrencyList> tempList = cryptocurrencyDataList;
        for (int i = 0; i < tempList.length; i++) {
          for (int j = 1; j < tempList.length - i; j++) {
            if (tempList[j - 1].quote!.usd!.volume24H! >
                tempList[j].quote!.usd!.volume24H!) {
              temp = tempList[j - 1];
              tempList[j - 1] = tempList[j];
              tempList[j] = temp;
            }
          }
        }
        //
        emit(HomeLoadingSuccessState(cryptocurrencyList: tempList));
      default:
        filterSort = "Default";
        List<CryptocurrencyList> tempList = cryptocurrencyDataList;
        //
        emit(HomeLoadingSuccessState(cryptocurrencyList: tempList));
    }
  }
}
