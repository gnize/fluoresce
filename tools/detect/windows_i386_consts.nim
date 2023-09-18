# Generated by detect.nim
const
  E2BIG* = cint(7)
  EACCES* = cint(13)
  EAGAIN* = cint(11)
  EBADF* = cint(9)
  EBUSY* = cint(16)
  ECHILD* = cint(10)
  EDEADLK* = cint(36)
  EDOM* = cint(33)
  EEXIST* = cint(17)
  EFAULT* = cint(14)
  EFBIG* = cint(27)
  EILSEQ* = cint(42)
  EINTR* = cint(4)
  EINVAL* = cint(22)
  EIO* = cint(5)
  EISDIR* = cint(21)
  EMFILE* = cint(24)
  EMLINK* = cint(31)
  ENAMETOOLONG* = cint(38)
  ENFILE* = cint(23)
  ENODEV* = cint(19)
  ENOENT* = cint(2)
  ENOEXEC* = cint(8)
  ENOLCK* = cint(39)
  ENOMEM* = cint(12)
  ENOSPC* = cint(28)
  ENOSYS* = cint(40)
  ENOTDIR* = cint(20)
  ENOTEMPTY* = cint(41)
  ENOTSUP* = cint(48)
  ENOTTY* = cint(25)
  ENXIO* = cint(6)
  EPERM* = cint(1)
  EPIPE* = cint(32)
  ERANGE* = cint(34)
  EROFS* = cint(30)
  ESPIPE* = cint(29)
  ESRCH* = cint(3)
  ETIMEDOUT* = cint(10060)
  EXDEV* = cint(18)
  O_CREAT* = cint(256)
  O_EXCL* = cint(1024)
  O_TRUNC* = cint(512)
  O_APPEND* = cint(8)
  O_ACCMODE* = cint(3)
  O_RDONLY* = cint(0)
  O_RDWR* = cint(2)
  O_WRONLY* = cint(1)
  FE_DIVBYZERO* = cint(4)
  FE_INEXACT* = cint(32)
  FE_INVALID* = cint(1)
  FE_OVERFLOW* = cint(8)
  FE_UNDERFLOW* = cint(16)
  FE_ALL_EXCEPT* = cint(63)
  FE_DOWNWARD* = cint(1024)
  FE_TONEAREST* = cint(0)
  FE_TOWARDZERO* = cint(3072)
  FE_UPWARD* = cint(2048)
  FE_DFL_ENV* = pointer(nil)
  LC_ALL* = cint(0)
  LC_COLLATE* = cint(1)
  LC_CTYPE* = cint(2)
  LC_MONETARY* = cint(3)
  LC_NUMERIC* = cint(4)
  LC_TIME* = cint(5)
  F_OK* = cint(0)
  R_OK* = cint(4)
  W_OK* = cint(2)
  X_OK* = cint(1)
  SEEK_SET* = cint(0)
  SEEK_CUR* = cint(1)
  SEEK_END* = cint(2)
  S_IFMT* = cint(61440)
  S_IFBLK* = cint(12288)
  S_IFCHR* = cint(8192)
  S_IFIFO* = cint(4096)
  S_IFREG* = cint(32768)
  S_IFDIR* = cint(16384)
  S_IRWXU* = cint(448)
  S_IRUSR* = cint(256)
  S_IWUSR* = cint(128)
  S_IXUSR* = cint(64)
  CLOCKS_PER_SEC* = clong(1000)
  SIGABRT* = cint(22)
  SIGFPE* = cint(8)
  SIGILL* = cint(4)
  SIGINT* = cint(2)
  SIGSEGV* = cint(11)
  SIGTERM* = cint(15)
  SIG_BLOCK* = cint(0)
  SIG_UNBLOCK* = cint(1)
  SIG_SETMASK* = cint(2)
  IOFBF* = cint(0)
  IONBF* = cint(4)
