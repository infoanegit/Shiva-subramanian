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
        <tr/>
            <td>
                <input id = "pageNameId" type = "text" />
            </td>
            <td>
                <input id = "pageDescId" type = "text" />
            </td>
            <td class = "text-center" >
                <button onclick = "updateTable(this)" id = "editButtonId" class = "btn btn-success">Update</button>
            </td>
            <td>
                <button onclick = "deleteRow(this)" id = "cancelButtonId" class = "btn btn-danger">Cancel</button>
            </td>
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