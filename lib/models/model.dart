import 'package:objectbox/objectbox.dart';

@Entity()
class Component {
  @Id()
  int id;

  String componentName;
  bool status;

  @Property(type: PropertyType.date)
  DateTime? firstReportedLeak;

  Component(this.componentName, {this.id = 0, this.status = false});

  final owner = ToOne<Owner>();

  bool setFinished() {
    status = !status;
    return status;
  }
}

@Entity()
class Owner {
  @Id()
  int id;

  String name;

  Owner(this.name, {this.id = 0});
}
