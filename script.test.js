const { sum } = require('./script');

test('Функція sum правильно додає два числа', () => {
    expect(sum(2, 3)).toBe(5);
});
