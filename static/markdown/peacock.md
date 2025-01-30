# Introducing Peacock: A Rust-Based GUI Framework for Web Developers

For too long, developers have been stuck choosing between frameworks like Electron, known for
its high resource usage, or diving headfirst into comprehensive but complex systems like Qt.
**[Peacock](https://github.com/nucleus-labs/peacock)** changes that. It’s a Rust-based GUI
framework that simplifies development by using tools developers already know: XML and CSS.
With Peacock, you get the speed and safety of Rust without losing the flexibility and ease
of web-style development.

---

## What is Peacock?

Peacock lets you define an app’s structure with XML, style it using CSS, and write its logic in
Rust. This separation of concerns makes development cleaner and lets you focus on building
something great. It’s designed to feel intuitive to web developers while keeping the performance
benefits and type safety that Rust offers.

What makes Peacock unique is its simplicity. You don’t need to be a Rust wizard to get started.
But don’t mistake that simplicity for weakness—Peacock is built to scale, growing with you as
you tackle more complex projects.

---

## Core Components

Peacock is powered by two key libraries:

### Pinion

Pinion handles the XML side of things. It allows you to define your app’s structure declaratively,
making it easy to create and maintain layouts. Built on xmltree, Pinion simplifies the process of
organizing your app's interface.

### Crest

Crest takes care of CSS. It uses a PEG for the <a href="https://pest.rs/" target="_blank">pest</a>
crest to apply styles to your XML elements. While it mostly sticks to standard CSS attributes, some
workarounds were needed due to limitations in Iced’s widget model—such as the "spacing" attribute,
which bridges the gap where per-element margins are missing. This is planned to be patched out in
the future, but for now is a feature of the framework.

---

## Why Peacock?

### **Web-Like Simplicity**

Peacock was designed with ease of use in mind, especially for developers familiar with web technologies.
By leveraging XML for structure and CSS for styling, it offers a development experience that feels
intuitive and efficient. This approach reduces the time spent grappling with unfamiliar tools,
letting you focus on creating robust features from the start.

### **Customizable Where It Counts**

Peacock supports custom XML elements, so you can create widgets that do exactly what you need. While
it doesn’t let you invent new CSS properties, this restriction ensures compliance with Crest's CSS
spec for all widgets, maintaining consistency and reliability across your app. Its extensibility in
XML ensures you can tailor your app without compromises.

### **Bridging Web and Native Development**

Peacock brings the simplicity of web development to native app creation. By using a model that web
developers already understand, it reduces the learning curve while delivering native performance and
capabilities. It also supports the use of tools like SCSS, enabling developers to construct familiar
workflows for enhanced productivity. This hybrid approach is perfect for developers looking to make
a smooth transition to Rust without losing the ease of web-style development.

### **Integrating Familiar Tools**

One of Peacock’s standout features is its compatibility with established CSS tools like SCSS and LESS.
These tools enable developers to streamline their styling workflow, providing powerful preprocessing
capabilities to generate clean, maintainable CSS. This means you can take your existing workflows and
apply them directly to building native apps with Peacock. By leveraging these tools, developers can
simplify complex styling needs while maintaining consistency across their applications.

---

## Current Status and MVP

The **Minimum Viable Product (MVP)** for Peacock is now available! Here’s what you can expect:

- Full CSS support for all of Iced’s built-in widgets.
- XML elements tied to those widgets, with simplified mappings for ease of use.
- Two demos: a calculator and a widget sandbox, showing off the range of what Peacock can do.

These demos aren’t just placeholders—they’re working examples designed to help you hit the ground
running. [Check out the MVP demos here](). [Get started with the framework here]().

---

## Comparisons with Other Frameworks

### **Flutter**

Flutter offers a robust cross-platform solution but requires learning Dart—a language largely specific
to GUI development. While powerful, it also demands significant setup and configuration. In contrast,
Peacock allows developers to write their application logic in Rust, a general-purpose language,
with minimal overhead.

### **Tauri**

Tauri leverages web technologies to create lightweight desktop applications using a WebView. While
excellent for web-style apps, it doesn’t produce native applications like Peacock does. Rather than
competing directly, Peacock and Tauri address different needs: Tauri excels at browser-based
applications, whereas Peacock focuses on high-performance native app development.

### **Electron**

TODO

### **Qt**

TODO

---

## The Future of Peacock

Peacock has big plans:

1. **Unified Widget Model**
   Simplify how widgets work across the framework, making them easier to use and extend.

2. **Complete CSS Attribute Mapping** No more inventing attributes like "spacing." Peacock will eventually align all widget attributes with the CSS spec.

3. **Expanded Widget Library**
   Add more widgets out of the box so you can build richer interfaces.

4. **Built-In Themes** Think Bootstrap for Peacock—prebuilt stylesheets to give your apps a polished look with minimal added effort.

5. **End-to-End Testing** Introduce methods like ".click()" to simulate widget interactions, enabling developers to programmatically test UIs and ensure reliable app behavior with streamlined workflows.

6. **Full CSS Specification Support** Crest will grow to handle the entire CSS spec, giving you unmatched styling power.

The plans outlined here are not in any particular order and may depend on other plans being completed first.

---

## How to Get Involved

Peacock is still early in its journey, and your feedback matters. Whether you’re a Rust pro or a web developer testing the waters, your input can help shape the framework’s direction.

With the MVP now available, [check out the demos](#) and experiment with the framework. Your thoughts on usability, performance, and features could make all the difference.

---

## Closing Thoughts

Peacock isn’t just a framework—it’s a vision for GUI development that doesn’t force you to choose between ease and performance. By bringing web development principles to Rust, Peacock lowers the barrier to entry for developers and opens up new possibilities for creating beautiful, efficient applications.

This is just the beginning. Join me in making Peacock the tool we’ve all been waiting for.

