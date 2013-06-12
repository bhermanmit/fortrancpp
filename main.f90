program main 

  use, intrinsic :: iso_c_binding

#define Vec type(c_ptr)

  interface
    function VecCreate(x, n) bind(c)
      import :: c_ptr, c_int
      Vec :: VecCreate
      Vec, value :: x
      integer(c_int), value :: n
    end function VecCreate

    function VecSetValue(x, i, vec) bind(c)
      import :: c_ptr, c_int, c_double
      Vec :: VecSetValue
      Vec, value :: x
      integer(c_int), value :: i
      real(c_double), value :: vec
    end function VecSetValue

    subroutine VecPrint(x) bind(c)
      import :: c_ptr
      Vec, value :: x
    end subroutine VecPrint

    function VecDestroy(x) bind(c)
      import :: c_ptr
      Vec :: VecDestroy
      Vec, value :: x
    end function VecDestroy

  end interface

  Vec :: x
  integer :: n = 4
  integer :: i
  real(8) :: vec(4) = (/1.0_8,2.0_8,3.0_8,4.0_8/)

  x = VecCreate(x, n)
  do i = 1, n
    x = VecSetValue(x, i-1, vec(i))
  end do
  call VecPrint(x)
  vec = (/5.0_8, 6.0_8, 7.0_8, 8.0_8/)
  call VecPrint(x)
  x = VecDestroy(x)

end program main
