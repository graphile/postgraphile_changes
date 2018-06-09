# Results

PostGraphile v4 is now in beta! https://github.com/graphile/postgraphile/releases/tag/v4.0.0-beta.0

Below are the results of running various GraphQL queries against [a sample database](db/reset.sh), with everything running on a Mid-2011 iMac.

- Query: the GraphQL query that we execute
- Version: which version of PostGraphQL/PostGraphile are we using?
- Conc: concurrency - how many requests do we try and make the server process in parallel?
- req/s: average requests per second - the total number of requests divided by the total number of seconds
- Latency p50: the average response time queries gave (50th percentile - 50% of queries completed this fast or faster)
- Latency p90: 90% of queries completed within this duration
- Latency p99: 99% of queries completed within this duration
- Max RSS: the peak memory usage of the node process. ⚠️ This does not work with `v4 cluster` because it only monitors the parent process. ⚠️ Do not trust this figure, it was not polled with sufficient resolution to be reliable.

---

<table>
<thead><tr>
<th><b>Query</b></th>
<th>Version</th>
<th>Conc</th>
<th>req/s</th>
<th><b>latency p50</b></th>
<th><b>latency p90</b></th>
<th><b>latency p99</b></th>
<th><b>max RSS</b></th>
</tr></thead>
<tbody>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>1</td>
<td>9.59</td>
<td>104</td>
<td>108</td>
<td>111</td>
<td>72796</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>10</td>
<td>35.99</td>
<td>256</td>
<td>346</td>
<td>378</td>
<td>75952</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4</td>
<td>100</td>
<td>111.91</td>
<td>7</td>
<td>3431</td>
<td>3622</td>
<td>90700</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>17.65</td>
<td>56</td>
<td>57</td>
<td>65</td>
<td>38580</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>60.14</td>
<td>145</td>
<td>237</td>
<td>305</td>
<td>38980</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>111.31</td>
<td>251</td>
<td>2048</td>
<td>2391</td>
<td>40588</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>1</td>
<td>14.02</td>
<td>71</td>
<td>74</td>
<td>78</td>
<td>114408</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>10</td>
<td>47.17</td>
<td>186</td>
<td>311</td>
<td>378</td>
<td>128564</td>
</tr>
<tr><th>
<a href="./graphql/PopularThreads.graphql">PopularThreads</a>
</th>
<td>v3</td>
<td>100</td>
<td>69.28</td>
<td>580</td>
<td>3610</td>
<td>3913</td>
<td>207080</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>1</td>
<td>241.4</td>
<td>4</td>
<td>6</td>
<td>7</td>
<td>66880</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>10</td>
<td>412.46</td>
<td>22</td>
<td>35</td>
<td>48</td>
<td>77028</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4</td>
<td>100</td>
<td>524.53</td>
<td>165</td>
<td>281</td>
<td>304</td>
<td>93824</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>208.05</td>
<td>4</td>
<td>6</td>
<td>6</td>
<td>38236</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>520.44</td>
<td>15</td>
<td>37</td>
<td>47</td>
<td>38624</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>599.51</td>
<td>130</td>
<td>290</td>
<td>358</td>
<td>42488</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>1</td>
<td>140.08</td>
<td>7</td>
<td>9</td>
<td>11</td>
<td>97384</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>10</td>
<td>191.22</td>
<td>48</td>
<td>65</td>
<td>71</td>
<td>102760</td>
</tr>
<tr><th>
<a href="./graphql/ProfileView.graphql">ProfileView</a>
</th>
<td>v3</td>
<td>100</td>
<td>217.91</td>
<td>432</td>
<td>621</td>
<td>666</td>
<td>145500</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>1</td>
<td>212.21</td>
<td>4</td>
<td>7</td>
<td>7</td>
<td>73036</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>10</td>
<td>373.37</td>
<td>24</td>
<td>32</td>
<td>48</td>
<td>76408</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4</td>
<td>100</td>
<td>423.45</td>
<td>215</td>
<td>284</td>
<td>381</td>
<td>95192</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>184.27</td>
<td>5</td>
<td>7</td>
<td>9</td>
<td>38388</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>439.74</td>
<td>15</td>
<td>41</td>
<td>55</td>
<td>38776</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>621.82</td>
<td>143</td>
<td>179</td>
<td>232</td>
<td>42652</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>1</td>
<td>40.03</td>
<td>22</td>
<td>28</td>
<td>51</td>
<td>114396</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>10</td>
<td>71.22</td>
<td>137</td>
<td>173</td>
<td>192</td>
<td>123648</td>
</tr>
<tr><th>
<a href="./graphql/ThreadList.graphql">ThreadList</a>
</th>
<td>v3</td>
<td>100</td>
<td>109.06</td>
<td>588</td>
<td>1659</td>
<td>1703</td>
<td>213996</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>1</td>
<td>14.57</td>
<td>67</td>
<td>72</td>
<td>84</td>
<td>80736</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>10</td>
<td>30.49</td>
<td>318</td>
<td>412</td>
<td>433</td>
<td>91664</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4</td>
<td>100</td>
<td>41.76</td>
<td>2738</td>
<td>3102</td>
<td>3347</td>
<td>128780</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>14.88</td>
<td>67</td>
<td>68</td>
<td>72</td>
<td>38768</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>51.24</td>
<td>177</td>
<td>243</td>
<td>266</td>
<td>39180</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>91.46</td>
<td>1052</td>
<td>1929</td>
<td>2458</td>
<td>40784</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.89</td>
<td>519</td>
<td>563</td>
<td>573</td>
<td>327024</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>10</td>
<td>2.5</td>
<td>3981</td>
<td>4605</td>
<td>4968</td>
<td>479376</td>
</tr>
<tr><th>
<a href="./graphql/ThreadListHeavy.graphql">ThreadListHeavy</a>
</th>
<td>v3</td>
<td>100</td>
<td>6.96</td>
<td>94</td>
<td>58514</td>
<td>58789</td>
<td>1383072</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>1</td>
<td>132.9</td>
<td>7</td>
<td>9</td>
<td>10</td>
<td>80356</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>10</td>
<td>263.93</td>
<td>35</td>
<td>50</td>
<td>66</td>
<td>83088</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4</td>
<td>100</td>
<td>266.74</td>
<td>340</td>
<td>436</td>
<td>512</td>
<td>115088</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>108.41</td>
<td>9</td>
<td>11</td>
<td>12</td>
<td>39584</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>308.04</td>
<td>27</td>
<td>56</td>
<td>66</td>
<td>39968</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>406.16</td>
<td>199</td>
<td>413</td>
<td>469</td>
<td>44200</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>1</td>
<td>20.39</td>
<td>48</td>
<td>53</td>
<td>62</td>
<td>133972</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>10</td>
<td>28.74</td>
<td>340</td>
<td>403</td>
<td>497</td>
<td>147840</td>
</tr>
<tr><th>
<a href="./graphql/ThreadView.graphql">ThreadView</a>
</th>
<td>v3</td>
<td>100</td>
<td>54.79</td>
<td>258</td>
<td>3939</td>
<td>3999</td>
<td>320000</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>1</td>
<td>15.73</td>
<td>63</td>
<td>65</td>
<td>69</td>
<td>89652</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>10</td>
<td>27.54</td>
<td>354</td>
<td>407</td>
<td>449</td>
<td>98328</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4</td>
<td>100</td>
<td>27.66</td>
<td>3572</td>
<td>3936</td>
<td>4060</td>
<td>208564</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>1</td>
<td>15.47</td>
<td>64</td>
<td>66</td>
<td>69</td>
<td>38540</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>10</td>
<td>49.36</td>
<td>185</td>
<td>262</td>
<td>320</td>
<td>38944</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v4cluster</td>
<td>100</td>
<td>78.18</td>
<td>1373</td>
<td>2318</td>
<td>2446</td>
<td>40528</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>1</td>
<td>1.49</td>
<td>655</td>
<td>766</td>
<td>779</td>
<td>616648</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>10</td>
<td>1.85</td>
<td>5354</td>
<td>7015</td>
<td>8264</td>
<td>833760</td>
</tr>
<tr><th>
<a href="./graphql/ThreadViewWithEmoji.graphql">ThreadViewWithEmoji</a>
</th>
<td>v3</td>
<td>100</td>
<td>0.66</td>
<td>139149</td>
<td>176965</td>
<td>187951</td>
<td>2125772</td>
</tr>
</tbody>
</table>
