describe( 'app main module', function() {
  beforeEach( module( 'app' ) );

  it( 'should have a dummy test', inject( function() {
    expect( true ).toBeTruthy();
  }));
});
