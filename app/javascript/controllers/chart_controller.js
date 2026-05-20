import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    labels:   Array,
    receipts: Array,
    expenses: Array
  }

  connect() {
    const existing = window.Chart.getChart(this.element)
    if (existing) existing.destroy()

    this.chart = new window.Chart(this.element, {
      type: "bar",
      data: {
        labels: this.labelsValue,
        datasets: [
          { label: "Ingresos", data: this.receiptsValue, backgroundColor: "#3498db" },
          { label: "Gastos",   data: this.expensesValue,  backgroundColor: "#e74c3c" }
        ]
      },
      options: {
        responsive: true,
        plugins: { legend: { position: "bottom" } }
      }
    })
  }

  disconnect() {
    if (this.chart) this.chart.destroy()
  }
}
