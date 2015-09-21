describe "Foo", ->
  it "it is not bar", ->
    v = new Foo()
    expect(v.bar()).toEqual(false)

  it "processes a specified fixture", ->    
    my_fixture = $('<div>some HTML code here</div>')
    my_fixture.text("Hello Joost")
    expect($(my_fixture).text()).toEqual("Hello Joost")

#  it "loads a fixture that contains an id = my-fixture", ->
#    loadFixtures 'example_fixture.html'
#    $('#my-fixture').text("Hello Word")
#    expect($("#my-fixture")).toExist()

describe "Bar", ->
  it "it is not foo", ->
    v = new Bar()
    expect(v.foo()).toEqual(false)
    
#  it "loads a json fixture", ->
#    data = getJSONFixture('myjsonfixture.json')
#    expect(data.property1).toEqual("value1")
