class LIBSVMDatasetTest < Test::Unit::TestCase
  test(":note") do
    dataset = Datasets::LIBSVM.new("a1a", note: "testing")
    hash = {label: -1}
    n_features = 123
    n_features.times do |i|
      hash[i] = 0
    end
    [5, 7, 14, 19, 39, 40, 51, 63, 67, 73, 74, 76, 78, 83].each do |i|
      hash[i - 1] = 1
    end
    assert_equal(hash,
                 dataset.first.to_h)
  end

  test(":default_feature_value") do
    dataset = Datasets::LIBSVM.new("a1a", default_feature_value: nil)
    hash = {label: -1}
    n_features = 123
    n_features.times do |i|
      hash[i] = nil
    end
    [3, 11, 14, 19, 39, 42, 55, 64, 67, 73, 75, 76, 80, 83].each do |i|
      hash[i - 1] = 1
    end
    assert_equal(hash,
                 dataset.first.to_h)
  end

  test("classification") do
    dataset = Datasets::LIBSVM.new("a1a")
    hash = {label: -1}
    n_features = 123
    n_features.times do |i|
      hash[i] = 0
    end
    [3, 11, 14, 19, 39, 42, 55, 64, 67, 73, 75, 76, 80, 83].each do |i|
      hash[i - 1] = 1
    end
    assert_equal(hash,
                 dataset.first.to_h)
  end

  test("regression") do
    dataset = Datasets::LIBSVM.new("abalone")
    hash = {label: 15}
    n_features = 8
    n_features.times do |i|
      hash[i] = 0
    end
    [
      [1, 1],
      [2, 0.455],
      [3, 0.365],
      [4, 0.095],
      [5, 0.514],
      [6, 0.2245],
      [7, 0.101],
      [8, 0.15],
    ].each do |i, value|
      hash[i - 1] = value
    end
    assert_equal(hash,
                 dataset.first.to_h)
  end

  test("multi-label") do
    dataset = Datasets::LIBSVM.new("mediamill (exp1)")
    hash = {label: [65, 67, 11, 31]}
    n_features = 120
    n_features.times do |i|
      hash[i] = 0
    end
    [
      [1, 0.380877],
      [2, 0.494079],
      [3, 0.540009],
      [4, 0.422926],
      [5, 0.158318],
      [6, 0.326975],
      [7, 0.390861],
      [8, 0.527121],
      [9, 0.254052],
      [10, 0.223731],
      [11, 0.040285],
      [12, 0.141133],
      [13, 0.112249],
      [14, 0.263171],
      [15, 0.147020],
      [16, 0.472414],
      [17, 0.592614],
      [18, 0.653138],
      [19, 0.499867],
      [20, 0.196520],
      [21, 0.403892],
      [22, 0.482395],
      [23, 0.619219],
      [24, 0.320346],
      [25, 0.281251],
      [26, 0.054750],
      [27, 0.180459],
      [28, 0.139964],
      [29, 0.319925],
      [30, 0.181216],
      [31, 0.364294],
      [32, 0.407211],
      [33, 0.368926],
      [34, 0.427661],
      [35, 0.211391],
      [36, 0.364345],
      [37, 0.370710],
      [38, 0.409107],
      [39, 0.289299],
      [40, 0.243053],
      [41, 0.063121],
      [42, 0.193587],
      [43, 0.158755],
      [44, 0.316054],
      [45, 0.197410],
      [46, 0.656168],
      [47, 0.678760],
      [48, 0.650831],
      [49, 0.674636],
      [50, 0.492428],
      [51, 0.623887],
      [52, 0.610622],
      [53, 0.678219],
      [54, 0.574774],
      [55, 0.523073],
      [56, 0.206804],
      [57, 0.496294],
      [58, 0.429221],
      [59, 0.586611],
      [60, 0.471550],
      [61, 0.284480],
      [62, 0.432466],
      [63, 0.498075],
      [64, 0.408141],
      [65, 0.102713],
      [66, 0.303028],
      [67, 0.309501],
      [68, 0.444855],
      [69, 0.191727],
      [70, 0.174895],
      [71, 0.034143],
      [72, 0.153099],
      [73, 0.068318],
      [74, 0.217020],
      [75, 0.099688],
      [76, 0.409862],
      [77, 0.561918],
      [78, 0.612031],
      [79, 0.514471],
      [80, 0.146015],
      [81, 0.398807],
      [82, 0.383295],
      [83, 0.548485],
      [84, 0.282937],
      [85, 0.252712],
      [86, 0.051008],
      [87, 0.223110],
      [88, 0.098112],
      [89, 0.299672],
      [90, 0.144873],
      [91, 0.308488],
      [92, 0.358478],
      [93, 0.352077],
      [94, 0.394686],
      [95, 0.157513],
      [96, 0.339370],
      [97, 0.321558],
      [98, 0.341373],
      [99, 0.247969],
      [100, 0.206070],
      [101, 0.061001],
      [102, 0.216793],
      [103, 0.112389],
      [104, 0.273648],
      [105, 0.152745],
      [106, 0.598081],
      [107, 0.621687],
      [108, 0.607213],
      [109, 0.644025],
      [110, 0.394948],
      [111, 0.593651],
      [112, 0.551529],
      [113, 0.574392],
      [114, 0.511032],
      [115, 0.463997],
      [116, 0.202034],
      [117, 0.492341],
      [118, 0.317983],
      [119, 0.547807],
      [120, 0.393778],
    ].each do |i, value|
      hash[i - 1] = value
    end
    assert_equal(hash,
                 dataset.first.to_h)
  end

  test("string") do
    # TODO
  end
end
