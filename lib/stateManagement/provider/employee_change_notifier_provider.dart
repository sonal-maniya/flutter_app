// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Employee {
  final String name;
  final double salary;

  const Employee({
    required this.name,
    required this.salary,
  });

  Employee copyWith({
    String? name,
    double? salary,
  }) {
    return Employee(
      name: name ?? this.name,
      salary: salary ?? this.salary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'salary': salary,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      name: map['name'] as String,
      salary: map['salary'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Employee(name: $name, salary: $salary)';

  @override
  bool operator ==(covariant Employee other) {
    if (identical(this, other)) return true;

    return other.name == name && other.salary == salary;
  }

  @override
  int get hashCode => name.hashCode ^ salary.hashCode;
}

class EmployeeChangeNotifier extends ChangeNotifier {
  Employee employee = const Employee(name: "Raj", salary: 56000);

  void updateEmployeeSalary(double salary) {
    employee = employee.copyWith(salary: salary);
    notifyListeners();
  }
}
