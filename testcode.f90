program testcode

#define Vec integer(8)

  Vec :: x
  integer :: n = 4
  integer :: i
  real(8) :: vec(4) = (/1.0_8,2.0_8,3.0_8,4.0_8/)

  call veccreate(x, n)
  do i = 1, n
    call vecsetvalue(x, i-1, vec(i))
  end do
  call vecprint(x, n)
  call vecdestroy(x)

end program testcode
