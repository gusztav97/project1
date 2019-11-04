var Project1 = ( function() {

    return {
        
        submitSearchForm: function() {
            
            $.ajax({
                url: 'registration',
                method: 'GET',
                data: $('#searchForm').serialize(),
                success: function(response) {
                    $('#output').html(response);                  
                }
            });
            
        },
        
        submitRegForm: function() {
            
            $.ajax({
                
                url: 'registration',
                method: 'POST',
                dataType: 'json',
                data: $('#searchForm').serialize(),
                
                success: function(response) {
                    //alert( JSON.stringify(response) );
                    var displayname = response["displayname"];
                    var regcode = response["sessionid"];
                    alert("Name: " + displayname + ", Code: " + regcode);
                    
                    $("#outputparagraph").append("Congratulations! You have successfully registered as: " + displayname + "<br>");
                    $("#outputparagraph").append("Your registration code is: " + regcode);
                }
                
            });
            
        },
        
        changeField: function() {
            
            var firstname = $("#firstname").val();
            var lastname = $("#lastname").val();
            
            var displayname = firstname + " " + lastname;
            
            $("#displayname").val(displayname);
            
        },
        
        init: function() {
            
            /* Output the current version of jQuery (for diagnostic purposes) */
            
            $('#output').html( "jQuery Version: " + $().jquery );
 
        }

    };

}());