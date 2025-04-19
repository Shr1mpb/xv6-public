#include "types.h"
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[])
{
  struct rtcdate r;

  if (date(&r) < 0) {
    printf(2, "date failed\n");
    exit();
  }

  // 格式化输出时间
  printf(1, "UTC Time: %d-%d-%d %d:%d:%d\n", 
         r.year, r.month, r.day, 
         r.hour, r.minute, r.second);

  exit();
}