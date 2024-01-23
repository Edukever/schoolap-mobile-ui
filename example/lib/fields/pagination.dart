import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class PaginationPage extends StatefulWidget {
  const PaginationPage({super.key});

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const SPAppBar(
        title: 'Pagination',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            SPPagination(
              currentPage: page,
              totalPages: 11,
              onPageChanged: (page) => setState(() => this.page = page),
            ),
          ],
        ),
      ),
    );
  }
}
