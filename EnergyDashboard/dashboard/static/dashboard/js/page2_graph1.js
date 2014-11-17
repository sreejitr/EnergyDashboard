$(function () {
        // Build the chart
        $('#graph-container1').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Categories of Energy consumption November, 2014'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Share',
                data: [
                    ['Workstations',   45.0],
                    ['Conference Rooms',       26.8],
                    {
                        name: 'Heating',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Cooling',    8.5],
                    ['Cleaning',     6.2],
                    ['Others',   0.7]
                ]
            }]
        });
    });
