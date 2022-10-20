.data # the assemble directives, to allocate the space for input variable
    nums1: .word 3,2,3 # arr1 = [3,2,3]
    numsSize1: .word 3 # arr1 length 3 
    nums2: .word 2,2,1,1,1,2,2 # arr2 =[2,2,1,1,1,2,2]
    numsSize2: .word 7
    nums3: .word 2,2,2,5
    numsSize3: .word 4
    
    # below is for print function use.
    str: .string "The majority element of the array is "
    no_str: .string "There is no majority element."


main:
    la s11, nums3 # *nums[0]
    la s1, nums3 # *nums[i]
    lw s2, numsSize3 # numsSize
    add t0, x0, x0  # i = 0
    add s4, x0, x0 # index = 0
    add s3, s1, x0 # *nums[index]
    addi s0, x0, 1 # count = 1
    jalr ra, x0, forloop # jump to forloop 48
    j print # jump to print to display result on console.

forloop:
    lw t1, 0(s1) # t1 = nums[i]
    lw t2, 0(s3) # t2 = nums[index]
    beq t1, t2, countpp # nums[i] == nums[index], bracnch to count++
    addi s0, s0, -1 # count--
    j cont
countpp:
    addi s0, s0, 1 # count++
cont:
    bne s0, x0, else  # if count == 0 jump to update
    jal t4 update

else:
    # for-loop control
    addi t0, t0, 1    # ++i
    addi s1, s1, 4    # nums[i++]
    bltu t0, s2, forloop # if i < len, go to for loop
    jalr x0, ra, 0 # return to main

update:
    add s4, t0, x0 # index = i
    slli t3, t0, 2 # i*4
    add s3, s11, t3 # *nums[index] = *arr[0] + i*4
    addi s0, x0, 1 # count = 1
    jalr x0, t4, 0

exit:

print:
    la a0, str #a0 is return value register
    li a7,4 # print string by specifiy the value of a7 register t0 4
    ecall

    add a0, t2, x0 # return value
    li a7, 1 # print integer
    ecall
