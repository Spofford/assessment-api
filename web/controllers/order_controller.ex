# defmodule PhoenixChatbot.OrderController do
#  use PhoenixChatbot.Web, :controller

#  alias PhoenixChatbot.Order

#  def create(conn, %{"order" => order_params}) do
#    changeset = Order.changeset(%Order{}, order_params)

#    case Repo.insert(changeset) do
#      {:ok, order} ->

#        conn
#        |> put_status(:created)
#        |> render("show.json", order: order)
#      {:error, changeset} ->
#        conn
#        |> put_status(:unprocessable_entity)
#        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
#    end
#  end

#  def show(conn, %{"id" => id}) do
#    order = Repo.get!(Order, id)
#    render(conn, "show.json", order: order)
#  end

#  def update(conn, %{"id" => id, "order" => order_params}) do
#    order = Repo.get!(Order, id)
#    changeset = Order.changeset(order, order_params)

#    case Repo.update(changeset) do
#      {:ok, order} ->
#        render(conn, "show.json", order: order)
#      {:error, changeset} ->
#        conn
#        |> put_status(:unprocessable_entity)
#        |> render(PhoenixChatbot.ChangesetView, "error.json", changeset: changeset)
#    end
#  end

#  def delete(conn, %{"id" => id}) do
#    order = Repo.get!(Order, id)

#    # Here we use delete! (with a bang) because we expect
#    # it to always work (and if it does not, it will raise).
#    Repo.delete!(order)

#    send_resp(conn, :no_content, "")
#  end
# end
