abstract class HomePageContract {
  void stateManager();
}

class HomePagePresenter {
  final HomePageContract _viewContract;

  HomePagePresenter(this._viewContract);

  bool isMenuActive = false;

  void switchMenu() {
    isMenuActive = !isMenuActive;
    _viewContract.stateManager();
  }
}
