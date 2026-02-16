in dart "Initializer Lists" can be used to initialize class properties (like id's) with values that are not receied as constructor function arguments

Enum - predefined allowed values, create a fixed set of allowd values when creating an expense to avoid errors, this will help us sort expenses later 

column might not be best widget if we have an unknown length of list items, scrollable column is an option but creating all of the unseen list items is redundant and costs a lot of performance. 

ListView.builder - tells flutter to create a scrollable list & only create the list items when it is about to become visibile, we pass a function to the itemBuilder & it returns a widget, itemCount denotes how many list items will be created (how many times the function will be called)