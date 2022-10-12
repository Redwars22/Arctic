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