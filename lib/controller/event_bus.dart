import 'package:event_bus/event_bus.dart';

final EventBus eventBus = EventBus();

class DBEvent {
  String eventName;
  String keyword;
  DBEvent(this.eventName, this.keyword);
}