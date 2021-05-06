function tmp()
  println(" eps(a::DataType) gives distance from the closest floating point a.","\n" )
  for datatype in [Float16, Float32, Float64]
  for number in [1, 1000, 1000000]
      println("   Around a::",datatype, " =", number)
      println(" ------------------- ")
      a::datatype = number
      println("eps(a): ",eps(a))
      println("a + eps(a): ", a + eps(a))
      println("a + eps(a)/2: ", a + eps(a)/2)
      println("eps(a)/a: ", eps(a)/a,"\n")
   end
  end
end
