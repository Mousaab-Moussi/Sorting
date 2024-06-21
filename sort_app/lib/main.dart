import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Sort',
      home: Sorting(),
    );
  }
}

class Sorting extends StatefulWidget {
  @override
  SortingState createState() => SortingState();
}

class SortingState extends State<Sorting> {
  List<int> numbers = [22, 84, 5, 73, 10];
  List<int> arr = [53, 8, 17, 24, 3]; //new here
  List<int>? sortedNumbers;
  List<int>? sor;

  void sortNumbers() {
    setState(() {
      sortedNumbers = List.from(numbers);
      applysort(sortedNumbers!);
    });
  }

  void quickSort() {
    setState(() {
      sor = List.from(arr);
      int n = arr.length;
      quickSort1(sor!, 0, n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorting Arrays'),
        backgroundColor: Color.fromARGB(255, 210, 131, 12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ${numbers.join(', ')}',
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 213, 141, 35),
                      textStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                      )),
                  onPressed: sortNumbers,
                  child: Text('Sort Numbers'),
                ),
              ],
            ),
            Row(
              children: [
                if (sortedNumbers != null)
                  Text(
                    '${sortedNumbers!.join(', ')}',
                    style: TextStyle(fontSize: 18),
                  ),
              ],
            ), //new here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ${arr.join(', ')}',
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 213, 141, 35),
                      textStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                      )),
                  onPressed: quickSort,
                  child: Text('Quick Sort'),
                ),
              ],
            ),
            Row(
              children: [
                if (sor != null)
                  Text(
                    '${sor!.join(', ')}',
                    style: TextStyle(fontSize: 18),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void applysort(List<int> element) {
  int lengthoflist = element.length;
  int min;
  int keep = 0;
  for (int index = 0; index < lengthoflist - 1; index++) {
    min = element[index];
    keep = index;
    for (int secondinex = index + 1; secondinex < lengthoflist; secondinex++) {
      if (element[secondinex] < min) {
        min = element[secondinex];
        keep = secondinex;
      }
    }

    int changing = element[index];
    element[index] = element[keep];
    element[keep] = changing;
  }
}

int partition1(List<int> arr, int l, int h) {
  int p = arr[l];
  int i = l;
  int j = h;

  while (i < j) {
    do {
      i++;
    } while (i < arr.length && arr[i] <= p); // Added boundary check for i

    do {
      j--;
    } while (arr[j] > p);

    if (i < j) {
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[l];
  arr[l] = arr[j];
  arr[j] = temp;
  return j;
}

void quickSort1(List<int> arr, int l, int h) {
  if (l < h) {
    int piv = partition1(arr, l, h);
    quickSort1(arr, l, piv);
    quickSort1(arr, piv + 1, h);
  }
}
