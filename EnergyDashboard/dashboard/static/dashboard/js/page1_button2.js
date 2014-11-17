$(document).ready(function(){
$('#button2').click(function () {
    $('#graph').highcharts({

        chart: {
            type: 'columnrange',
            inverted: true
        },

        title: {
            text: 'Energy consumption variation by month'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },

        yAxis: {
            title: {
                text: 'Energy ( KWH )'
            }
        },

        tooltip: {
            valueSuffix: '°C'
        },

        plotOptions: {
            columnrange: {
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                        return this.y + 'KWH';
                    }
                }
            }
        },

        legend: {
            enabled: false
        },

        series: [{
            name: 'KWH',
            data: [
                [9.7, 29.4],
                [8.7, 26.5],
                [13.5, 29.4],
                [11.4, 29.9],
                [11.0, 22.6],
                [12.9, 29.5],
                [19.2, 30.7],
                [7.3, 26.5],
                [14.4, 28.0],
                [13.1, 31.4],
                [15.2, 30.4],
                [13.5, 29.8]
            ]
        }]

    });

});
});