defmodule SystemEnv do

  def put_new(key, new_value) do
    System.put_env(key, System.get_env(key) || new_value)
  end

end
