#include "Unity/unity.h"
#include <math.h>
#include "math_tools.h"

void setUp(void){}
void tearDown(void){}

#define ABS(X) (X) > 0 ? (X) : -(X)

void test_approxExp(void)
{
    float expected = exp(0.1);
    float actual = approx_exp(0.1);

    float diff = ABS(expected - actual);
    printf("%f\n", diff);

    //TEST_ASSERT_EQUAL_FLOAT(expected, actual);
    TEST_ASSERT_LESS_OR_EQUAL_FLOAT(0.00001, diff);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_approxExp);
    return UNITY_END();
}

/*
float 	approx_exp(float x);
float	Lin2Exp(uint8_t val, float min, float max); // input val in 0 ... 127
float 	tanhXdX(float x);
float 	fastTanh(float var);
float 	softClipTwo(float in);
float 	fastTan(float x);
*/