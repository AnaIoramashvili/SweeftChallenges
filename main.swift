
// ამოცანა 1

func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var start = 0
    var seen = [Character: Int]()

    for (end, char) in s.enumerated() {
        if let previousIndex = seen[char] {
            start = previousIndex + 1
        }
        seen[char] = end
        maxLength = max(maxLength, end - start + 1)
    }

    return maxLength
}

// ამოცანა 2

func minWindow(_ s: String, _ t: String) -> String {
    var charCount = [Character: Int]()
    
    for char in t {
        charCount[char, default: 0] += 1
    }
    
    var left = 0
    var minLeft = 0
    var minLen = Int.max
    var count = t.count
    
    let sArray = Array(s)
    
    for (right, char) in sArray.enumerated() {
        if let val = charCount[char] {
            charCount[char] = val - 1
            if val > 0 {
                count -= 1
            }
        }
        
        while count == 0 {
            if right - left + 1 < minLen {
                minLeft = left
                minLen = right - left + 1
            }
            
            if let val = charCount[sArray[left]] {
                charCount[sArray[left]] = val + 1
                if val >= 0 {
                    count += 1
                }
            }
            
            left += 1
        }
    }
    
    return minLen == Int.max ? "" : String(sArray[minLeft..<minLeft + minLen])
}

// ამოცანა 3

func wordBreak(_ s: String, _ words: [String]) -> Bool {
    for word in words {
        if s.contains(word) {
            return true
        }
    }
    return false
}


// ამოცანა 4

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var frequencyMap = [Int: Int]()
    for num in nums {
        frequencyMap[num, default: 0] += 1
    }
    
    let sortedElements = frequencyMap.sorted { $0.value > $1.value }
    let topK = sortedElements.prefix(k)
    return topK.map { $0.key }
}



// ამოცანა 5

func findMinClassrooms(_ intervals: [[Int]]) -> Int {
    guard !intervals.isEmpty else {
        return 0
    }
    
    var startTimes = intervals.map { $0[0] }.sorted()
    var endTimes = intervals.map { $0[1] }.sorted()
    
    var start = 0
    var end = 0
    var rooms = 0
    
    while start < startTimes.count {
        if startTimes[start] < endTimes[end] {
            rooms += 1
        } else {
            end += 1
        }
        start += 1
    }
    
    return rooms
}
