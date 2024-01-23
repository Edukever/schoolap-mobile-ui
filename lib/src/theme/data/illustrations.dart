import 'package:equatable/equatable.dart';

enum IllustrationType { image, svg }

class Illustration extends Equatable {
  final String path;
  final IllustrationType type;

  const Illustration({
    required this.path,
    required this.type,
  });

  @override
  List<Object?> get props => [path, type];
}

class AppIllustrations {
  const AppIllustrations._();

  static const Illustration emptyBox = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_box.png',
    type: IllustrationType.image,
  );
  static const Illustration emptyClass = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_class.png',
    type: IllustrationType.image,
  );
  static const Illustration emptyCourse = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_course.png',
    type: IllustrationType.image,
  );
  static const Illustration emptyPayment = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_payment.png',
    type: IllustrationType.image,
  );
  static const Illustration emptyPerson = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_person.png',
    type: IllustrationType.image,
  );
  static const Illustration emptyStudent = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_student.png',
    type: IllustrationType.image,
  );
  static const Illustration emptyTrophies = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/empty_trophies.png',
    type: IllustrationType.image,
  );
  static const Illustration fromFile = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/from_file.png',
    type: IllustrationType.image,
  );
  static const Illustration happyPeople = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/happy_people.png',
    type: IllustrationType.image,
  );
  static const Illustration startFromZero = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/start_from_zero.png',
    type: IllustrationType.image,
  );
  static const Illustration welcome = Illustration(
    path: 'packages/schoolap_ui/assets/images/illustrations/welcome.png',
    type: IllustrationType.image,
  );
}
