import 'package:flutter/material.dart';

class RoiCalculatorPage extends StatefulWidget {
  const RoiCalculatorPage({super.key});

  @override
  State<RoiCalculatorPage> createState() => _RoiCalculatorPageState();
}

class _RoiCalculatorPageState extends State<RoiCalculatorPage> {
  String groupValue = 'Yes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ROI Calculator"),
      ),
      body: Container(
        height: 500,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Invested Amount:'),
                const Spacer(),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Returned Amount:'),
                const Spacer(),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Radio(
                    value: 'useDates',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                const Text('Use Dates'),
                const Spacer(),
                Radio(
                    value: 'useLength',
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
                const Text('Use Length'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (groupValue) {
      case 'useDates':
        return _useDate();
      case 'useLength':
        return _useLength();
      default:
        return const Text('Select an option');
    }
  }

  Widget _useDate() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Text('From:'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Text('01/07/2024'),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('To:'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Text('01/02/2024'),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Calculate'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  minimumSize: WidgetStateProperty.all(
                    const Size(100, 30),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Clear'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  minimumSize: WidgetStateProperty.all(
                    const Size(100, 30),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Row(
              children: [
                const Text('ROI'),
                const Spacer(),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

//********************************************* */
//todo
//todo
//todo
//todo
//todo
//todo
//todo
  Widget _useLength() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Text('From:'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Text('01/07/2024'),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Calculate'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  minimumSize: WidgetStateProperty.all(
                    const Size(100, 30),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Clear'),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                  minimumSize: WidgetStateProperty.all(
                    const Size(100, 30),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            child: Row(
              children: [
                const Text('ROI'),
                const Spacer(),
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
