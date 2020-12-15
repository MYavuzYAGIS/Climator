import 'dart:io';
import 'dart:async';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String resultTask2 = await task2();
  task3(resultTask2);
}

void task1() {
  String result = 'task 1 data';
  print("task 1 complete");
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  // This is like sleep(x) function in C. just giving some time ahead of time but we needed to create a duration object, just because!

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print("task 2 complete");
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print("task 3 complete with $task2Data");
  print("Sleeping for 3 seconds");
}
