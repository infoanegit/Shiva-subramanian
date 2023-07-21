function createTodoTemplate(value){ 
    return `<div class="row mt-3 border p-2">
    <div class="col-1 form-check  d-flex justify-content-center align-items-center">
        <input type = "checkbox" class="todo-check form-check-input" />
    </div>
    <div class="col-8 todo-text">${value}</div>
    <div class="col-1 mx-auto ">
        <input type = "button" class="todoClose btn btn-close" />
    </div>
</div>`;
}

function addTodoTemplate(){
    var todoTemplate = createTodoTemplate($("#todoInputId").val());
    $(".todo").append(todoTemplate);
    setTodoCloseListener();
    setDoneCheckboxListener();
}

function setDoneCheckboxListener(){
    $(".todo-check").click(
        function(e) {
            if($(e.target).prop("checked")){
                $(".todo-text").css("color", "grey");
                $(".todo-text").css("text-decoration", "line-through");
            }
            else{
                $(".todo-text").css("color", "black");
                $(".todo-text").css("text-decoration", "none");
            }
        }
    );
}

function setDoneAllCheckboxListener(){
    $("#checkAllId").click(
        function(e) {  
            $.each($( "input[type='checkbox']" ), function (indexInArray, valueOfElement) { 
                // $(valueOfElement).prop("checked", $(e.target).prop("checked"));
                // $(valueOfElement).trigger( "click" );   
                if(indexInArray != 0){}
                console.log(valueOfElement);
           });
        }
    );
}

function setTodoCloseListener() {  
    $(".todoClose").click(
        function(e) {  
            $(e.target).parent().parent().remove();
        }
    );
}

function removeClassButtonGroup(selector, cls){
    $.each($(selector + ">"), function (indexInArray, valueOfElement) { 
         $(valueOfElement).removeClass(cls);
    });
}

function setButtonGroupListener(){
    $(".btn-group").click(
        function(e){  
            removeClassButtonGroup(".btn-group", "active");
            $(e.target).addClass("active");
        }
    );
}


function setListeners() {  
    setButtonGroupListener();
    // setTodoCloseListener();
    setDoneAllCheckboxListener();
    // setDoneCheckboxListener();
}

$(
    function() {
        setListeners();
        $("form").submit(
            function() {  
                addTodoTemplate();
                return false;
            }
        );
    }
);