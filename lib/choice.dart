// Class representing a choice for a question
class Choice<T> {
  T value;

  Choice(this.value);

  String toString() => value.toString();
}
