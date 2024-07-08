# Python style greeting function.
def greet_by_python_style(name):
  return "Hello, " + name + "!"

# Mojo style greeting function.
fn greet_by_mojo_style(name: String) -> String:
  return "Hello, " + name + " 🔥 !"

fn main():
  try:
    print(greet_by_python_style("Python"))
  except:
    print("Python style function failed!")  
  finally:
    print(greet_by_mojo_style("Mojo"))
