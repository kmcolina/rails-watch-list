import 'jquery-bar-rating';

// const initStarsRating = () => {
//   $('#example').barrating({
//     theme: 'css-stars'
//   });
// };

// const initStarsRating = () => {
//   $('#review_rating').barrating({
//     theme: 'css-stars',
//     onSelect: (value, text, event) => {
//       const form = $("form.review_form"); // We are selecting the form on the page with its class
//       form.submit(); // We submit the form with javascript
//     }
//   });
// };


const initStarsRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};
export { initStarsRating };
