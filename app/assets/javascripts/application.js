// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require highcharts
//= require_tree .

$(document).ready(function(){
  $(".js_add_new_client").on("click", function(e){
    alert("JAJA cancele el postback")
  });

  $(".js_filter_form").on("ajax:success", function(e, data, status, xhr){
    //alert(data);
    //alert(data["action"])
    //alert(xhr.responseText);
    //alert("Se filtro!");
    $(".js_filtered_table").html(data)
  });

  $(".js_filter_form").on("ajax:error", function(e, xhr, status, error){
    alert(error);
  });

  $("#keyword").on("keyup", function(e){
    $(".js_filter_form").submit();
  });

  function build_graph(){
    deposit_count = parseInt($("#graph_container").data("deposit"));
    retire_count = parseInt($("#graph_container").data("retire"));

    chart1 = new Highcharts.Chart({
      chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            renderTo: "graph_container"
        },
        title: {
            text: 'Browser market shares at a specific website, 2014'
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
            name: 'Browser share',
            data: [
                ['Deposito',   deposit_count],
                ['Retiro',       retire_count]
            ]
        }]
    });
  }

  if($("#graph_container").length > 0){
    build_graph();
  }
});
