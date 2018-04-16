$(function() {
  let measurment_id = $("#find-similar").attr("data-id");
  let similarList = $("#similar")
  let currentMeasurment = JSON.parse($('#current-measurment')[0].innerHTML);
  let mainSpectrum = chartSeries(currentMeasurment);
  let chartData = [mainSpectrum];
  let originalchartData = [];

  renderChart(chartData);

  $("#find-similar").click(function() {
    $.get("find_similar", { id: measurment_id, range: getRange() }, function(data) {
      measurments = JSON.parse(data)
      similarList.html("");
      if (measurments.length === 0) {
        similarList.html(
          '<p style="color: red;">No similar measurments found for current type</p>'
        );
      } else {
        addMeasurmentsToChartData(measurments);
        renderChart(chartData);
      }
    });
  });

  $("#similar").on("change", ".similar-spectrum", function() {
    let index = $(this).attr("data-index");
    if ($(this).find("input")[0].checked) {
      chartData[index].dataPoints = originalchartData[index - 1];
    } else {
      chartData[index].dataPoints = [];
    }
    renderChart(chartData);
  });

  function addMeasurmentsToChartData(measurments) {
    chartData = [mainSpectrum];
    originalchartData = [];
    measurments.forEach(function(measurment, i) {
      similarList.append(
        listItem(
          i, measurment.pen_name + " | " + measurment.device_name + " | " + measurment.type +
            " | " + measurment.date;
        )
      );
      chartData.push(chartSeries(measurment));
      originalchartData.push(mapSpectrum(measurment.spectrum));
    });
  };

  function listItem(index, text) {
    return $(
      `<li class="similar-spectrum" data-index=${index + 1}>
        <label><input type="checkbox" checked=true /> ${index + 1}. ${text}</label>
      </li>`
    );
  };

  function getRange() {
    let from = $("#range-from").val();
    let to = $("#range-to").val();
    from = from === "" ? 0 : from;
    to = to === "" ? 10000 : to;
    return [from, to];
  };
});
