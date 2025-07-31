defmodule Rules do
  def eat_ghost?(pp_active?, touching_ghost?), do: pp_active? and touching_ghost?
  def score?(touching_pp?, touching_dot?), do: touching_dot? or touching_pp?
  def lose?(pp_active?, touching_ghost?), do: touching_ghost? and not pp_active?
  def win?(no_more_dots?, pp_active?, touching_ghost?) do
    not lose?(pp_active?, touching_ghost?) and no_more_dots?
  end
end
