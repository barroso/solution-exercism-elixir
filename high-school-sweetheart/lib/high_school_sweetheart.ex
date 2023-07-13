defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.at(0)
  end

  def initial(name) do
    first_letter(name)
    |> String.upcase
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [name, last_name] = String.split(full_name)
    "#{initial(name)} #{initial(last_name)}"
  end

  def pair(full_name1, full_name2) do
    p1 = initials(full_name1)
    p2 = initials(full_name2)
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{p1}  +  #{p2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
