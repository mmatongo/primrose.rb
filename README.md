# Primrose Framework Documentation

## Overview

Primrose is a Ruby library designed for building component-based web applications. It provides a collection of modules and classes to manage the state, routing, rendering, and event handling for a modern web application. Primrose offers the following key features:

- State Management using `Primrose::Store`
- Component-based UI building blocks via `Primrose::Rose` subclasses
- Routing capabilities with `Primrose::Router`
- Observable state via `Primrose::Observable`
- Built-in helper methods and utility functions
- Template-based rendering with ERB

---

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
    - [State Management](#state-management)
    - [Routing](#routing)
    - [Components](#components)
    - [Event Handling](#event-handling)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

---

## Installation

You can install the library by adding it to your `Gemfile`:

```ruby
gem 'primrose', '~> 0.0.1'
```

Then run `bundle install` to install the dependency.

---

## Usage

### State Management

```ruby
store = Primrose::Store.new({ counter: 0 })

store.dispatch({
  type: 'INCREMENT',
  updates: {
    counter: -> (current_value) { current_value + 1 }
  }
})
```

### Routing

```ruby
router = Primrose::Router.new

router.route('/home') { puts "You're at home" }
router.route('/about') { puts "About page" }

router.navigate('/home')  # Outputs "You're at home"
```

### Components

Creating a custom component is easy:

```ruby
class MyComponent < Primrose::Rose
  def render
    "Hello, world!"
  end
end
```

### Event Handling

You can attach event handlers to your components:

```ruby
component = MyComponent.new
component.on(:click) { puts 'Component clicked!' }
component.trigger(:click)  # Outputs "Component clicked!"
```

---

## Examples

Below are some example templates to showcase how components can be structured.

- Button Component:

  ```erb
  <button onclick="<%= @action %>">
    <%= @label %>
  </button>
  ```

- Text Field Component:

  ```erb
  <input type="text" placeholder="<%= @placeholder %>">
  ```

- Checkbox Component:

  ```erb
  <div class="checkbox">
    <input type="checkbox">
    <label><%= @label %></label>
  </div>
  ```

---

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---

For more detailed usage and full API documentation, please refer to the inline code comments and accompanying documentation.

Feel free to raise an issue for any bugs, feature requests, or questions.

**Note**: This documentation assumes that you are familiar with Ruby and ERB (Embedded Ruby).
