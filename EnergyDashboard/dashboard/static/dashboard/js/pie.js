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
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Band Distribution',
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