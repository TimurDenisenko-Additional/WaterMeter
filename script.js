const buttons = document.querySelectorAll(".toggle-input");
const inputContainers = document.querySelectorAll(".input-container");
const submitContainer = document.getElementById("submit-button-container");

let currentInput = null;

buttons.forEach(button => {
    button.addEventListener("click", () => {
        const targetId = button.getAttribute("data-target") + "-container";
        const targetContainer = document.getElementById(targetId);

        inputContainers.forEach(container => {
            if (container !== targetContainer) {
                container.classList.remove("active");
                container.style.maxHeight = "0";
                container.style.opacity = "0";
            }
        });

        if (targetContainer.classList.contains("active")) {
            targetContainer.classList.remove("active");
            targetContainer.style.maxHeight = "0";
            targetContainer.style.opacity = "0";
            submitContainer.innerHTML = "";
            currentInput = null;
        } else {
            targetContainer.classList.add("active");
            targetContainer.style.maxHeight = "100px";
            targetContainer.style.opacity = "1";
            currentInput = button.getAttribute("data-target");
            submitContainer.innerHTML = `
                <form method="get">
                    <input type="submit" value="Otsi" />
                </form>
            `;
        }
    });
});
