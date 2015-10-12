function createBloodSelectionKendoDataSource(url, httpBasicAuthorization) {
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
                id: "bsel_Id",
                fields: {
                    bsel_ProductMnemonic: { type: "string"},
                    bsel_StatusString: { type: "string"},
                    bsel_OrderLowestObjectTime: { type: "date"},
                    bsel_BloodGroupString: { type: "string"},
                    bsel_RhesusString: { type: "string"}
                }
            },
            data: function (response) {
                return response.dsBloodselections.tt_BloodSelection;
            },
            //
            // The schema.total setting may be omitted when the Grid is bound to a plain Array
            // (i.e. the data items' collection is not a value of a field in the server response). In this case, the length of the response Array will be used.
            // schema.total must be set if the serverPaging option is set to true.
            //
            total: function (response) {
                return response.dsBloodselections.tt_BloodSelection.length;
            }
        }
    });
    return dataSource;

};

