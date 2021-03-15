const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer[number]"),
      cvc: formData.get("buyer[cvc]"),
      exp_month: formData.get("buyer[exp_month]"),
      exp_year: `20${formData.get("buyer[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("buyer_number").removeAttribute("name");
      document.getElementById("buyer_cvc").removeAttribute("name");
      document.getElementById("buyer_exp_month").removeAttribute("name");
      document.getElementById("buyer_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);