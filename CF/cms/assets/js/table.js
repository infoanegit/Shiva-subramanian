function editRow(elem, pageName, pageDesc){
    upadateDataHTML = `
        <td>
            <input id = "pageNameId" style = "width:60%;" type = "text" value = '${pageName}' />
        </td>
        <td>
            <input id = "pageDescId" style = "width:60%;" type = "text" value = '${pageDesc}' />
        </td>
        <td class = "text-center" >
            <button onclick = "updateTableRow(this)" id = "editButtonId" class = "btn btn-success">Update</button>
        </td>
        <td>
            <button onclick = "showRow(this, '${pageName}', '${pageDesc}')" id = "cancelButtonId" class = "btn btn-danger">Cancel</button>
        </td>
    `;

    $(elem).parent().parent().html(upadateDataHTML);
}

function showRow(elem, pageName, pageDesc){
    showDataHTML = `
        <td>${pageName}</td>
        <td>${pageDesc}</td>
        <td>
            <button onclick = "editRow(this, '${pageName}', '${pageDesc}')" id = "editButtonId" class = "btn btn-success">Edit</button>
        </td>
        <td>
            <a class = "btn btn-danger">Delete</a>
        </td>
    `;

    $(elem).parent().parent().html(showDataHTML);
}

function addRow(elem){
    addDataHTML = `
        <tr>
        <td colspan = '4'>
            <form method = "post">
                <input class = "me-4" name = "pageName" id = "pageNameId" type = "text" required />
                <input class = "me-4" name = "pageDesc" id = "pageDescId" type = "text" required />
                <button type = "submit" name = "insertDataBtn" id = "editButtonId" class = "btn btn-success me-5" >Insert</button>
                <button onclick = "deleteRow(this)" id = "cancelButtonId" class = "btn btn-danger me-5">Cancel</button>
                </td>
            </form>
        </tr>
    
    `;

    $(elem).parent().parent().before(addDataHTML);
}

function deleteRow(elem){
    $($(elem).parent().parent()).remove();
}

function addTableRow(elem) {
    $.post("./add.cfm",
    {
        pageName: $(elem).parent().parent().find("#pageNameId").val(),
        pageDesc: $(elem).parent().parent().find("#pageDescId").val()
    },
    function(data){
        $("#cfoutput").html(data);
    });
}