import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sky_scrapper/controller/api_helper.dart';

import '../modal/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade800,
                  Colors.purple,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                onFieldSubmitted: (value) {
                  controller.text = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter city",
                ),
                controller: controller,
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/1.png",
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: FutureBuilder(
                  future: get(
                    Uri.parse(
                      "https://api.openweathermap.org/data/2.5/weather?appid=5664ce1fe43335490a274cdc890bd519&q=${controller.text}",
                    ),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      ApiModel mdata =
                          apiModelFromJson(snapshot.data?.body ?? "");
                      List<Weather> weather = mdata.weather ?? [];
                      return Column(
                        children: [
                          Text(
                            "${mdata.main?.temp}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${mdata.name}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${weather[0].main}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "feels_like = ${mdata.main?.feelsLike}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "temp_min = ${mdata.main?.tempMin}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "temp_max = ${mdata.main?.tempMax}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "pressure = ${mdata.main?.pressure}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "humidity = ${mdata.main?.humidity}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "sea_level = ${mdata.main?.seaLevel}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "grnd_level = ${mdata.main?.grndLevel}",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Align(
                        alignment: Alignment(0, -0.3),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}