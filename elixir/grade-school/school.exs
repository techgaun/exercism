defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    Map.put(db, grade, [name | grade(db, grade)])
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    db
    |> Enum.sort_by(fn {grade, students} ->
      grade
    end)
    |> Enum.map(fn {grade, students} ->
      {grade, Enum.sort(students)}
    end)
  end
end
