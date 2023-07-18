function updateDollar(cake, filling, candle, inscription) {
    $( "#sizeOfCakeDivId" ).find( "label" ).each(
        function(){
            var cakeSize = $(this).prop("for");
            var cakeSize = cakeSize.replaceAll(/cake|Id/g, "");
            $(this).append("($" + cake[cakeSize] + ")");
        }
    );
    $( "#fillingId" ).find("option").each(
        function() {
            var value = $(this).val();
            var fillingDollar = filling[value];
            if(fillingDollar != undefined){
                $(this).append("($" + fillingDollar + ")");
            }
        }
    );
    $( "label[for='candleId']" ).append("($" + candle + ")");
    $( "label[for='inscriptionCheckboxId']" ).append("($" + inscription + ")");
}

$( 
    function() {
        var sum = 0;
        const cake = {
            "6": 20,
            "8": 25,
            "10": 35,
            "12": 75
        }
        const filling = {
            lemon: 5,
            custard: 5,
            fudge: 7,
            mocha: 8,
            rasberry: 10,
            pineapple: 5,
            dobash: 9,
            mint: 5,
            cherry: 5,
            selected : null
        };
        const candle = 5;
        const inscription = 20;
        var previousCakeDollar = null;
        $( "input[type='checkbox']" ).checkboxradio();
        updateDollar(cake, filling, candle, inscription);
        $( "input[type='radio']" ).click(function(e){
            var dollar = parseInt($(e.target).val());
            sum += dollar;
            if(previousCakeDollar != null){
                sum -= previousCakeDollar;
            }
            previousCakeDollar = dollar;
            // $( "#billAmountId" ).html(sum);
        });
        $( "#fillingId" ).change(function(e){
            var flavour = $(e.target).val();
            sum += filling[flavour];
            if(filling.selected != null){
                sum -= filling[filling.selected];
                filling.selected = flavour;
            }
            // $( "#billAmountId" ).html(sum);
        });
        $( "#candleId" ).click(function(e) {
            var checked = $(e.target).prop("checked");
            if(checked){
                sum += 5;
            }
            else{
                sum -= 5;
            }
            // $( "#billAmountId" ).html(sum);
        });
        $( "#inscriptionCheckboxId" ).click(function(e) {
            var checked = $(e.target).prop("checked");
            if(checked){
                sum += 20;
                $("#inscriptionInputId").prop("disabled", false);
            }
            else{
                sum -= 20;
                $("#inscriptionInputId").val("");
                $("#inscriptionInputId").prop("disabled", true);
            }
            // $( "#billAmountId" ).html(sum);
        });
        $(document).change(function() { 
            $( "#billAmountId" ).html(sum);
        });
    } 
);