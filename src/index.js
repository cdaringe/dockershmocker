var i = 0
function yarg () {
  ++i
  console.log('yaaarrg', i)
  setTimeout(() => {
    yarg()
  }, 1000);
}
yarg()
