function renderChart(chartData) {
  let chart = new CanvasJS.Chart("chartContainer", {
    zoomEnabled: true,
    title: { text: "Spectrum" },
    axisY: { includeZero: false },
    data: chartData
  });

  chart.render();
}

function mapSpectrum(spectrum) {
  return spectrum.map(function(point) {
    return {
      x: parseFloat(point[0].replace(/,/, '.')),
      y: parseFloat(point[1].replace(/,/, '.')),
    }
  });
};

function chartSeries(spectrum) {
  return {
    type: "line",
    dataPoints: mapSpectrum(spectrum),
  }
};
