# 🐻‍❄️ ARCTIC (EXPERIMENTAL) PROGRAMMING LANGUAGE

### 📖 INTRODUCTION
Arctic is an imperative statically typed interpreted programming language written in Ruby by AndrewNation. It was also originally planned to be a reimplementation of Titanium, another programming language created by the same creator of Arctic, but it then evolved independently and he added things he regretted not having added to Titanium, such as a type system. Arctic is currently in its very early development stages and its beta version is planned to be released around January 2023. Its syntax was influenced by Ruby and Python with some subtile influences from C++, Pascal, and Java.

**[🔗 TO READ MORE ABOUT ARCTIC, PLEASE VISIT ITS OFFICIAL PAGE HERE:]()**

Here's an example of what Arctic is supposed to look like in its final version (it might change, though):

```typescript
my_program: {
    number x = 0
    number y = 0
    number z = 0

    display "Insert a value for the following numbers"
    prompt x
    prompt y
    prompt z

    display "Awesome! Here's what you've entered: "
    display &x
    display &y
    display &z

    var_dump
}
```
### 💻 HOW TO TRY ARCTIC
Firstly, download Ruby and Arctic's source code. Then open the terminal at the `/src` foulder and run the command `ruby arctic.rb`. Polar (The codename of Arctic's interpreter written in Ruby) should have opened in your terminal and you can start writing Arctic commands there. If they are syntactically correct, you should get their output on the screen. You can also load Arctic source files (they should end with the `.ice` extension) using the command `exec filename.ice` and it'll be interpreted and executed in Polar. 

### ⭐ USEFUL LINKS
[POLAR - ARCTIC INTERPRETER](https://leoandrew.notion.site/POLAR-ARCTIC-INTERPRETER-613a8c778e4b4c1eb931b8e91b5678f9)