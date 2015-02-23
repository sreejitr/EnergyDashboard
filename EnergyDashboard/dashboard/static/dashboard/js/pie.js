$(function () {
    $('#graph-container6').highcharts({
        
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Band Distribution: High usage-Red, Medium usage-Yellow, Low usage-Green'
        },
        subtitle: {
            text: 'Percentage of users in each Band'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                showInLegend: true,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        legend: {
            enabled: true,
            useHTML: true,
            layout: 'vertical',
            align: 'right',
            width: 200,
            verticalAlign: 'middle',
            labelFormatter: function() {
                var bandmap = {"Band:Red":"Red: Below 75%-ile", "Band:Yellow":"Yellow: 85 to 74%-ile", "Band:Green":"Green: Above 85%-ile"};
                var range = bandmap[this.name];
                return '<div style="text-align: left; width:130px;">' + range +'</div>';
   }
        },
        series: [{
            type: 'pie',
            name: 'Percentage of users in Band',
            data: [
                {
                    name: 'Band:Green',   
                    y: 45.7,
                    color: '#90ee7e'
                },
                {
                    name: 'Band:Yellow',       
                    y: 26.8,
                    color: '#FFFF66'
                },
                {
                    name: 'Band:Red',
                    y: 27.5,
                    color: '#f45b5b',
                    sliced: true,
                    selected: true
                }
            ]
        }]
    });
});