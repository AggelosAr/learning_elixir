defmodule Tutorials.Structs.Expense do

alias Tutorials.Structs.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )


  # TODO what is the type t ?? and why all are of type t ?
  @type t :: %Expense{
        title: String.t(),
        date: Date.t() | nil,
        amount: number(),
        store: String.t()
        }


  @spec sample() :: [t()]
  def sample() do
    [
      %Expense{title: "Grocery", date: ~D[2022-09-12], amount: 18.99, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-10-18], amount: 55.65, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2022-07-06], amount: 150.99, store: "Marks"},
      %Expense{title: "Air Jordans", date: ~D[2022-10-30], amount: 799.99, store: "Nike"}
    ]
  end



  def total(expenses) do
    expenses |> Enum.reduce(0, fn exp, acc -> exp.amount + acc end)
  end
  # Expense.total(Expense.sample)

  def sort_by_date(expenses) do
    #expenses |> Enum.sort(fn exp1, exp2 -> exp1.date > exp2.date end)

    expenses |> Enum.sort_by(&(&1.date))
  end
  # Expense.sort_by_date(Expense.sample)

  @spec add_expense(t) :: [t()]
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end

  # exp = %Expense{title: "Grocery1", date: ~D[2022-09-12], amount: 11118.99, store: "Metro"}


  def update_amount(title, amount) do

    [item] = Enum.filter(Expense.sample, fn exp -> exp.title == title end)

    new_item = %{item | amount: amount}

    [new_item | Expense.sample |> List.delete(item)]

  end
  #Expense.update_amount("Mobile", 10)

  @users ["Coco", "Cece", "Louis", "Chiko"]


  # when is called guard   # TODO do this again.
  def auth(user) when user in @users, do: {:ok, "authorized"}
  def auth(user) when user not in @users, do: {:error, "unauthorized"}

  def verify_password(user, _password) when user in @users, do: {:ok, "password verified"}
  def verify_password(_user, _password), do: {:error, "wrong password"}

  def login(user, password) do
    with {:ok, _auth_msg} <- auth(user),
         {:ok, _msg} <- verify_password(user, password) do
      {:ok, "#{user} logged in successfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
