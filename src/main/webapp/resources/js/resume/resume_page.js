
document.addEventListener('DOMContentLoaded', function () {
    const tabs = document.querySelectorAll('.tab');
    const individualForm = document.getElementById('individualForm');
    const companyForm = document.getElementById('companyForm');
    const registerLinks = document.querySelectorAll('.register-link');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            if (tab.dataset.tab === 'enterprise') {
                individualForm.style.display = 'none';
                companyForm.style.display = 'block';
            } else {
                individualForm.style.display = 'block';
                companyForm.style.display = 'none';
            }
        });
    });
});
