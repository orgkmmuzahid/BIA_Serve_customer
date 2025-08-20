// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class HomeStates extends Equatable {
  const HomeStates({required this.banners, this.currentNavigatonPage = 0, this.currentBannerIndex = 0});

  final List<String> banners;
  final int currentBannerIndex;
  final int currentNavigatonPage;

  @override
  List<Object> get props => [banners, currentBannerIndex, currentNavigatonPage];

  HomeStates copyWith({List<String>? banners, int? currentBannerIndex, int? currentNavigatonPage}) {
    return HomeStates(
      banners: banners ?? this.banners,
      currentBannerIndex: currentBannerIndex ?? this.currentBannerIndex,
      currentNavigatonPage: currentNavigatonPage ?? this.currentNavigatonPage,
    );
  }
}
