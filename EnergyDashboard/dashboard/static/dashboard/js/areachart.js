$(function () {
    $('#graph-container10').highcharts({
        chart: {
            type: 'area',
            spacingBottom: 30
        },
        title: {
            text: 'BUILDING POWER CONSUMPTION IN KILO-WATT HOUR',
            style: {
                color: '#aaaaaa'
            }
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            x: 60,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: ''
            },
            labels: 
                {
                    enabled: false
                // formatter: function () {
                //     return this.value;
                // }
            },
            gridLineWidth: 0,
            minorGridLineWidth: 0,
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.x + ': ' + this.y;
            }
        },
        plotOptions: {
            area: {
                fillOpacity: 0.5
            }
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Consumption',
            color: '#ff6666',
            data: [950, 820, 710, 620, 470, 390, 370, 390, 450, 650, 810, 920]
        },{
            name: 'Generation',
            color: '#7fff7f',
            data: [770, 750, 700, 630, 500, 450, 450, 430, 460, 630, 720, 750]
        } ]
    });
});