/*
 * Created by Farouk MOHAMED on 07/10/2025 10:09
 * Copyright (c) 2025 | Cauridor. All rights reserved.
 * Last modified 07/10/2025 10:09
 */

class CountryData {
  final String name;
  final String countryCode;
  final List<String> nationalPrefixes;
  final List<int> possibleLengths;

  const CountryData({
    required this.name,
    required this.countryCode,
    required this.nationalPrefixes,
    required this.possibleLengths,
  });
}

const Map<String, CountryData> _countryByCode = {
  '1': CountryData(
      name: 'United States / Canada',
      countryCode: '1',
      nationalPrefixes: ['201', '202', '203', '212'],
      possibleLengths: [10]),
  '7': CountryData(
      name: 'Russia / Kazakhstan',
      countryCode: '7',
      nationalPrefixes: ['9'],
      possibleLengths: [10]),
  '20': CountryData(
      name: 'Egypt',
      countryCode: '20',
      nationalPrefixes: ['1'],
      possibleLengths: [9]),
  '27': CountryData(
      name: 'South Africa',
      countryCode: '27',
      nationalPrefixes: ['6', '7', '8'],
      possibleLengths: [9]),
  '30': CountryData(
      name: 'Greece',
      countryCode: '30',
      nationalPrefixes: ['6'],
      possibleLengths: [10]),
  '31': CountryData(
      name: 'Netherlands',
      countryCode: '31',
      nationalPrefixes: ['6'],
      possibleLengths: [9]),
  '32': CountryData(
      name: 'Belgium',
      countryCode: '32',
      nationalPrefixes: ['4'],
      possibleLengths: [8, 9]),
  '33': CountryData(
      name: 'France',
      countryCode: '33',
      nationalPrefixes: ['6', '7'],
      possibleLengths: [9]),
  '34': CountryData(
      name: 'Spain',
      countryCode: '34',
      nationalPrefixes: ['6', '7'],
      possibleLengths: [9]),
  '36': CountryData(
      name: 'Hungary',
      countryCode: '36',
      nationalPrefixes: ['20', '30'],
      possibleLengths: [8, 9]),
  '39': CountryData(
      name: 'Italy',
      countryCode: '39',
      nationalPrefixes: ['3'],
      possibleLengths: [9, 10]),
  '40': CountryData(
      name: 'Romania',
      countryCode: '40',
      nationalPrefixes: ['7'],
      possibleLengths: [9]),
  '41': CountryData(
      name: 'Switzerland',
      countryCode: '41',
      nationalPrefixes: ['7'],
      possibleLengths: [9]),
  '44': CountryData(
      name: 'United Kingdom',
      countryCode: '44',
      nationalPrefixes: ['7', '2'],
      possibleLengths: [10]),
  '49': CountryData(
      name: 'Germany',
      countryCode: '49',
      nationalPrefixes: ['15', '16', '17'],
      possibleLengths: [10, 11]),
  '55': CountryData(
      name: 'Brazil',
      countryCode: '55',
      nationalPrefixes: ['11', '21', '31'],
      possibleLengths: [10, 11]),
  '60': CountryData(
      name: 'Malaysia',
      countryCode: '60',
      nationalPrefixes: ['1'],
      possibleLengths: [8, 9, 10]),
  '61': CountryData(
      name: 'Australia',
      countryCode: '61',
      nationalPrefixes: ['4'],
      possibleLengths: [9]),
  '62': CountryData(
      name: 'Indonesia',
      countryCode: '62',
      nationalPrefixes: ['8'],
      possibleLengths: [10, 11]),
  '64': CountryData(
      name: 'New Zealand',
      countryCode: '64',
      nationalPrefixes: ['2'],
      possibleLengths: [8, 9]),
  '65': CountryData(
      name: 'Singapore',
      countryCode: '65',
      nationalPrefixes: ['8', '9'],
      possibleLengths: [8]),
  '66': CountryData(
      name: 'Thailand',
      countryCode: '66',
      nationalPrefixes: ['6', '8', '9'],
      possibleLengths: [8, 9]),
  '81': CountryData(
      name: 'Japan',
      countryCode: '81',
      nationalPrefixes: ['70', '80', '90'],
      possibleLengths: [10]),
  '82': CountryData(
      name: 'South Korea',
      countryCode: '82',
      nationalPrefixes: ['10', '11'],
      possibleLengths: [9, 10]),
  '84': CountryData(
      name: 'Vietnam',
      countryCode: '84',
      nationalPrefixes: ['3', '5', '7', '8', '9'],
      possibleLengths: [9, 10]),
  '86': CountryData(
      name: 'China',
      countryCode: '86',
      nationalPrefixes: ['13', '15', '18', '19'],
      possibleLengths: [11]),
  '91': CountryData(
      name: 'India',
      countryCode: '91',
      nationalPrefixes: ['6', '7', '8', '9'],
      possibleLengths: [10]),
  '212': CountryData(
      name: 'Morocco',
      countryCode: '212',
      nationalPrefixes: ['6', '7'],
      possibleLengths: [9]),
  '213': CountryData(
      name: 'Algeria',
      countryCode: '213',
      nationalPrefixes: ['5', '6', '7'],
      possibleLengths: [9]),
  '216': CountryData(
      name: 'Tunisia',
      countryCode: '216',
      nationalPrefixes: ['2', '5', '9'],
      possibleLengths: [8]),
  '221': CountryData(
      name: 'Senegal',
      countryCode: '221',
      nationalPrefixes: ['70', '71', '75', '76', '77', '78'],
      possibleLengths: [9]),
  '225': CountryData(
      name: 'Côte d’Ivoire',
      countryCode: '225',
      nationalPrefixes: ['01', '05', '07'],
      possibleLengths: [8, 9]),
  '234': CountryData(
      name: 'Nigeria',
      countryCode: '234',
      nationalPrefixes: ['70', '80', '81', '90'],
      possibleLengths: [10]),
  '237': CountryData(
      name: 'Cameroon',
      countryCode: '237',
      nationalPrefixes: ['6'],
      possibleLengths: [9]),
  '243': CountryData(
      name: 'Congo (DRC)',
      countryCode: '243',
      nationalPrefixes: ['8', '9'],
      possibleLengths: [9]),
  '250': CountryData(
      name: 'Rwanda',
      countryCode: '250',
      nationalPrefixes: ['7'],
      possibleLengths: [9]),
  '254': CountryData(
      name: 'Kenya',
      countryCode: '254',
      nationalPrefixes: ['7'],
      possibleLengths: [9]),
  '255': CountryData(
      name: 'Tanzania',
      countryCode: '255',
      nationalPrefixes: ['6', '7'],
      possibleLengths: [9]),
  '256': CountryData(
      name: 'Uganda',
      countryCode: '256',
      nationalPrefixes: ['7'],
      possibleLengths: [9]),
  '260': CountryData(
      name: 'Zambia',
      countryCode: '260',
      nationalPrefixes: ['9'],
      possibleLengths: [9]),
  '971': CountryData(
      name: 'United Arab Emirates',
      countryCode: '971',
      nationalPrefixes: ['50', '52', '54', '55'],
      possibleLengths: [9]),
  '972': CountryData(
      name: 'Israel',
      countryCode: '972',
      nationalPrefixes: ['5'],
      possibleLengths: [9]),
  '974': CountryData(
      name: 'Qatar',
      countryCode: '974',
      nationalPrefixes: ['3', '5', '6', '7'],
      possibleLengths: [8]),
  '966': CountryData(
      name: 'Saudi Arabia',
      countryCode: '966',
      nationalPrefixes: ['50', '53', '54'],
      possibleLengths: [9]),
  '998': CountryData(
      name: 'Uzbekistan',
      countryCode: '998',
      nationalPrefixes: ['9'],
      possibleLengths: [9])
};

Map<String, CountryData> get countryByCode => Map.unmodifiable(_countryByCode);
