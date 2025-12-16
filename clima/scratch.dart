void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String s = await task2();
  task3(s);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result = "___";
  // sleep(Duration(seconds: 3));
  await Future.delayed(Duration(seconds: 3), () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String s) async {
  String result = 'task 3 data';
  print('Task 3 complete with $s');
}
