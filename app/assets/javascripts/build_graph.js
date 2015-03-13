$(document).on("ready page:load", function(){

  if( $("#graph_container").length > 0 ){
    graphData = $("#graph_container").data("graph-data");

    $('#graph_container').highcharts({
          chart: {
              plotBackgroundColor: null,
              plotBorderWidth: null,
              plotShadow: false
          },
          title: {
              text: 'Reporte de Trasacciones de un Cliente'
          },
          tooltip: {
              pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
          },
          plotOptions: {
              pie: {
                  allowPointSelect: true,
                  cursor: 'pointer',
                  dataLabels: {
                      enabled: true,
                      format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                      style: {
                          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                      }
                  }
              }
          },
          series: [{
              type: 'pie',
              name: 'Transaccion',
              data: [
                  ['Deposito',   graphData.deposits],
                  ['Retiro',       graphData.retires]
              ]
          }]
      });
    }
});