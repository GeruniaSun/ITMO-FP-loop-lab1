# **НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ ИТМО**

## Факультет программной инженерии и компьютерных технологий

### _функциональное программирование_

### **Лабораторная работа №1**

---

**выполнил:** Шнейдерис Герардас

**преподаватель:** Пенской Александр Владимирович

г. Санкт-Петербург

2026

## Задание

### [Задача 4](https://projecteuler.net/problem=4)

A palindromic number reads the same both ways. The largest palindrome made from the product of two $2$-digit numbers is $9009 = 91 \times 99$.

Find the largest palindrome made from the product of two $3$-digit numbers.

### [Задача 17](https://projecteuler.net/problem=17)

If the numbers $1$ to $5$ are written out in words: one, two, three, four, five, then there are $3 + 3 + 5 + 4 + 4 = 19$ letters used in total.

If all the numbers from $1$ to $1000$ (one thousand) inclusive were written out in words, how many letters would be used?

<b>NOTE:</b> Do not count spaces or hyphens. For example, $342$ (three hundred and forty-two) contains $23$ letters and $115$ (one hundred and fifteen) contains $20$ letters. The use of "and" when writing out numbers is in compliance with British usage.

## Реализация

- [задача 7](src/Problem4.hs): всопомогательная функция проверяет, что число палиндром, а решения это просто разные подоходы к генерации списка произведений 3-ех значных чисел
- [задача 24](src/Problem17.hs): массивы с названиями чисел и функция, которое переводит составное число в текст, решения просто по ращному генерят последовательности чиспел

### Выводы

**`Agda` очень сложная...**

благо в это году `Haskell`, а он гораздо приятней и понятней + по нему значительно больше контента.
Для этой лабы сделал несколько первых уроков в курсе на степике и прочитал главу про функции в книжке "Изучай Haskell во имя добра".

Мне всё понравилось.
