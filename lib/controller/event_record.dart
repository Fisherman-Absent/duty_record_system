import 'package:event_bus/event_bus.dart';
// import 'package:event_record/event_record.dart';

// final EventRecord eventBus = EventRecord();
final EventBus eventBus = EventBus();

class DBEvent {
  String eventName;
  String keyword_Name;
  String keyword_date;
  DBEvent(this.eventName, this.keyword_Name, this.keyword_date);
}