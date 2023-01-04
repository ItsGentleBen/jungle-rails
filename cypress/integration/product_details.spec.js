describe('product details page', () => {

  it('can visit the homepage', () => {
    cy.visit('/')
  });

  it('can click product and visit the product detail page', () => {
    cy.get(".products article").first().click()
    cy.contains('Scented Blade')
  })

})