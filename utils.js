// 示例JavaScript文件 - 更新版本

/**
 * 简单的加法函数
 * @param {number} a - 第一个数字
 * @param {number} b - 第二个数字
 * @returns {number} 两数之和
 */
export function add(a, b) {
  return a + b;
}

/**
 * 简单的乘法函数
 * @param {number} a - 第一个数字
 * @param {number} b - 第二个数字
 * @returns {number} 两数之积
 */
export function multiply(a, b) {
  return a * b;
}

/**
 * 计算两数之差
 * @param {number} a - 被减数
 * @param {number} b - 减数
 * @returns {number} 两数之差
 */
export function subtract(a, b) {
  return a - b;
}

/**
 * 计算两数之商
 * @param {number} a - 被除数
 * @param {number} b - 除数
 * @returns {number} 两数之商
 */
export function divide(a, b) {
  if (b === 0) {
    throw new Error('除数不能为零');
  }
  return a / b;
}