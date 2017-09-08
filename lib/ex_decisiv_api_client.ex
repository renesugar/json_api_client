defmodule Decisiv.ApiClient do
  @client_name Application.get_env(:ex_decisiv_api_client, :client_name)
  @timeout Application.get_env(:ex_decisiv_api_client, :timeout, 500)
  @version Mix.Project.config[:version]

  @moduledoc """
  Documentation for Decisiv.ApiClient.
  """

  @doc """
  Generates a value used in the User-Agent header, used to identify callers.

  ## Examples

      iex> Decisiv.ApiClient.user_agent()
      "ExApiClient/0.1.0/client_name"

  """
  def user_agent do
    "ExApiClient/" <> @version <> "/" <> @client_name
  end

  @doc """
  Returns the default timeout value, in msecs.

  ## Examples

      iex> Decisiv.ApiClient.timeout()
      500

  """
  def timeout do
    @timeout
  end

  @doc """
  Returns the endpoint of a specific service.

  ## Examples

      iex> Decisiv.ApiClient.url_for(:notes)
      "http://localhost:3112"

  """
  def url_for(service_name) do
    response = Decisiv.DynamoDB.get_item(service_name)
    response["Item"]["endpoint"]
  end
end