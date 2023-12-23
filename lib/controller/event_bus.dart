import 'package:event_bus/event_bus.dart';

final EventBus eventBus = EventBus();

class DBEvent {
  String eventName;
  DBEvent(this.eventName);
}