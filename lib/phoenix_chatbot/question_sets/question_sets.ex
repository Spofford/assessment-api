defmodule PhoenixChatbot.QuestionSets do
  @moduledoc """
  The QuestionSets context.
  """

  import Ecto.Query, warn: false
  alias PhoenixChatbot.Repo

  alias PhoenixChatbot.QuestionSets.Question

  @doc """
  Returns the list of question.

  ## Examples

      iex> list_question()
      [%Question{}, ...]

  """
  def list_question do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{source: %Question{}}

  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end

  alias PhoenixChatbot.QuestionSets.QuestionType

  @doc """
  Returns the list of question_types.

  ## Examples

      iex> list_question_types()
      [%QuestionType{}, ...]

  """
  def list_question_types do
    Repo.all(QuestionType)
  end

  @doc """
  Gets a single question_type.

  Raises `Ecto.NoResultsError` if the Question type does not exist.

  ## Examples

      iex> get_question_type!(123)
      %QuestionType{}

      iex> get_question_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question_type!(id), do: Repo.get!(QuestionType, id)

  @doc """
  Creates a question_type.

  ## Examples

      iex> create_question_type(%{field: value})
      {:ok, %QuestionType{}}

      iex> create_question_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question_type(attrs \\ %{}) do
    %QuestionType{}
    |> QuestionType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question_type.

  ## Examples

      iex> update_question_type(question_type, %{field: new_value})
      {:ok, %QuestionType{}}

      iex> update_question_type(question_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question_type(%QuestionType{} = question_type, attrs) do
    question_type
    |> QuestionType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a QuestionType.

  ## Examples

      iex> delete_question_type(question_type)
      {:ok, %QuestionType{}}

      iex> delete_question_type(question_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question_type(%QuestionType{} = question_type) do
    Repo.delete(question_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question_type changes.

  ## Examples

      iex> change_question_type(question_type)
      %Ecto.Changeset{source: %QuestionType{}}

  """
  def change_question_type(%QuestionType{} = question_type) do
    QuestionType.changeset(question_type, %{})
  end

  alias PhoenixChatbot.QuestionSets.ResponseChoice

  @doc """
  Returns the list of response_choices.

  ## Examples

      iex> list_response_choices()
      [%ResponseChoice{}, ...]

  """
  def list_response_choices do
    Repo.all(ResponseChoice)
  end

  @doc """
  Gets a single response_choice.

  Raises `Ecto.NoResultsError` if the Response choice does not exist.

  ## Examples

      iex> get_response_choice!(123)
      %ResponseChoice{}

      iex> get_response_choice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_response_choice!(id), do: Repo.get!(ResponseChoice, id)

  @doc """
  Creates a response_choice.

  ## Examples

      iex> create_response_choice(%{field: value})
      {:ok, %ResponseChoice{}}

      iex> create_response_choice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_response_choice(attrs \\ %{}) do
    %ResponseChoice{}
    |> ResponseChoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a response_choice.

  ## Examples

      iex> update_response_choice(response_choice, %{field: new_value})
      {:ok, %ResponseChoice{}}

      iex> update_response_choice(response_choice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_response_choice(%ResponseChoice{} = response_choice, attrs) do
    response_choice
    |> ResponseChoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ResponseChoice.

  ## Examples

      iex> delete_response_choice(response_choice)
      {:ok, %ResponseChoice{}}

      iex> delete_response_choice(response_choice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_response_choice(%ResponseChoice{} = response_choice) do
    Repo.delete(response_choice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking response_choice changes.

  ## Examples

      iex> change_response_choice(response_choice)
      %Ecto.Changeset{source: %ResponseChoice{}}

  """
  def change_response_choice(%ResponseChoice{} = response_choice) do
    ResponseChoice.changeset(response_choice, %{})
  end
end
