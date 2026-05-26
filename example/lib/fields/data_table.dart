import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import '../widgets/code_preview.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Data model
// ─────────────────────────────────────────────────────────────────────────────

enum AttendanceStatus { present, absent, late }

extension on AttendanceStatus {
  String get label => switch (this) {
        AttendanceStatus.present => 'Présent',
        AttendanceStatus.absent => 'Absent',
        AttendanceStatus.late => 'En retard',
      };

  Color get color => switch (this) {
        AttendanceStatus.present => const Color(0xFF1EA951),
        AttendanceStatus.absent => const Color(0xFFFF4F4F),
        AttendanceStatus.late => const Color(0xFFF5A623),
      };
}

class Student {
  const Student({
    required this.name,
    required this.subject,
    required this.score,
    required this.status,
  });

  final String name;
  final String subject;
  final int score;
  final AttendanceStatus status;

  String get grade {
    if (score >= 90) return 'A';
    if (score >= 80) return 'B';
    if (score >= 70) return 'C';
    if (score >= 60) return 'D';
    return 'F';
  }
}

const _students = [
  Student(name: 'Alice Martin', subject: 'Mathématiques', score: 94, status: AttendanceStatus.present),
  Student(name: 'Bruno Diallo', subject: 'Sciences', score: 78, status: AttendanceStatus.absent),
  Student(name: 'Chloé Nguyen', subject: 'Histoire', score: 85, status: AttendanceStatus.present),
  Student(name: 'David Osei', subject: 'Anglais', score: 62, status: AttendanceStatus.late),
  Student(name: 'Emma Leclerc', subject: 'Physique', score: 91, status: AttendanceStatus.present),
  Student(name: 'Farid Koné', subject: 'Chimie', score: 55, status: AttendanceStatus.absent),
  Student(name: 'Grace Mbeki', subject: 'Géographie', score: 88, status: AttendanceStatus.present),
  Student(name: 'Hugo Bernard', subject: 'Biologie', score: 73, status: AttendanceStatus.late),
  Student(name: 'Inès Touré', subject: 'Informatique', score: 97, status: AttendanceStatus.present),
  Student(name: 'Jonas Dupont', subject: 'Arts', score: 69, status: AttendanceStatus.present),
  Student(name: 'Kenza Amara', subject: 'Musique', score: 83, status: AttendanceStatus.present),
  Student(name: 'Lamine Bah', subject: 'Sport', score: 76, status: AttendanceStatus.absent),
];

