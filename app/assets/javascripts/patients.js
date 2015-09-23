$(document).ready(function () {
    var crudServiceBaseUrl = $('#grid').data('url');
    var locale = $('#grid').data('locale');
    var httpBasicAuthorization = $('#grid').data('authorization');
    var dataSource = createPatientKendoDataSource(crudServiceBaseUrl, httpBasicAuthorization);
    var debug = false;

    kendo.culture(locale);
    if (debug) mockGetRequest(crudServiceBaseUrl);
    $("#grid").kendoGrid({
        dataSource: dataSource,
        navigatable: true,
        pageable: true,
        sortable: true,
        filterable: true,
        columns: [
            { field: "prsn_LastName", title: "Surname", width: "150px" },
            { field: "prsn_FirstName", title: "First name", width: "150px" },
            { field: "prsn_BirthDate", title: "Birth date", format: "{0:dd/MM/yyyy}", width: "100px"},
            { field: "prsn_Externalization", title: "Externalization", width: "300px" },
//                { field: "amount", format: "{0:c}", width: "150px" },
            { command: [
                {
                    name: "blood selections",
                    click: function(e) {
                        // e.target is the DOM element representing the button
                        var tr = $(e.target).closest("tr"); // get the current table row (tr)
                        // get the data bound to the current table row
                        var data = this.dataItem(tr);
                        console.log("Details for: " + data.prsn_Id);
                        window.location = "http://127.0.0.1:3600/patients/" + data.prsn_Id + "/blood_selections";
                    }
                }]
            }
        ]
    });
});

function createPatientKendoDataSource(url, httpBasicAuthorization) {
    var dataSource = new kendo.data.DataSource({
        transport: {
            read: {
                url: url,
                type: "GET",
                dataType: "json",
                beforeSend: function(xhr) {
                    //Here we add the basic http authorization header e.g. Basic bGF1cmVuc3ZkYjox
                     xhr.setRequestHeader('Authorization', httpBasicAuthorization);
                    //http://www.telerik.com/forums/how-to-set-authorization-header-for-transport-read
                }
            }
        },
        pageSize: 15,
        schema: {
            model: {
                id: "prsn_Id",
                fields: {
                    prsn_LastName: { type: "string"},
                    prsn_FirstName: { type: "string"},
                    prsn_BirthDate: { type: "date"},
                    prsn_Externalization: { type: "string"}
                }
            },
            data: function (response) {
                return response.dsPatients.tt_Person;
            },
            //
            // The schema.total setting may be omitted when the Grid is bound to a plain Array
            // (i.e. the data items' collection is not a value of a field in the server response). In this case, the length of the response Array will be used.
            // schema.total must be set if the serverPaging option is set to true.
            //
            total: function (response) {
                return response.dsPatients.tt_Person.length;
            }
        }
    });
    return dataSource;

};
function mockGetRequest(url) {
    $.mockjax({
        url: url,
        type: "get",
        dataType: "json",
        contentType: "application/json",
        responseText: {
            "dsPatients": {
                "tt_Person":[
                    {
                        "prsn_Id": 66368,
                        "prsn_FirstName":"Lexus",
                        "prsn_LastName":"Kassulke",
                        "prsn_BirthDate":"1997-08-14",
                        "prsn_Object":12,
                        "prsn_Externalization":"Kassulke, Lexus (M), 14\/08\/1997",
                        "prsn_Gender":1,
                        "prsn_BagsAtLabOrWard":1
                    },
                    {
                        "prsn_Id":66517,
                        "prsn_FirstName":"Kari",
                        "prsn_LastName":"Yost",
                        "prsn_BirthDate":"1933-07-31",
                        "prsn_Object":50,
                        "prsn_Externalization":"Yost, Kari (F), 31\/07\/1933",
                        "prsn_Gender":2,
                        "prsn_BagsAtLabOrWard":0
                    },
                    {
                        "prsn_Id":66573,
                        "prsn_FirstName":"Douglas",
                        "prsn_LastName":"Cleveland",
                        "prsn_BirthDate":"1917-07-10",
                        "prsn_Object":106,
                        "prsn_Externalization":"Douglas, Cleveland (M), 10\/07\/1917",
                        "prsn_Gender":1,
                        "prsn_BagsAtLabOrWard":0
                    },
                    {
                        "prsn_Id":66615,
                        "prsn_FirstName":"Hayden",
                        "prsn_LastName":"Bins",
                        "prsn_BirthDate":"2005-03-31",
                        "prsn_Object":148,
                        "prsn_Externalization":"Bins, Hayden (M), 31\/03\/2005",
                        "prsn_Gender":1,
                        "prsn_BagsAtLabOrWard":1
                    },
                    {
                        "prsn_Id":66422,
                        "prsn_FirstName":"Monica",
                        "prsn_LastName":"Ziemann",
                        "prsn_BirthDate":"1999-11-11",
                        "prsn_Object":150,
                        "prsn_Externalization":"Ziemann, Monica (F), 11\/11\/1999",
                        "prsn_Gender":2,
                        "prsn_BagsAtLabOrWard":0
                    }
                ]
            }
        }
    });
}