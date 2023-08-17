import { Controller } from "@hotwired/stimulus"
import {
  Chart,
  Colors,
  BarController,
  BarElement,
  LineController,
  LineElement,
  PointElement,
  LinearScale,
  TimeScale,
  Tooltip
} from "chart.js"
import "chartjs-adapter-date-fns"

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ["canvas"]
  static values = {
    payload: Object
  }

  initialize() {
    Chart.register(
      Colors,
      BarController,
      BarElement,
      LineController,
      LineElement,
      PointElement,
      LinearScale,
      TimeScale,
      Tooltip
    )
  }

  connect() {
    new Chart(this.canvasTarget, this.payloadValue)
  }
}
