#include<stdio.h>

int majorityElement(int* nums, int numsSize){    
    int count = 1;  
    int index = 0;
    
    for(int i = 0; i < numsSize; i++){
        if(nums[index] == nums[i])
            count++;
        else
            count--;
        
        if(count == 0) {
            index = i;
            count = 1;
        }
    }
    return nums[index];
}

int main(void){
	int nums1[] = {3, 2, 3};
	printf("majority element of array is : %d", majorityElement((int *)&nums1, 3));
	return 0;
}
