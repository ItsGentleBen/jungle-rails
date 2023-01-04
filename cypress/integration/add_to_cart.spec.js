
describe('add to cart', () => {

  it('can visit the homepage', () => {
    cy.visit('/')
  });

  it("displays 0 items in cart", () => {
    cy.contains("My Cart (0)").should("be.visible");
  });

  it("can add product to cart", () => {
    cy.get(".products article").first().find("button").click({ force: true });
  });

  it("displays 1 item in cart", () => {
    cy.contains("My Cart (1)").should("be.visible");
  });

})