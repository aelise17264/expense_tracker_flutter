in dart "Initializer Lists" can be used to initialize class properties (like id's) with values that are not receied as constructor function arguments

<u>Enum</u> - predefined allowed values, create a fixed set of allowd values when creating an expense to avoid errors, this will help us sort expenses later 

column might not be best widget if we have an unknown length of list items, scrollable column is an option but creating all of the unseen list items is redundant and costs a lot of performance. 

<u>ListView.builder</u> - tells flutter to create a scrollable list & only create the list items when it is about to become visibile, we pass a function to the itemBuilder & it returns a widget, itemCount denotes how many list items will be created (how many times the function will be called)

<u>Getters</u> - computed properties ie properties that are dynamically delivered based on other class properties

<u>Dispose</u> - part of a StatefulWidget's lifecycle, it is called automatically by flutter when the widget & its state are about to be destroyed/removed from the UI, otherwise our controllers would live on in memory even when the widget is closed, too much memory usage can cause the app to crash

### Context 
- meta data collection managed by flutter that belongs to a specific widget related to the widget (each widget will have its own) & its position in the overall UI
- when you're in a class that extends state flutter automatically adds context property that is provided by the state parent class

### Futures
- data types
- object that wrap a value that we don't have yet but we will later
- use async/await with these functions/values

---

Comparison operators & Logical operators are used to derive boolean values
 - ==
 - \>
 - <
 - \>=
 - <=
 - !=
 - &&
 - ||
