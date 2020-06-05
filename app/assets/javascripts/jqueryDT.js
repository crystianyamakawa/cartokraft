//##################################################
// dataTables
//##################################################
//$(document).on('page:change',function(){
//$(document).ready(function(){
$(document).on('turbolinks:load',function(){
  $('#datatable').DataTable( {
       language: {
            "search": "Procurar: ",
            "paginate":{
              "previous": "Anterior ",
              "next": " Proximo"},
            "lengthMenu": "Mostrar _MENU_",
            "zeroRecords": "Não encontrado",
            "info": "Pagina _PAGE_ de _PAGES_",
            "infoEmpty": "Vazio",
            "infoFiltered": "(filtrado de _MAX_ total registros)"
          },
          columnDefs: [
              {
                  targets: [ 0, 1, 2 ],
                  className: 'mdl-data-table__cell--non-numeric'
              }
          ],
        lengthMenu: [[100, 25, 50, -1], [100, 25, 50, "Tudo"]]
      } );

      $('#grid_consulta').DataTable( {

          bPaginate: false,
          bLengthChange: false,
          bFilter: true,
          bInfo: false,
          columnDefs: [
                  {
                      targets: [ 0, 1, 2 ],
                      className: 'mdl-data-table__cell--non-numeric'
                  }
              ],
          language: {
                      "search": "Procurar: "}
          } );


    // $('#tb_entregas').DataTable({
    // "language": {
    //         "search": "Procurar:",
    //         'aoColumns': [
    //               { sWidth: "50%", bSearchable: false, bSortable: false },
    //               { sWidth: "10%", bSearchable: false, bSortable: false },
    //               { sWidth: "10%", bSearchable: false, bSortable: false },
    //               { sWidth: "10%", bSearchable: false, bSortable: false },
    //               { sWidth: "20%", bSearchable: false, bSortable: false }
    //               //match the number of columns here for table1
    //         ],
    //         "paginate":{
    //           "previous": "Anterior ",
    //           "next": " Proximo"},
    //         "lengthMenu": "Mostrar _MENU_ registros",
    //         "zeroRecords": "Não encontrado",
    //         "info": "Pagina _PAGE_ de _PAGES_",
    //         "infoEmpty": "Vazio",
    //         "infoFiltered": "(filtrado de _MAX_ total registros)"
    //         }
    // });

});
