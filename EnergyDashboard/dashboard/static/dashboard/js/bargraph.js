$(function () {
    $('#graph-container8').highcharts({
        chart: {
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 25,
                depth: 70
            }
        },
        title: {
            text: 'Energy consumption, in Percentile'
        },
        
        plotOptions: {
            column: {
                depth: 25
            }
        },
        
        yAxis: {
            title: {
                text: 'Percentile Consumption'
            }
        },
        series: [{
            name: 'Your Overall (%-ile)',
            color: '#f45b5b',
            data: [{
                y: 69
            }]
        }, {
            name: 'Median (%-ile)',
            color: "#90ee7e",
            data: [{
                y: 89
            }]
        }, {
            name: 'Your highest %-ile',
            color: '#FFFF66',
            data: [{
                y: 83
            }]
        }]
    });
});