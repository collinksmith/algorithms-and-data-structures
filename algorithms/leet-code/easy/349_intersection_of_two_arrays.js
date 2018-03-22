/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersection = function(nums1, nums2) {
  const hash = {};
  const res = [];
  nums1.forEach(num => (hash[num] = "in first array"));
  nums2.forEach(num => {
    if (hash[num] === "in first array") {
      res.push(num);
      hash[num] = "added";
    }
  });

  return res;
};

console.log(intersection([1, 2, 2, 9, 1, 3], [2, 2, 5, 9])); // => [2, 9]