// ─────────────────────────────────────────────────────────────────────────────
// Page
// ─────────────────────────────────────────────────────────────────────────────

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  // Selection use-case state
  List<Student> _selected = [];

  // Pagination use-case state
  int _page = 1;
  static const _pageSize = 4;

  List<Student> get _pageRows {
    final start = (_page - 1) * _pageSize;
    return _students.skip(start).take(_pageSize).toList();
  }

  int get _totalPages => (_students.length / _pageSize).ceil();

  // ── Shared column definitions ───────────────────────────────────────────────

  SPDataTableColumn<Student> get _nameCol => SPDataTableColumn(
        headerText: 'Élève',
        cellText: (s, _) => s.name,
        width: 140,
      );

  SPDataTableColumn<Student> get _subjectCol => SPDataTableColumn(
        headerText: 'Matière',
        cellText: (s, _) => s.subject,
        width: 120,
      );

  SPDataTableColumn<Student> get _scoreCol => SPDataTableColumn(
        headerText: 'Note',
        cellText: (s, _) => '${s.score}/100',
        textAlign: TextAlign.center,
        width: 80,
      );

  SPDataTableColumn<Student> get _gradeCol => SPDataTableColumn(
        headerText: 'Mention',
        cellText: (s, _) => s.grade,
        textAlign: TextAlign.center,
        width: 70,
      );

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: SPAppBar('SPDataTable'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(theme.spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Basic ────────────────────────────────────────────────────
            _Section(
              label: 'Basique',
              description: 'Colonnes texte simples, sans interaction.',
              child: CodePreview(
                code: r'''
SPDataTable<Student>(
  columns: [
    SPDataTableColumn(
      headerText: 'Élève',
      cellText: (s, _) => s.name,
      width: 140,
    ),
    SPDataTableColumn(
      headerText: 'Matière',
      cellText: (s, _) => s.subject,
      width: 120,
    ),
    SPDataTableColumn(
      headerText: 'Note',
      cellText: (s, _) => '${s.score}/100',
      textAlign: TextAlign.center,
      width: 80,
    ),
    SPDataTableColumn(
      headerText: 'Mention',
      cellText: (s, _) => s.grade,
      textAlign: TextAlign.center,
      width: 70,
    ),
  ],
  rows: students,
  emptyBuilder: (context) => Center(child: Text('Aucun élève')),
)''',
                child: _TableBox(
                  child: SPDataTable<Student>(
                    columns: [_nameCol, _subjectCol, _scoreCol, _gradeCol],
                    rows: _students.take(5).toList(),
                    emptyBuilder: _emptyState,
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 2. Sortable ─────────────────────────────────────────────────
            _Section(
              label: 'Colonnes triables',
              description: 'Appuyer sur un en-tête pour trier la colonne.',
              child: CodePreview(
                code: r'''
SPDataTable<Student>(
  columns: [
    SPDataTableColumn(
      headerText: 'Élève',
      cellText: (s, _) => s.name,
      width: 140,
      sortable: true,
      sort: (a, b, asc) =>
          asc ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
    ),
    SPDataTableColumn(
      headerText: 'Matière',
      cellText: (s, _) => s.subject,
      width: 120,
      sortable: true,
      // sort omitted → default alphabetical comparison on cellText
    ),
    SPDataTableColumn(
      headerText: 'Note',
      cellText: (s, _) => '${s.score}/100',
      textAlign: TextAlign.center,
      width: 80,
      sortable: true,
      sort: (a, b, asc) =>
          asc ? a.score - b.score : b.score - a.score,
    ),
    SPDataTableColumn(
      headerText: 'Mention',
      cellText: (s, _) => s.grade,
      textAlign: TextAlign.center,
      width: 70,
      sortable: true,
    ),
  ],
  rows: students,
  emptyBuilder: emptyBuilder,
)''',
                child: _TableBox(
                  child: SPDataTable<Student>(
                    columns: [
                      SPDataTableColumn(
                        headerText: 'Élève',
                        cellText: (s, _) => s.name,
                        width: 140,
                        sortable: true,
                        sort: (a, b, asc) => asc
                            ? a.name.compareTo(b.name)
                            : b.name.compareTo(a.name),
                      ),
                      SPDataTableColumn(
                        headerText: 'Matière',
                        cellText: (s, _) => s.subject,
                        width: 120,
                        sortable: true,
                      ),
                      SPDataTableColumn(
                        headerText: 'Note',
                        cellText: (s, _) => '${s.score}/100',
                        textAlign: TextAlign.center,
                        width: 80,
                        sortable: true,
                        sort: (a, b, asc) =>
                            asc ? a.score - b.score : b.score - a.score,
                      ),
                      SPDataTableColumn(
                        headerText: 'Mention',
                        cellText: (s, _) => s.grade,
                        textAlign: TextAlign.center,
                        width: 70,
                        sortable: true,
                      ),
                    ],
                    rows: _students.take(5).toList(),
                    emptyBuilder: _emptyState,
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 3. Custom cell builders ─────────────────────────────────────
            _Section(
              label: 'Cellules personnalisées',
              description: 'cellBuilder pour afficher des badges de statut et des indicateurs de note.',
              child: CodePreview(
                code: r'''
SPDataTable<Student>(
  columns: [
    SPDataTableColumn(
      headerText: 'Note',
      cellText: (s, _) => '${s.score}',
      textAlign: TextAlign.center,
      width: 80,
      // cellBuilder overrides the default text cell
      cellBuilder: (s, _) => ScoreBar(score: s.score),
    ),
    SPDataTableColumn(
      headerText: 'Présence',
      cellText: (s, _) => s.status.label,
      textAlign: TextAlign.center,
      width: 110,
      cellBuilder: (s, _) => StatusBadge(status: s.status),
    ),
  ],
  rows: students,
  emptyBuilder: emptyBuilder,
)''',
                child: _TableBox(
                  child: SPDataTable<Student>(
                    columns: [
                      _nameCol,
                      _subjectCol,
                      SPDataTableColumn(
                        headerText: 'Note',
                        cellText: (s, _) => '${s.score}',
                        textAlign: TextAlign.center,
                        width: 80,
                        cellBuilder: (s, _) => _ScoreBar(score: s.score),
                      ),
                      SPDataTableColumn(
                        headerText: 'Présence',
                        cellText: (s, _) => s.status.label,
                        textAlign: TextAlign.center,
                        width: 110,
                        cellBuilder: (s, _) => _StatusBadge(status: s.status),
                      ),
                    ],
                    rows: _students.take(6).toList(),
                    emptyBuilder: _emptyState,
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 4. Row tap ──────────────────────────────────────────────────
            _Section(
              label: 'Tap sur ligne',
              description: 'onRowTap reçoit l\'élément de la ligne tapée.',
              child: CodePreview(
                code: r'''
SPDataTable<Student>(
  columns: [...],
  rows: students,
  emptyBuilder: emptyBuilder,
  onRowTap: (student) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${student.name} — ${student.score}/100'),
        duration: Duration(seconds: 2),
      ),
    );
  },
)''',
                child: _TableBox(
                  child: SPDataTable<Student>(
                    columns: [_nameCol, _subjectCol, _scoreCol],
                    rows: _students.take(5).toList(),
                    emptyBuilder: _emptyState,
                    onRowTap: (student) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${student.name} — ${student.subject} : ${student.score}/100'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 5. Selection ────────────────────────────────────────────────
            _Section(
              label: 'Sélection',
              description: '${_selected.length} élève(s) sélectionné(s).',
              child: CodePreview(
                code: r'''
// State
List<Student> _selected = [];

// Widget
SPDataTable<Student>(
  columns: [...],
  rows: students,
  emptyBuilder: emptyBuilder,
  showCheckboxColumn: true,
  selection: SPDataTableSelection(
    selectedRows: _selected,
    onSelectChanged: (checked, student) {
      setState(() {
        if (checked == true) {
          _selected = [..._selected, student];
        } else {
          _selected = _selected.where((s) => s != student).toList();
        }
      });
    },
    onSelectAll: (checked) => setState(() {
      _selected = checked == true ? students : [];
    }),
  ),
)''',
                child: _TableBox(
                  child: SPDataTable<Student>(
                    columns: [_nameCol, _subjectCol, _scoreCol, _gradeCol],
                    rows: _students.take(6).toList(),
                    emptyBuilder: _emptyState,
                    showCheckboxColumn: true,
                    selection: SPDataTableSelection(
                      selectedRows: _selected,
                      onSelectChanged: (checked, student) => setState(() {
                        if (checked == true) {
                          _selected = [..._selected, student];
                        } else {
                          _selected = _selected.where((s) => s != student).toList();
                        }
                      }),
                      onSelectAll: (checked) => setState(() {
                        _selected = checked == true
                            ? _students.take(6).toList()
                            : [];
                      }),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 6. Custom style ─────────────────────────────────────────────
            _Section(
              label: 'Style personnalisé',
              description: 'SPDataTableStyle pour modifier couleurs et dimensions.',
              child: CodePreview(
                code: '''
SPDataTable<Student>(
  columns: [...],
  rows: students,
  emptyBuilder: emptyBuilder,
  style: SPDataTableStyle(
    headingRowColor: WidgetStatePropertyAll(Color(0xFF1EA951)),
    headingRowHeight: 44,
    dataRowColor: WidgetStatePropertyAll(Color(0xFFF0FFF4)),
    dataRowMinHeight: 14,
    dataRowMaxHeight: 44,
    showBottomBorder: true,
  ),
)''',
                child: _TableBox(
                  child: SPDataTable<Student>(
                    columns: [_nameCol, _subjectCol, _scoreCol],
                    rows: _students.take(5).toList(),
                    emptyBuilder: _emptyState,
                    style: const SPDataTableStyle(
                      headingRowColor: WidgetStatePropertyAll(Color(0xFF1EA951)),
                      headingRowHeight: 44,
                      dataRowColor: WidgetStatePropertyAll(Color(0xFFF0FFF4)),
                      dataRowMinHeight: 14,
                      dataRowMaxHeight: 44,
                      showBottomBorder: true,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 7. Empty state ──────────────────────────────────────────────
            _Section(
              label: 'État vide',
              description: 'emptyBuilder affiché quand rows est vide.',
              child: CodePreview(
                code: '''
SPDataTable<Student>(
  columns: [...],
  rows: const [],
  emptyBuilder: (context) => Padding(
    padding: const EdgeInsets.all(32),
    child: Column(
      children: [
        Icon(Icons.inbox_outlined, size: 48),
        SizedBox(height: 8),
        Text('Aucun élève à afficher'),
      ],
    ),
  ),
)''',
                child: _TableBox(
                  height: 180,
                  child: SPDataTable<Student>(
                    columns: [_nameCol, _subjectCol, _scoreCol],
                    rows: const [],
                    emptyBuilder: _emptyState,
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            // ── 8. Paginated ────────────────────────────────────────────────
            _Section(
              label: 'Avec pagination',
              description: '$_pageSize élèves par page · page $_page / $_totalPages',
              child: CodePreview(
                code: r'''
// State
int _page = 1;
static const _pageSize = 4;

List<T> get _pageRows {
  final start = (_page - 1) * _pageSize;
  return rows.skip(start).take(_pageSize).toList();
}

int get _totalPages => (rows.length / _pageSize).ceil();

// Widget
Column(
  children: [
    SPDataTable<Student>(
      columns: [...],
      rows: _pageRows,
      emptyBuilder: emptyBuilder,
    ),
    SizedBox(height: 12),
    SPPagination(
      currentPage: _page,
      totalPages: _totalPages,
      onPageChanged: (p) => setState(() => _page = p),
    ),
  ],
)''',
                child: Column(
                  children: [
                    _TableBox(
                      child: SPDataTable<Student>(
                        columns: [_nameCol, _subjectCol, _scoreCol, _gradeCol],
                        rows: _pageRows,
                        emptyBuilder: _emptyState,
                      ),
                    ),
                    SizedBox(height: theme.spacing.medium),
                    SPPagination(
                      currentPage: _page,
                      totalPages: _totalPages,
                      onPageChanged: (p) => setState(() => _page = p),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: theme.spacing.extraLarge),
          ],
        ),
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.spacing.large),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 48, color: theme.colors.gray2),
          SizedBox(height: theme.spacing.small),
          SPText.paragraph1(
            'Aucun élève à afficher',
            style: TextStyle(color: theme.colors.gray2),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Custom cell widgets
// ─────────────────────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});
  final AttendanceStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: status.color.withAlpha(30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: status.color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class _ScoreBar extends StatelessWidget {
  const _ScoreBar({required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    final color = score >= 80
        ? const Color(0xFF1EA951)
        : score >= 60
            ? const Color(0xFFF5A623)
            : const Color(0xFFFF4F4F);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 6,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: color.withAlpha(40),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            widthFactor: score / 100,
            alignment: Alignment.centerLeft,
            child: Container(color: color),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$score',
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Layout helpers
// ─────────────────────────────────────────────────────────────────────────────

class _TableBox extends StatelessWidget {
  const _TableBox({required this.child, this.height = 230});
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.gray2.withAlpha(50)),
        borderRadius: theme.radius.asBorderRadius().medium,
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.label,
    required this.description,
    required this.child,
  });

  final String label;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPText.label(
          label.toUpperCase(),
          style: TextStyle(color: theme.colors.gray2, letterSpacing: 1.1),
        ),
        SizedBox(height: theme.spacing.extraSmall),
        SPText.paragraph2(
          description,
          style: TextStyle(color: theme.colors.gray2),
        ),
        SizedBox(height: theme.spacing.small),
        child,
      ],
    );
  }
}
