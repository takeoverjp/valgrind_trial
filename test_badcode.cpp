#include <CppUTest/CommandLineTestRunner.h>
#include <CppUTest/TestHarness.h>

#include "badcode.h"

TEST_GROUP(xTasksCreateTest)
{
  void setup()
  {
  }
  void teardown()
  {
    ;
  }
};


TEST(xTasksCreateTest, setPortMallocFaild)
{
}

TEST(xTasksCreateTest, setPortMallocSuccess)
{
  CHECK_EQUAL(0, mem_leak ());
}

int
main (int argc, char *argv[])
{
  return CommandLineTestRunner::RunAllTests(argc, argv);
}
