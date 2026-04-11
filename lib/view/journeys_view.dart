import 'package:flutter/material.dart';
import 'package:bonbagage/widget/journeys_card_widget.dart';

class JourneysView extends StatelessWidget {
  const JourneysView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    void JourneyAddDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Container(
            height: width * 0.6,
            child: Column(
              children: [
                SizedBox(height: 10),
                SizedBox(
                  width: width * 0.6,
                  child: TextField(
                    cursorColor: Colors.black45,
                    decoration: InputDecoration(
                      hintText: "start date",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: width * 0.6,
                  child: TextField(
                    cursorColor: Colors.black45,
                    decoration: InputDecoration(
                      hintText: "end date",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Отмена",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Добавить",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          CardJourneys(
            title: "Москва",
            startDate: "01.01.2026",
            endDate: "10.01.2026",
          ),
          CardJourneys(
            title: "Питер",
            startDate: "10.02.2026",
            endDate: "20.02.2026",
          ),
          CardJourneys(
            title: "Казань",
            startDate: "20.03.2026",
            endDate: "30.03.2026",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black12,
        elevation: 0,
        highlightElevation: 0,
        onPressed: () {
          JourneyAddDialog();
        },
        child: const Icon(Icons.add, color: Colors.black54, size: 25),
      ),
    );
  }
}
