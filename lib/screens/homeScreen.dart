import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_task_ast/models/trip.dart';

import '../services/apiService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  String _selectedCity = 'Выберите пункт отправления';
  String _selectedDestination = 'Выберите станцию назначения';
  List<Trip> trips = []; // Объявляем список поездок здесь

  

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }



  void _searchTrips() async {
    if (_selectedCity != null && _selectedDestination != null && selectedDate != null) {
      try {
        final ApiService apiService = Provider.of<ApiService>(context, listen: false);

        final List<Trip> fetchedTrips = await apiService.searchTrips(
          _selectedCity!,
          _selectedDestination!,
          '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}',
        );

        setState(() {
          trips = fetchedTrips; // Assign the fetched trips to the trips variable
        });

        print('Loaded trips: $trips');
      } catch (e) {
        print('Failed to load trips: $e');
      }
    } else {
      print('One or more parameters are null');
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание автобусов'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              DropdownButton<String>(
                value: _selectedCity,
                items: <String>[
                  'Выберите пункт отправления', // Добавлено значение по умолчанию
                  'Казань',
                  'Москва',
                  'Уфа'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                  }
                },
              ),
              SizedBox(width: 8), // Добавим пространство между раскрывающимися списками
              DropdownButton<String>(
                value: _selectedDestination,
                items: <String>[
                  'Выберите станцию назначения', // Добавлено значение по умолчанию
                  'Казань',
                  'Москва',
                  'Уфа'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedDestination = newValue;
                    });
                  }
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _selectDate(context);
              _searchTrips(); // Вызываем метод поиска поездок при выборе даты
            },
            child: Text('Выбрать дату: ${selectedDate.day}.${selectedDate.month}.${selectedDate.year}'),
          ),
          const Divider(height: 1, color: Colors.black,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              if (trips.isEmpty) // Проверяем, пуст ли список поездок
                const Center(
                  child: Text('Нет доступных поездок'), // Выводим текст, если список пуст
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final Trip trip = trips[index];
                      return ListTile(
                        title: Text('Поездка ${index + 1}'),
                        subtitle: Text('Отправление: ${trip.departureCity}, Прибытие: ${trip.destinationCity}, Дата: ${trip.date}'),
                      );
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
