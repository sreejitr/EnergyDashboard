$(function () {
    $('#container').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Band Distribution'
        },
        
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: 'Percentage',
            data: [
                {
                    name: 'Band: Red',
                    y: 45.7,
                    color: "#FF4444"
                },
                {
                    name: 'Band: Yellow',
                    y: 26.8,
                    color: "#FFCC00"
                },
                {
                    name: 'Band: Green',
                    y: 27.5,
                    color: "#86D50C"
                }
            ]
        }]
    });
});