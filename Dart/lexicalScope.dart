var globalVar = true;

void main(List<String> args) {
  var insideMain = true;

  void functionSaya() {
    var insideFunction = true;

    void nestedFunction() {
      bool nestedFunctionVar = true;

      assert(globalVar);
      assert(insideMain);
      assert(nestedFunctionVar);
    }
  }
}
