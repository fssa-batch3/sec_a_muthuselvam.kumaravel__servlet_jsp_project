<%! 
    int count = 0;  // declaring a variable

    public int incrementCount() {  // declaring a method
        return count+=100;
    }
%>

<html>
<body>
    The current count is: <%= incrementCount() %>
</body>
</html>