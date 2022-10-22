program: {
    main: {
        number num = 0;

        prompt num;
        
        if num == 2 {
            display "You got it right!";
        };

        if num != 2 {
            display "You got it wrong!";
        };

        return;
    }
}
