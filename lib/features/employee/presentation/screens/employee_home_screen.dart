import 'package:employee_management/core/constant/app_color.dart';
import 'package:employee_management/features/employee/presentation/screens/employee_detail_screen.dart';
import 'package:flutter/material.dart';

import 'add_employee_screen.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Padding(
            padding: const .symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search employee..',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.textWhite,
                  ),
                  child: TabBar(
                    isScrollable: false,
                    padding: .zero,
                    labelPadding: .zero,
                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    tabs: [
                      SizedBox(width: 150, child: Center(child: Text("All"))),
                      SizedBox(width: 150, child: Center(child: Text("Tech"))),
                      SizedBox(
                        width: 150,
                        child: Center(child: Text("Non-Tech")),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(child: TabBarView(children: [AllEmployee()])),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddEmployeeScreen()),
          );
        },
        child: Text("Add"),
      ),
    );
  }
}

class AllEmployee extends StatelessWidget {
  const AllEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return Card(
          elevation: 3,
          clipBehavior: .none,
          margin: .symmetric(vertical: 8, horizontal: 5),
          color: AppColors.textWhite,
          shape: RoundedRectangleBorder(borderRadius: .circular(12)),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => EmployeeDetailScreen()),
              );
            },

            child: ListTile(
              leading: CircleAvatar(),
              title: Text("Name"),
              subtitle: Text("id"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: AppColors.primaryRed),
              ),
            ),
          ),
        );
      },
    );
  }
}
