import customer_experience_service.promos;

function transformPromotion(promos:Promotion promotion, Product product) returns PromotionsResultItem|error => {
    productId: promotion.productId,
    originalPrice: product.price,
    validUntil: "Until " + check formatDateToWords(promotion.ends),
    label: product.name + " - " + promotion.percentage.toString() + "% OFF!",
    discountedPrice: product.price * (100 - promotion.percentage) / 100
};

function transformCustomer(RegistrationDetails registrationDetails) returns Customer => {
    phone: "-".'join(...registrationDetails.contact_number),
    loyalty: {points: 0, expiryDate: ""},
    name: registrationDetails.first_name + " " + registrationDetails.last_name,
    id: getNextId(),
    email: registrationDetails.email
};