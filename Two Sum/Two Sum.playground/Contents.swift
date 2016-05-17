class Solution {
    func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var nums1 = nums.sort()
        var nums2 = nums1
        var start=0
        var end=nums1.count-1
        for i in 0..<nums2.count {
            nums2[i]=target-nums2[i]
        }
        while start<end {
            if nums2[start]<nums1[end] {
                end-=1
            }else if nums2[start]>nums1[end] {
                start+=1
            } else {
                break
            }
        }//If there are two same numbers there will be bugs
        var change1=false
        var change2=false
        for i in 0..<nums.count {
            let flag1 = nums1[start] == nums[i]
            let flag2 = nums1[end] == nums[i]
            if flag1&&flag2{
                start=i
                change1=true
            }
            if flag1 && change1==false{//If both equal there will be bug
                start=i
                change1=true
            }
            if flag2 && change2==false{//When it change,it will = two times
                end=i
                change2=true
                
            }
        }
        if start>end {
            var x = 0
            x=start
            start=end
            end=x
        }
        return [start,end]
    }
}
let a = [0,4,3,0]
let b = 0
let c = Solution.init()
c.twoSum(a, b)


class Solution1 {
    func twoSum(nums: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = 0
        for i in 0..<nums.count {
            for j in 0..<nums.count {
                let sum = nums[i]+nums[j]
                if sum==target {
                    start=i
                    end=j
                    break
                }
            }
        }
        if nums[start]>nums[end] {//take care
            var temp = 0
            temp=start
            start=end
            end=temp
        }
        return [start,end]
    }
}



