import 'package:rxdart/rxdart.dart';
import 'package:vinayakply/api/repo/modal.dart';
import 'package:vinayakply/api/repo/repo.dart';

class HomeBloc {
  HomeRepo _homeRepo = HomeRepo();
  final BehaviorSubject<CartModal> _liveSlider = BehaviorSubject<CartModal>();
  BehaviorSubject<CartModal> get getCartModal => _liveSlider;
  fetchSlider() async {
    try {
      CartModal homeSlider = await _homeRepo.fetchCart();
      // print(homeSlider.imgs!.length);

      _liveSlider.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }
}

final homeBloc = HomeBloc();
