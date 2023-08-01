defmodule Delivery.Orders.ReportRunner do
  require Logger
  use GenServer

  alias Delivery.Orders.Report

  # Client

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server

  @impl true
  def init(state) do
    Logger.info("Report Runner started!")
    schedule_report_generation()
    IO.puts("INIT CALLED")

    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generating report...")
    IO.puts("handle_info")

    Report.create()
    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
