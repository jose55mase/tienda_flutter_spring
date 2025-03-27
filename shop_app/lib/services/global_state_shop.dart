class GlobalStateShop {
  static final GlobalStateShop _instance = GlobalStateShop._internal();
  String name = '';
  int id = 0;
  String color = "";
  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory GlobalStateShop() {
    return _instance;
  }
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment         above
  // it's also private, so it can only be called in this class
  GlobalStateShop._internal() {
    // initialization logic
  }
  // rest of class as normal, for example:
  void updateName(String name) {
    this.name = name;
  }

  void updateId(int id) {
    this.id = id;
  }
}