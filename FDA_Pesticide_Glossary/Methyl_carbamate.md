---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.110251, -1.069008, -3.587351, 1, 0, 0, 1,
-2.741176, -0.2338771, -2.745648, 1, 0.007843138, 0, 1,
-2.717813, -1.629482, -1.225891, 1, 0.01176471, 0, 1,
-2.632866, -1.619964, -1.208165, 1, 0.01960784, 0, 1,
-2.626758, 2.147839, -0.6398703, 1, 0.02352941, 0, 1,
-2.611619, 0.3696795, -0.1351277, 1, 0.03137255, 0, 1,
-2.591959, -0.02865379, -0.3659685, 1, 0.03529412, 0, 1,
-2.483392, -0.6907652, -1.975637, 1, 0.04313726, 0, 1,
-2.417653, -1.498451, -2.660601, 1, 0.04705882, 0, 1,
-2.390582, -0.5329759, -0.4485211, 1, 0.05490196, 0, 1,
-2.380903, -0.9182258, -1.197919, 1, 0.05882353, 0, 1,
-2.368933, -0.6400782, -1.604757, 1, 0.06666667, 0, 1,
-2.315972, -2.064253, -2.205281, 1, 0.07058824, 0, 1,
-2.300868, -0.7114675, -2.043985, 1, 0.07843138, 0, 1,
-2.26798, 0.1804222, -1.043332, 1, 0.08235294, 0, 1,
-2.252923, 0.4324968, -1.051547, 1, 0.09019608, 0, 1,
-2.237797, -0.7736553, -1.707458, 1, 0.09411765, 0, 1,
-2.232292, 1.214895, -2.182956, 1, 0.1019608, 0, 1,
-2.223911, 0.6855776, -1.380319, 1, 0.1098039, 0, 1,
-2.212981, 0.4414697, 1.108724, 1, 0.1137255, 0, 1,
-2.170834, -0.4882051, -0.8232425, 1, 0.1215686, 0, 1,
-2.165811, 1.608989, -0.8652597, 1, 0.1254902, 0, 1,
-2.139815, -1.309165, -1.730661, 1, 0.1333333, 0, 1,
-2.129121, 0.2923852, -1.136835, 1, 0.1372549, 0, 1,
-2.08184, -0.1451419, -1.637361, 1, 0.145098, 0, 1,
-2.047677, 0.1000085, -3.455599, 1, 0.1490196, 0, 1,
-2.04182, -1.880545, -2.08974, 1, 0.1568628, 0, 1,
-1.955464, -0.3880786, -2.00205, 1, 0.1607843, 0, 1,
-1.93318, 0.485527, 0.2818768, 1, 0.1686275, 0, 1,
-1.930359, 1.056299, -1.368515, 1, 0.172549, 0, 1,
-1.927195, 1.570845, -0.9694372, 1, 0.1803922, 0, 1,
-1.926319, -1.359373, -0.9833521, 1, 0.1843137, 0, 1,
-1.894483, -0.8017223, -1.589691, 1, 0.1921569, 0, 1,
-1.863608, -0.3077195, -1.003197, 1, 0.1960784, 0, 1,
-1.862681, -0.04846436, -0.984924, 1, 0.2039216, 0, 1,
-1.862037, 0.02035255, -1.477062, 1, 0.2117647, 0, 1,
-1.827171, 0.3945252, -1.735319, 1, 0.2156863, 0, 1,
-1.797641, -0.1247257, -1.567357, 1, 0.2235294, 0, 1,
-1.767, -1.071512, -2.359229, 1, 0.227451, 0, 1,
-1.759443, 0.4136021, -2.733623, 1, 0.2352941, 0, 1,
-1.74556, 1.569025, -0.9303943, 1, 0.2392157, 0, 1,
-1.745297, -0.7689539, -2.171446, 1, 0.2470588, 0, 1,
-1.74108, 1.105021, -2.164679, 1, 0.2509804, 0, 1,
-1.727042, -1.421943, -1.745982, 1, 0.2588235, 0, 1,
-1.693058, 0.02718472, -1.878719, 1, 0.2627451, 0, 1,
-1.688089, -0.9318655, -2.251297, 1, 0.2705882, 0, 1,
-1.685733, -0.533391, -2.448297, 1, 0.2745098, 0, 1,
-1.680053, -0.7249113, -1.438463, 1, 0.282353, 0, 1,
-1.663962, -0.7445676, -1.931406, 1, 0.2862745, 0, 1,
-1.658897, -0.152474, -2.269343, 1, 0.2941177, 0, 1,
-1.65138, -0.2391196, -1.733081, 1, 0.3019608, 0, 1,
-1.650355, -1.002935, -3.274392, 1, 0.3058824, 0, 1,
-1.643215, 0.7423365, -0.6247594, 1, 0.3137255, 0, 1,
-1.633506, 2.357269, 0.3726203, 1, 0.3176471, 0, 1,
-1.632825, -0.5116828, -1.687739, 1, 0.3254902, 0, 1,
-1.609934, 2.366639, -2.097992, 1, 0.3294118, 0, 1,
-1.600066, 1.314007, -1.925613, 1, 0.3372549, 0, 1,
-1.594434, -1.158126, -3.25938, 1, 0.3411765, 0, 1,
-1.593488, -0.7045775, -1.381284, 1, 0.3490196, 0, 1,
-1.593077, 1.800854, -1.223481, 1, 0.3529412, 0, 1,
-1.588013, 0.3325085, -1.123484, 1, 0.3607843, 0, 1,
-1.565462, -1.325879, -0.9824675, 1, 0.3647059, 0, 1,
-1.561361, 0.4620935, -1.093004, 1, 0.372549, 0, 1,
-1.559735, 1.781583, 0.8966576, 1, 0.3764706, 0, 1,
-1.557505, -0.7949251, -2.861606, 1, 0.3843137, 0, 1,
-1.552277, 0.6280485, 0.4071108, 1, 0.3882353, 0, 1,
-1.54956, -1.477716, -1.186917, 1, 0.3960784, 0, 1,
-1.503198, -0.8518016, -2.947269, 1, 0.4039216, 0, 1,
-1.499185, 0.7485268, -0.3207737, 1, 0.4078431, 0, 1,
-1.496819, 0.08203505, -1.68945, 1, 0.4156863, 0, 1,
-1.492486, -0.4332934, -1.37796, 1, 0.4196078, 0, 1,
-1.490972, -0.7568548, -2.073158, 1, 0.427451, 0, 1,
-1.490476, 0.07454799, -2.005916, 1, 0.4313726, 0, 1,
-1.480261, -0.09839409, -1.008943, 1, 0.4392157, 0, 1,
-1.476034, -0.6760191, -3.643841, 1, 0.4431373, 0, 1,
-1.467669, 0.8145453, -3.165897, 1, 0.4509804, 0, 1,
-1.466096, -1.097988, -3.404705, 1, 0.454902, 0, 1,
-1.457517, 1.242887, 0.02470343, 1, 0.4627451, 0, 1,
-1.453684, -0.5036418, -2.602359, 1, 0.4666667, 0, 1,
-1.449574, 0.307664, -1.160258, 1, 0.4745098, 0, 1,
-1.402094, 0.3549725, -1.223065, 1, 0.4784314, 0, 1,
-1.399091, 0.994662, -1.977828, 1, 0.4862745, 0, 1,
-1.396768, 1.11223, -0.1531765, 1, 0.4901961, 0, 1,
-1.396389, -1.352301, -3.458303, 1, 0.4980392, 0, 1,
-1.39245, 0.1305488, -1.791952, 1, 0.5058824, 0, 1,
-1.391216, 0.05323373, -0.8394511, 1, 0.509804, 0, 1,
-1.38834, 2.066962, -0.5248666, 1, 0.5176471, 0, 1,
-1.336828, 0.06764499, -1.204173, 1, 0.5215687, 0, 1,
-1.335525, 0.6099255, -0.09398583, 1, 0.5294118, 0, 1,
-1.334179, -1.9957, -2.941307, 1, 0.5333334, 0, 1,
-1.328032, 0.09543803, -1.133275, 1, 0.5411765, 0, 1,
-1.323813, 1.010989, -2.799774, 1, 0.5450981, 0, 1,
-1.323175, -0.4747024, -1.646248, 1, 0.5529412, 0, 1,
-1.313459, 0.7792198, 0.1439829, 1, 0.5568628, 0, 1,
-1.30587, -1.050465, -4.647211, 1, 0.5647059, 0, 1,
-1.303842, 0.6362835, -1.954745, 1, 0.5686275, 0, 1,
-1.300865, -0.864622, -2.452971, 1, 0.5764706, 0, 1,
-1.296245, -0.9140734, -4.455363, 1, 0.5803922, 0, 1,
-1.292375, 1.172603, -3.062042, 1, 0.5882353, 0, 1,
-1.260383, 0.3464015, -1.869885, 1, 0.5921569, 0, 1,
-1.256188, 0.8563114, -1.579706, 1, 0.6, 0, 1,
-1.24832, -0.4175962, -1.784012, 1, 0.6078432, 0, 1,
-1.246425, -1.536465, -3.199704, 1, 0.6117647, 0, 1,
-1.231926, -1.31105, -2.439951, 1, 0.6196079, 0, 1,
-1.22666, 0.1913707, -0.6923671, 1, 0.6235294, 0, 1,
-1.225384, 1.079674, -1.588817, 1, 0.6313726, 0, 1,
-1.222488, -1.106254, -1.356487, 1, 0.6352941, 0, 1,
-1.216852, 0.8778883, 0.3300339, 1, 0.6431373, 0, 1,
-1.216257, 0.130703, -3.335675, 1, 0.6470588, 0, 1,
-1.214187, 0.5896191, -2.8286, 1, 0.654902, 0, 1,
-1.212604, -1.018662, -2.092967, 1, 0.6588235, 0, 1,
-1.211895, 0.7935324, -0.8516968, 1, 0.6666667, 0, 1,
-1.208125, 1.045452, -1.90036, 1, 0.6705883, 0, 1,
-1.206928, 0.5709669, -0.779183, 1, 0.6784314, 0, 1,
-1.203273, 1.284733, -1.550046, 1, 0.682353, 0, 1,
-1.191039, 0.3157405, -0.1897278, 1, 0.6901961, 0, 1,
-1.189974, -0.346964, -1.216997, 1, 0.6941177, 0, 1,
-1.18944, -1.493575, -1.140386, 1, 0.7019608, 0, 1,
-1.188194, -0.0444905, -1.074709, 1, 0.7098039, 0, 1,
-1.18729, -0.4229162, -1.424738, 1, 0.7137255, 0, 1,
-1.166405, 1.25799, -1.242929, 1, 0.7215686, 0, 1,
-1.162785, -1.308227, -2.827954, 1, 0.7254902, 0, 1,
-1.160566, 1.579621, -0.7325474, 1, 0.7333333, 0, 1,
-1.160395, 1.719608, -1.418296, 1, 0.7372549, 0, 1,
-1.160275, 0.1556018, -1.534479, 1, 0.7450981, 0, 1,
-1.1571, -0.4702333, -1.753016, 1, 0.7490196, 0, 1,
-1.142524, 0.08207195, -0.6678643, 1, 0.7568628, 0, 1,
-1.131753, 0.6934758, -0.6835148, 1, 0.7607843, 0, 1,
-1.13117, -1.463276, -3.611812, 1, 0.7686275, 0, 1,
-1.12889, -1.102844, -0.9266202, 1, 0.772549, 0, 1,
-1.118211, 0.6335604, 0.1658821, 1, 0.7803922, 0, 1,
-1.112862, 0.5029037, -0.5373379, 1, 0.7843137, 0, 1,
-1.107306, 1.225147, -1.154979, 1, 0.7921569, 0, 1,
-1.10603, -0.2927542, -2.820407, 1, 0.7960784, 0, 1,
-1.101489, -0.6471568, -2.294124, 1, 0.8039216, 0, 1,
-1.100842, -0.5114803, -1.067499, 1, 0.8117647, 0, 1,
-1.100142, -1.653363, -1.977693, 1, 0.8156863, 0, 1,
-1.099629, 1.364015, 1.603964, 1, 0.8235294, 0, 1,
-1.097575, -0.9560331, -3.025377, 1, 0.827451, 0, 1,
-1.085694, 1.748082, -0.07161415, 1, 0.8352941, 0, 1,
-1.073253, 0.05424498, -0.410462, 1, 0.8392157, 0, 1,
-1.055522, -0.01065892, -2.554192, 1, 0.8470588, 0, 1,
-1.051738, -0.9430643, -2.906505, 1, 0.8509804, 0, 1,
-1.046213, 0.342503, -1.973314, 1, 0.8588235, 0, 1,
-1.045024, -0.3469557, -1.814166, 1, 0.8627451, 0, 1,
-1.041913, -0.8837137, -2.032321, 1, 0.8705882, 0, 1,
-1.036603, -0.7756271, -3.546074, 1, 0.8745098, 0, 1,
-1.035228, 0.6499614, -1.545164, 1, 0.8823529, 0, 1,
-1.030746, 1.828738, 0.1441953, 1, 0.8862745, 0, 1,
-1.027757, 0.2770332, -2.925879, 1, 0.8941177, 0, 1,
-1.024771, 1.182217, -1.060076, 1, 0.8980392, 0, 1,
-1.018573, -1.209499, -3.195764, 1, 0.9058824, 0, 1,
-1.004784, -0.02855104, -2.476334, 1, 0.9137255, 0, 1,
-1.002574, 0.4887268, 0.2303602, 1, 0.9176471, 0, 1,
-0.98944, 0.1429889, -0.720302, 1, 0.9254902, 0, 1,
-0.988094, 1.171578, 2.150271, 1, 0.9294118, 0, 1,
-0.9855198, 0.2588884, -0.9751768, 1, 0.9372549, 0, 1,
-0.9850319, -0.1375904, -0.4600158, 1, 0.9411765, 0, 1,
-0.9766447, -0.5904764, -2.339709, 1, 0.9490196, 0, 1,
-0.9752064, -1.141684, -2.33897, 1, 0.9529412, 0, 1,
-0.9746576, 0.5653379, -1.444518, 1, 0.9607843, 0, 1,
-0.9741752, -0.3029248, -2.150113, 1, 0.9647059, 0, 1,
-0.9730341, -0.8320431, -1.792717, 1, 0.972549, 0, 1,
-0.9707463, 0.9240456, -0.8341658, 1, 0.9764706, 0, 1,
-0.9639322, -0.449698, -3.382073, 1, 0.9843137, 0, 1,
-0.9626352, -1.354236, -2.850255, 1, 0.9882353, 0, 1,
-0.9517027, 1.486664, -1.060909, 1, 0.9960784, 0, 1,
-0.9498212, 1.875515, -1.067688, 0.9960784, 1, 0, 1,
-0.94915, 1.71542, 0.1392769, 0.9921569, 1, 0, 1,
-0.9491295, -0.5786715, -2.777183, 0.9843137, 1, 0, 1,
-0.9481421, -0.8246206, -1.737069, 0.9803922, 1, 0, 1,
-0.9317682, 0.03817355, -1.404336, 0.972549, 1, 0, 1,
-0.9304574, 0.9491436, -0.01869268, 0.9686275, 1, 0, 1,
-0.9218522, -1.550666, -3.134856, 0.9607843, 1, 0, 1,
-0.921719, 0.1138161, -1.941159, 0.9568627, 1, 0, 1,
-0.9204035, 0.5897853, -0.9376389, 0.9490196, 1, 0, 1,
-0.9200718, -0.9157833, -1.225941, 0.945098, 1, 0, 1,
-0.9147735, -1.203737, -0.05233086, 0.9372549, 1, 0, 1,
-0.9143047, 0.9712751, -0.2805185, 0.9333333, 1, 0, 1,
-0.9073668, -1.192474, -2.13156, 0.9254902, 1, 0, 1,
-0.9007928, 1.259725, 0.752326, 0.9215686, 1, 0, 1,
-0.8977879, -0.1014336, -2.083168, 0.9137255, 1, 0, 1,
-0.8911448, -0.3074388, -3.369905, 0.9098039, 1, 0, 1,
-0.8885185, -2.317897, -3.441741, 0.9019608, 1, 0, 1,
-0.8877605, -1.269477, -2.472021, 0.8941177, 1, 0, 1,
-0.8864388, -1.363124, -4.13232, 0.8901961, 1, 0, 1,
-0.8832268, 0.4111978, -0.04114604, 0.8823529, 1, 0, 1,
-0.8826945, -0.5271198, -0.1085258, 0.8784314, 1, 0, 1,
-0.8625849, -1.566835, -2.805241, 0.8705882, 1, 0, 1,
-0.8564227, 0.3170531, -1.669975, 0.8666667, 1, 0, 1,
-0.8550137, 0.7927555, 0.4514003, 0.8588235, 1, 0, 1,
-0.8546304, -0.4263007, -2.313873, 0.854902, 1, 0, 1,
-0.8539004, 0.8241723, -0.07086694, 0.8470588, 1, 0, 1,
-0.8490096, 2.631333, -1.584101, 0.8431373, 1, 0, 1,
-0.8467789, -0.7920768, -2.823093, 0.8352941, 1, 0, 1,
-0.8455572, 0.3962302, -2.118328, 0.8313726, 1, 0, 1,
-0.839609, 1.757315, 1.186028, 0.8235294, 1, 0, 1,
-0.8389168, -0.2596734, -2.955358, 0.8196079, 1, 0, 1,
-0.834172, -0.3639173, -1.491029, 0.8117647, 1, 0, 1,
-0.824609, 0.6003557, -1.395607, 0.8078431, 1, 0, 1,
-0.8212951, -0.6765515, -1.281458, 0.8, 1, 0, 1,
-0.8201258, 1.210828, -2.869241, 0.7921569, 1, 0, 1,
-0.8198278, 1.733646, -0.3081101, 0.7882353, 1, 0, 1,
-0.8186328, -0.565014, -2.951555, 0.7803922, 1, 0, 1,
-0.8109766, 2.650091, 0.1074046, 0.7764706, 1, 0, 1,
-0.8084226, 0.9470223, 0.3979485, 0.7686275, 1, 0, 1,
-0.8040712, -0.6276894, -3.45309, 0.7647059, 1, 0, 1,
-0.8015581, -0.7643459, -3.263928, 0.7568628, 1, 0, 1,
-0.7987189, 1.662917, -0.9543363, 0.7529412, 1, 0, 1,
-0.7834474, 0.3978038, -0.09124335, 0.7450981, 1, 0, 1,
-0.782263, -0.8887845, -2.338424, 0.7411765, 1, 0, 1,
-0.7741122, -0.3108299, -2.593712, 0.7333333, 1, 0, 1,
-0.768263, -0.4652624, -1.975415, 0.7294118, 1, 0, 1,
-0.7644795, -0.4812012, -1.777149, 0.7215686, 1, 0, 1,
-0.7575321, 0.9285544, -0.5724777, 0.7176471, 1, 0, 1,
-0.7570044, 1.767073, 0.9322726, 0.7098039, 1, 0, 1,
-0.7347434, -1.27092, -1.067039, 0.7058824, 1, 0, 1,
-0.7228453, -0.4561279, -1.910165, 0.6980392, 1, 0, 1,
-0.7211534, 0.5766951, -0.4958233, 0.6901961, 1, 0, 1,
-0.7142782, -0.392897, -1.133534, 0.6862745, 1, 0, 1,
-0.7114781, 0.4921939, 0.06518355, 0.6784314, 1, 0, 1,
-0.7049137, -0.803519, -1.955298, 0.6745098, 1, 0, 1,
-0.7048512, -1.171697, -3.241317, 0.6666667, 1, 0, 1,
-0.7025025, -0.7715921, -1.560942, 0.6627451, 1, 0, 1,
-0.7019737, 1.794798, 0.08296122, 0.654902, 1, 0, 1,
-0.7002175, 0.3067197, -1.611315, 0.6509804, 1, 0, 1,
-0.6950271, -1.439649, -2.332973, 0.6431373, 1, 0, 1,
-0.6930354, 0.3992276, -1.173787, 0.6392157, 1, 0, 1,
-0.6910544, -0.5631379, -3.695256, 0.6313726, 1, 0, 1,
-0.6896291, 0.7898482, -0.1548926, 0.627451, 1, 0, 1,
-0.687152, -0.9583565, -2.916776, 0.6196079, 1, 0, 1,
-0.6851256, -1.187901, -2.131014, 0.6156863, 1, 0, 1,
-0.6807838, -0.3112236, -2.604932, 0.6078432, 1, 0, 1,
-0.680568, -0.3944872, -1.471853, 0.6039216, 1, 0, 1,
-0.676245, 0.6909456, -0.334977, 0.5960785, 1, 0, 1,
-0.6757293, -1.330347, -1.190023, 0.5882353, 1, 0, 1,
-0.6736687, -0.0743182, -2.40066, 0.5843138, 1, 0, 1,
-0.6731071, 2.162498, -1.14059, 0.5764706, 1, 0, 1,
-0.6714453, 1.476549, -2.394699, 0.572549, 1, 0, 1,
-0.6559399, -0.1662785, -1.583398, 0.5647059, 1, 0, 1,
-0.6550046, 2.251192, -1.502759, 0.5607843, 1, 0, 1,
-0.6549755, -0.460201, -1.640473, 0.5529412, 1, 0, 1,
-0.6536022, 1.071035, 0.6691415, 0.5490196, 1, 0, 1,
-0.6530249, -0.1695313, -1.880454, 0.5411765, 1, 0, 1,
-0.6521581, -0.3489409, -1.083491, 0.5372549, 1, 0, 1,
-0.6520072, -0.2559001, -2.820261, 0.5294118, 1, 0, 1,
-0.6459416, 0.5960474, 0.3740663, 0.5254902, 1, 0, 1,
-0.641499, -1.430604, -1.693312, 0.5176471, 1, 0, 1,
-0.6378428, -0.6822382, -2.708569, 0.5137255, 1, 0, 1,
-0.6319759, -2.063477, -2.270389, 0.5058824, 1, 0, 1,
-0.6279939, 1.252273, -0.06096574, 0.5019608, 1, 0, 1,
-0.6217477, -2.147824, -2.283827, 0.4941176, 1, 0, 1,
-0.6189063, -0.1654, -3.219053, 0.4862745, 1, 0, 1,
-0.616587, 0.542582, 0.2731854, 0.4823529, 1, 0, 1,
-0.6081046, -0.3473123, -2.457325, 0.4745098, 1, 0, 1,
-0.6063427, 1.81798, 2.372465, 0.4705882, 1, 0, 1,
-0.6026102, 0.9724342, 0.2936085, 0.4627451, 1, 0, 1,
-0.5999568, -1.332403, -4.032439, 0.4588235, 1, 0, 1,
-0.5994081, -0.9066479, -2.082084, 0.4509804, 1, 0, 1,
-0.5993022, -0.8769363, -3.257852, 0.4470588, 1, 0, 1,
-0.5937257, 0.2626873, -0.9009049, 0.4392157, 1, 0, 1,
-0.5918051, 1.643064, 1.502327, 0.4352941, 1, 0, 1,
-0.5891432, -1.215989, -3.218405, 0.427451, 1, 0, 1,
-0.5883414, 0.07928915, -1.019943, 0.4235294, 1, 0, 1,
-0.5852122, 1.896737, -1.07045, 0.4156863, 1, 0, 1,
-0.58438, -1.488057, -2.417035, 0.4117647, 1, 0, 1,
-0.5815222, 0.239452, -1.414786, 0.4039216, 1, 0, 1,
-0.5812093, 0.640306, -1.802608, 0.3960784, 1, 0, 1,
-0.5722957, -1.207919, -1.325051, 0.3921569, 1, 0, 1,
-0.5697353, -0.2249494, -1.120659, 0.3843137, 1, 0, 1,
-0.5689922, 0.1727558, -0.01922015, 0.3803922, 1, 0, 1,
-0.5641225, -0.7612819, -2.351734, 0.372549, 1, 0, 1,
-0.5623645, -0.3468526, -2.182679, 0.3686275, 1, 0, 1,
-0.5570689, -0.9415768, -4.071826, 0.3607843, 1, 0, 1,
-0.556055, 0.276927, -2.056196, 0.3568628, 1, 0, 1,
-0.5538779, 0.8030667, -0.1187251, 0.3490196, 1, 0, 1,
-0.5525028, 0.9630111, -1.340248, 0.345098, 1, 0, 1,
-0.5506607, -0.02981699, -1.629751, 0.3372549, 1, 0, 1,
-0.5502185, 0.2487737, -1.305132, 0.3333333, 1, 0, 1,
-0.5483411, 0.8094682, 0.1874046, 0.3254902, 1, 0, 1,
-0.5441283, 0.2870368, -0.3963449, 0.3215686, 1, 0, 1,
-0.5433433, 0.0749481, -2.580539, 0.3137255, 1, 0, 1,
-0.5246739, 1.555434, 1.794082, 0.3098039, 1, 0, 1,
-0.5223597, -0.6297928, -0.8517247, 0.3019608, 1, 0, 1,
-0.5165009, -0.9354468, -3.092851, 0.2941177, 1, 0, 1,
-0.5159803, -0.7637062, -4.037226, 0.2901961, 1, 0, 1,
-0.5159234, 0.1824636, -0.8441105, 0.282353, 1, 0, 1,
-0.5079001, 0.6394705, 0.4924192, 0.2784314, 1, 0, 1,
-0.5074468, -0.9476917, -0.9007528, 0.2705882, 1, 0, 1,
-0.5073767, 0.2712107, -0.8764932, 0.2666667, 1, 0, 1,
-0.4955666, -0.2791822, -1.89827, 0.2588235, 1, 0, 1,
-0.4877362, -0.5369481, -2.1118, 0.254902, 1, 0, 1,
-0.4828475, 0.9319917, -0.05626518, 0.2470588, 1, 0, 1,
-0.4824615, 0.07012039, -0.8061592, 0.2431373, 1, 0, 1,
-0.4817255, 0.4623554, -1.628374, 0.2352941, 1, 0, 1,
-0.4801434, -1.310831, -3.824986, 0.2313726, 1, 0, 1,
-0.4787524, -0.1663258, -1.079425, 0.2235294, 1, 0, 1,
-0.4772893, 0.1337008, -1.449658, 0.2196078, 1, 0, 1,
-0.4764935, 0.3365602, 0.08270596, 0.2117647, 1, 0, 1,
-0.4683743, 0.8281526, -0.2503567, 0.2078431, 1, 0, 1,
-0.4664502, -0.6946923, -2.335696, 0.2, 1, 0, 1,
-0.4663518, 0.2149507, -1.917778, 0.1921569, 1, 0, 1,
-0.4653805, 1.056641, 1.252272, 0.1882353, 1, 0, 1,
-0.4636598, 1.812835, 0.8990012, 0.1803922, 1, 0, 1,
-0.4602424, 1.115361, -0.2356798, 0.1764706, 1, 0, 1,
-0.4590318, 0.9321218, 1.096792, 0.1686275, 1, 0, 1,
-0.4583626, 0.6157343, 0.3254401, 0.1647059, 1, 0, 1,
-0.4506381, -0.01915491, -2.865474, 0.1568628, 1, 0, 1,
-0.4492692, -0.1237751, -0.4120945, 0.1529412, 1, 0, 1,
-0.4410204, 0.1526832, 0.5022035, 0.145098, 1, 0, 1,
-0.4362662, 0.03258918, -0.6779276, 0.1411765, 1, 0, 1,
-0.4256922, -1.266835, -0.5662956, 0.1333333, 1, 0, 1,
-0.421959, -0.4048074, -1.039661, 0.1294118, 1, 0, 1,
-0.4197429, 0.8811035, -0.3747213, 0.1215686, 1, 0, 1,
-0.4164441, 0.9847677, -1.065628, 0.1176471, 1, 0, 1,
-0.4134489, -0.4576635, -2.686208, 0.1098039, 1, 0, 1,
-0.4121063, 0.03649322, -3.759712, 0.1058824, 1, 0, 1,
-0.409248, -0.6049627, -2.446108, 0.09803922, 1, 0, 1,
-0.4076149, 0.8648463, -0.4224667, 0.09019608, 1, 0, 1,
-0.4073358, 0.2768581, -1.18215, 0.08627451, 1, 0, 1,
-0.4068599, -1.111065, -1.17547, 0.07843138, 1, 0, 1,
-0.4033799, 0.4597828, -0.6465701, 0.07450981, 1, 0, 1,
-0.4033654, -0.3264253, -0.8576533, 0.06666667, 1, 0, 1,
-0.3987822, -0.7752762, -3.293968, 0.0627451, 1, 0, 1,
-0.3964897, -0.9412486, -1.749991, 0.05490196, 1, 0, 1,
-0.3947376, -0.472838, -2.456944, 0.05098039, 1, 0, 1,
-0.3935706, 0.7388893, -1.197518, 0.04313726, 1, 0, 1,
-0.3910986, 1.179733, 0.471121, 0.03921569, 1, 0, 1,
-0.3910249, 0.8880702, -0.07675679, 0.03137255, 1, 0, 1,
-0.3905553, 0.5113879, -2.024617, 0.02745098, 1, 0, 1,
-0.3902723, 0.1429689, -1.826939, 0.01960784, 1, 0, 1,
-0.3851222, -1.227384, -3.961259, 0.01568628, 1, 0, 1,
-0.3801855, 0.3668531, -2.827316, 0.007843138, 1, 0, 1,
-0.3766635, -0.03959789, -1.420315, 0.003921569, 1, 0, 1,
-0.3719887, -1.027508, -3.558041, 0, 1, 0.003921569, 1,
-0.3719011, -1.255771, -2.315765, 0, 1, 0.01176471, 1,
-0.3699023, -0.6282871, -4.61872, 0, 1, 0.01568628, 1,
-0.3635942, -1.294371, -3.692105, 0, 1, 0.02352941, 1,
-0.3563818, 0.05681447, -1.651604, 0, 1, 0.02745098, 1,
-0.3558718, 1.292914, 0.4494676, 0, 1, 0.03529412, 1,
-0.353196, 1.224515, -0.09060846, 0, 1, 0.03921569, 1,
-0.3526455, 0.3276074, -0.4633631, 0, 1, 0.04705882, 1,
-0.3517746, -0.1443749, -3.074996, 0, 1, 0.05098039, 1,
-0.34848, -0.2320425, -2.761066, 0, 1, 0.05882353, 1,
-0.3449236, -1.151587, -2.754935, 0, 1, 0.0627451, 1,
-0.3418573, -1.164357, -2.310191, 0, 1, 0.07058824, 1,
-0.340122, 0.5726441, -0.783913, 0, 1, 0.07450981, 1,
-0.3385214, -1.232818, -3.202371, 0, 1, 0.08235294, 1,
-0.3381639, -1.161407, -1.588482, 0, 1, 0.08627451, 1,
-0.3372593, -0.5888767, -1.174179, 0, 1, 0.09411765, 1,
-0.3360445, -0.5548766, -3.291622, 0, 1, 0.1019608, 1,
-0.3348981, -0.269416, -1.682497, 0, 1, 0.1058824, 1,
-0.3251135, -0.453163, -3.789745, 0, 1, 0.1137255, 1,
-0.3243318, 0.8164032, -0.5823395, 0, 1, 0.1176471, 1,
-0.3209408, -0.5380931, -1.236663, 0, 1, 0.1254902, 1,
-0.318651, 0.883387, -0.561611, 0, 1, 0.1294118, 1,
-0.3179291, -2.088604, -2.592049, 0, 1, 0.1372549, 1,
-0.3178098, -1.004519, -4.489582, 0, 1, 0.1411765, 1,
-0.3174548, 2.070163, 1.374538, 0, 1, 0.1490196, 1,
-0.3166098, -0.01981907, -1.276125, 0, 1, 0.1529412, 1,
-0.3087695, -0.2436389, -3.17347, 0, 1, 0.1607843, 1,
-0.3059458, -0.7795141, -3.328537, 0, 1, 0.1647059, 1,
-0.2969315, -0.4921877, -1.92251, 0, 1, 0.172549, 1,
-0.2940773, -1.823985, -2.249149, 0, 1, 0.1764706, 1,
-0.2933217, 0.335342, -0.2295334, 0, 1, 0.1843137, 1,
-0.2906478, 0.7967939, 0.09805955, 0, 1, 0.1882353, 1,
-0.2891485, -0.6020403, -1.427641, 0, 1, 0.1960784, 1,
-0.2891089, 0.8821893, -1.358006, 0, 1, 0.2039216, 1,
-0.289076, 0.5888181, -0.2369468, 0, 1, 0.2078431, 1,
-0.2870697, 1.071118, 0.2114829, 0, 1, 0.2156863, 1,
-0.2860082, -0.6390901, -2.289835, 0, 1, 0.2196078, 1,
-0.2837972, 0.2896158, -0.5860177, 0, 1, 0.227451, 1,
-0.2830896, 0.4486183, 0.2390386, 0, 1, 0.2313726, 1,
-0.2793247, 0.6672454, -2.729359, 0, 1, 0.2392157, 1,
-0.2778451, -1.070737, -1.617669, 0, 1, 0.2431373, 1,
-0.2774922, 0.6707247, -0.2962991, 0, 1, 0.2509804, 1,
-0.272958, 0.7467042, 0.1899262, 0, 1, 0.254902, 1,
-0.2712508, 2.657353, -0.6990933, 0, 1, 0.2627451, 1,
-0.2697312, 1.926096, -1.312418, 0, 1, 0.2666667, 1,
-0.2690323, -0.3491172, -1.338369, 0, 1, 0.2745098, 1,
-0.2685856, -1.056641, -3.80035, 0, 1, 0.2784314, 1,
-0.2677124, 0.1927763, -2.175815, 0, 1, 0.2862745, 1,
-0.2653643, -0.418539, -1.737757, 0, 1, 0.2901961, 1,
-0.2636648, -1.088963, -3.42974, 0, 1, 0.2980392, 1,
-0.2582948, 0.1157425, -1.601096, 0, 1, 0.3058824, 1,
-0.2494221, 1.484426, -0.6165185, 0, 1, 0.3098039, 1,
-0.2482157, -0.8190172, -4.202429, 0, 1, 0.3176471, 1,
-0.2468276, 1.890498, -0.8127351, 0, 1, 0.3215686, 1,
-0.2403135, 2.643171, -0.07714849, 0, 1, 0.3294118, 1,
-0.2373168, -0.6603944, -4.068729, 0, 1, 0.3333333, 1,
-0.2359297, 0.7801142, -1.45417, 0, 1, 0.3411765, 1,
-0.2356505, 0.7412975, -0.4786749, 0, 1, 0.345098, 1,
-0.2340088, 0.1155046, -1.456017, 0, 1, 0.3529412, 1,
-0.2318319, 0.9933009, -2.131611, 0, 1, 0.3568628, 1,
-0.2227185, 0.3985621, 0.1972722, 0, 1, 0.3647059, 1,
-0.2208599, -2.06584, -3.735583, 0, 1, 0.3686275, 1,
-0.2203009, 1.559728, -0.8456789, 0, 1, 0.3764706, 1,
-0.2192344, 0.1075381, -0.9000192, 0, 1, 0.3803922, 1,
-0.2173433, -0.693211, -3.534405, 0, 1, 0.3882353, 1,
-0.2162053, 0.7171902, -1.850586, 0, 1, 0.3921569, 1,
-0.2139824, 0.6763146, -0.8393657, 0, 1, 0.4, 1,
-0.2074695, 0.061083, -1.716544, 0, 1, 0.4078431, 1,
-0.2050564, 1.479199, -0.6623546, 0, 1, 0.4117647, 1,
-0.2028701, -0.4457375, -3.185931, 0, 1, 0.4196078, 1,
-0.2028417, -0.2568936, -4.579465, 0, 1, 0.4235294, 1,
-0.2015098, -0.8828927, -1.182077, 0, 1, 0.4313726, 1,
-0.2014337, 1.346217, -1.265055, 0, 1, 0.4352941, 1,
-0.2013635, 0.6630744, -1.364964, 0, 1, 0.4431373, 1,
-0.1992552, -1.687324, -3.810673, 0, 1, 0.4470588, 1,
-0.1988041, -0.6820434, -2.91466, 0, 1, 0.454902, 1,
-0.1976546, -1.65734, -4.06049, 0, 1, 0.4588235, 1,
-0.194781, -1.309618, -2.613777, 0, 1, 0.4666667, 1,
-0.194578, 0.7222523, 1.383233, 0, 1, 0.4705882, 1,
-0.1942777, 0.03726736, -1.38064, 0, 1, 0.4784314, 1,
-0.1925688, 0.1477122, -0.1763545, 0, 1, 0.4823529, 1,
-0.1924646, -0.4508894, -3.049128, 0, 1, 0.4901961, 1,
-0.1890235, -0.6850916, -3.889727, 0, 1, 0.4941176, 1,
-0.1797099, -0.8735654, -3.461227, 0, 1, 0.5019608, 1,
-0.1783457, 0.1241324, 2.706623, 0, 1, 0.509804, 1,
-0.1767253, 0.05348856, -2.315204, 0, 1, 0.5137255, 1,
-0.170495, -0.3438476, -3.67906, 0, 1, 0.5215687, 1,
-0.1689492, -0.07866421, -3.2184, 0, 1, 0.5254902, 1,
-0.1640285, 0.5187213, -1.077534, 0, 1, 0.5333334, 1,
-0.1621796, 0.08771397, -1.001346, 0, 1, 0.5372549, 1,
-0.1596183, -0.5857083, -0.9944198, 0, 1, 0.5450981, 1,
-0.1595916, 0.3001682, -0.9050249, 0, 1, 0.5490196, 1,
-0.1595237, 0.3423979, -1.190592, 0, 1, 0.5568628, 1,
-0.1506406, 0.3961902, -1.759216, 0, 1, 0.5607843, 1,
-0.14914, -0.2939559, -2.919391, 0, 1, 0.5686275, 1,
-0.1485548, -0.08335047, -2.56665, 0, 1, 0.572549, 1,
-0.1447609, 1.141653, -0.715266, 0, 1, 0.5803922, 1,
-0.1427841, 1.140135, 1.929185, 0, 1, 0.5843138, 1,
-0.1388018, -1.037734, -1.944951, 0, 1, 0.5921569, 1,
-0.1323832, -0.1191262, -1.92398, 0, 1, 0.5960785, 1,
-0.1313822, 0.1625, 0.01246237, 0, 1, 0.6039216, 1,
-0.1299388, -1.130265, -4.235146, 0, 1, 0.6117647, 1,
-0.1295146, 0.4582409, -1.07582, 0, 1, 0.6156863, 1,
-0.1280376, 0.1362973, -1.092806, 0, 1, 0.6235294, 1,
-0.1244433, -0.9937068, -4.165085, 0, 1, 0.627451, 1,
-0.1224969, 0.07349024, -1.883326, 0, 1, 0.6352941, 1,
-0.1208271, 0.5760109, 0.2048732, 0, 1, 0.6392157, 1,
-0.1145967, 0.5389626, 0.04598686, 0, 1, 0.6470588, 1,
-0.1106285, 0.9218716, 1.569591, 0, 1, 0.6509804, 1,
-0.1103872, -0.0600505, -0.8893132, 0, 1, 0.6588235, 1,
-0.108442, 0.8333895, -1.2315, 0, 1, 0.6627451, 1,
-0.1067241, 0.8564184, -1.358964, 0, 1, 0.6705883, 1,
-0.1060365, -0.07666536, -2.434147, 0, 1, 0.6745098, 1,
-0.1037298, 0.7367253, 0.5174084, 0, 1, 0.682353, 1,
-0.1037233, 0.9068117, -1.079771, 0, 1, 0.6862745, 1,
-0.09623838, -1.916398, -3.39886, 0, 1, 0.6941177, 1,
-0.09509493, 0.8431742, -0.247942, 0, 1, 0.7019608, 1,
-0.08441284, 1.095637, 0.1056279, 0, 1, 0.7058824, 1,
-0.08193418, 2.108435, -1.385875, 0, 1, 0.7137255, 1,
-0.08100756, 1.035913, -1.903664, 0, 1, 0.7176471, 1,
-0.08089434, -1.555497, -5.198252, 0, 1, 0.7254902, 1,
-0.07873246, 1.349932, 0.2871425, 0, 1, 0.7294118, 1,
-0.06989266, -1.674309, -2.496612, 0, 1, 0.7372549, 1,
-0.06358017, 0.704996, -1.01792, 0, 1, 0.7411765, 1,
-0.06173158, 0.307257, -0.1870171, 0, 1, 0.7490196, 1,
-0.05902678, -1.479914, -1.703632, 0, 1, 0.7529412, 1,
-0.05742727, -0.6190562, -3.769527, 0, 1, 0.7607843, 1,
-0.05659796, 0.1289597, 1.490065, 0, 1, 0.7647059, 1,
-0.05461753, -1.804223, -4.851886, 0, 1, 0.772549, 1,
-0.05256031, 1.520358, 0.8504676, 0, 1, 0.7764706, 1,
-0.04871251, -0.3571081, -2.180389, 0, 1, 0.7843137, 1,
-0.04856385, 0.7278703, -1.388101, 0, 1, 0.7882353, 1,
-0.0375926, 0.8199913, 0.7209841, 0, 1, 0.7960784, 1,
-0.032717, 0.3291776, -0.01421827, 0, 1, 0.8039216, 1,
-0.03240905, -1.244476, -2.835559, 0, 1, 0.8078431, 1,
-0.03214994, -0.503442, -2.620097, 0, 1, 0.8156863, 1,
-0.03208065, 0.4302737, -1.031963, 0, 1, 0.8196079, 1,
-0.03049256, -1.506207, -2.507404, 0, 1, 0.827451, 1,
-0.03047369, 0.3871509, -0.8322914, 0, 1, 0.8313726, 1,
-0.02423464, 0.2688204, 1.051775, 0, 1, 0.8392157, 1,
-0.02333396, -0.5440435, -3.795892, 0, 1, 0.8431373, 1,
-0.02060655, -0.1746989, -3.127119, 0, 1, 0.8509804, 1,
-0.01921305, 0.7164668, 0.2096666, 0, 1, 0.854902, 1,
-0.01812112, -1.071753, -1.028856, 0, 1, 0.8627451, 1,
-0.01404541, -0.4831577, -2.435855, 0, 1, 0.8666667, 1,
-0.01281891, -1.857659, -3.95745, 0, 1, 0.8745098, 1,
-0.008621881, 1.218337, -0.1857639, 0, 1, 0.8784314, 1,
-0.005755836, -1.472377, -2.064271, 0, 1, 0.8862745, 1,
-0.004901247, -0.1370287, -2.349557, 0, 1, 0.8901961, 1,
0.00216934, -0.7555398, 3.791801, 0, 1, 0.8980392, 1,
0.004524034, 2.310276, -2.189707, 0, 1, 0.9058824, 1,
0.01209481, -1.599665, 2.617019, 0, 1, 0.9098039, 1,
0.01412927, -0.2133946, 2.91765, 0, 1, 0.9176471, 1,
0.01424656, -1.44539, 3.621828, 0, 1, 0.9215686, 1,
0.01506255, -0.319658, 1.438275, 0, 1, 0.9294118, 1,
0.01508654, 0.9798853, 0.7637531, 0, 1, 0.9333333, 1,
0.01581407, -1.40347, 3.181341, 0, 1, 0.9411765, 1,
0.01630696, 2.561366, 0.9855468, 0, 1, 0.945098, 1,
0.02017391, 0.3720341, -1.031993, 0, 1, 0.9529412, 1,
0.02506555, -1.838431, 3.602525, 0, 1, 0.9568627, 1,
0.02737749, 1.138276, -0.7215526, 0, 1, 0.9647059, 1,
0.03516116, 0.004324693, 1.469124, 0, 1, 0.9686275, 1,
0.03719665, 0.2310268, 1.4779, 0, 1, 0.9764706, 1,
0.03884156, 0.8838201, -0.6724504, 0, 1, 0.9803922, 1,
0.04994754, 0.4822358, -1.197096, 0, 1, 0.9882353, 1,
0.05293627, 0.06592526, 1.124011, 0, 1, 0.9921569, 1,
0.05496845, -0.5344927, 1.6443, 0, 1, 1, 1,
0.05530878, 0.7237401, 1.323301, 0, 0.9921569, 1, 1,
0.06652104, 0.3216463, 2.99479, 0, 0.9882353, 1, 1,
0.0674044, -0.4713665, 0.8274155, 0, 0.9803922, 1, 1,
0.07718945, 1.12258, 1.792822, 0, 0.9764706, 1, 1,
0.07984459, 0.8444301, -0.2411422, 0, 0.9686275, 1, 1,
0.08135182, 0.2815391, 1.010158, 0, 0.9647059, 1, 1,
0.08303454, 1.278453, 0.1360696, 0, 0.9568627, 1, 1,
0.08345839, -0.3924777, 3.551375, 0, 0.9529412, 1, 1,
0.08643385, 0.2563995, -0.8357449, 0, 0.945098, 1, 1,
0.09055369, 0.5669428, -0.4325571, 0, 0.9411765, 1, 1,
0.0932603, 1.460411, -0.7377202, 0, 0.9333333, 1, 1,
0.09747048, 0.345669, -0.1148678, 0, 0.9294118, 1, 1,
0.1001661, -0.2195671, 5.230382, 0, 0.9215686, 1, 1,
0.1016944, -0.07725421, 2.826023, 0, 0.9176471, 1, 1,
0.1019154, 0.9669142, -0.4315516, 0, 0.9098039, 1, 1,
0.1101326, 0.07847065, 2.177854, 0, 0.9058824, 1, 1,
0.1112003, -0.654632, 3.598371, 0, 0.8980392, 1, 1,
0.1113188, -0.2158104, 3.366229, 0, 0.8901961, 1, 1,
0.1138687, -1.466608, 3.822279, 0, 0.8862745, 1, 1,
0.1157542, -0.6143662, 3.814417, 0, 0.8784314, 1, 1,
0.1159382, 1.973537, -2.462731, 0, 0.8745098, 1, 1,
0.117755, 1.262843, 0.1791729, 0, 0.8666667, 1, 1,
0.1186647, -1.23955, 2.85346, 0, 0.8627451, 1, 1,
0.123332, -1.709218, 4.240695, 0, 0.854902, 1, 1,
0.1234156, 1.063239, 0.888344, 0, 0.8509804, 1, 1,
0.1236313, -1.635403, 2.505291, 0, 0.8431373, 1, 1,
0.1256411, 0.5874622, -1.193322, 0, 0.8392157, 1, 1,
0.1259669, -0.0995357, 1.693576, 0, 0.8313726, 1, 1,
0.1302599, -1.048784, 1.96388, 0, 0.827451, 1, 1,
0.136769, 0.5021017, -0.1506045, 0, 0.8196079, 1, 1,
0.139476, -0.8585442, 3.632493, 0, 0.8156863, 1, 1,
0.140871, -1.061903, 2.727042, 0, 0.8078431, 1, 1,
0.1421596, -0.3225829, 1.112531, 0, 0.8039216, 1, 1,
0.1440789, -0.8856976, 4.5918, 0, 0.7960784, 1, 1,
0.1448917, 0.7471304, 1.737509, 0, 0.7882353, 1, 1,
0.1456311, 0.5361654, 0.6546975, 0, 0.7843137, 1, 1,
0.1491681, 1.350388, 2.181164, 0, 0.7764706, 1, 1,
0.1491713, 0.2046626, 0.2250029, 0, 0.772549, 1, 1,
0.1494408, -0.5614269, 2.050451, 0, 0.7647059, 1, 1,
0.1503004, 1.084147, -1.969309, 0, 0.7607843, 1, 1,
0.1507357, 0.8020397, 1.532056, 0, 0.7529412, 1, 1,
0.1551926, 2.101936, -0.07759632, 0, 0.7490196, 1, 1,
0.1567078, 0.002433016, 0.9311734, 0, 0.7411765, 1, 1,
0.1612531, 0.7258174, -0.7285146, 0, 0.7372549, 1, 1,
0.1632845, 1.140109, 1.078098, 0, 0.7294118, 1, 1,
0.1682706, -0.2030458, 2.780318, 0, 0.7254902, 1, 1,
0.1703222, 1.186546, -0.09968986, 0, 0.7176471, 1, 1,
0.1714058, -0.2476853, 0.6560088, 0, 0.7137255, 1, 1,
0.1733005, 0.1489285, 0.7599199, 0, 0.7058824, 1, 1,
0.1765305, -1.677389, 4.12485, 0, 0.6980392, 1, 1,
0.1792439, 0.001914352, 2.450581, 0, 0.6941177, 1, 1,
0.1820829, 1.130519, -0.9462629, 0, 0.6862745, 1, 1,
0.1826989, 0.6608979, -0.1050948, 0, 0.682353, 1, 1,
0.1833142, 1.329991, -0.5001853, 0, 0.6745098, 1, 1,
0.1835289, -0.06535679, 1.084505, 0, 0.6705883, 1, 1,
0.1840396, -0.3014835, 1.644567, 0, 0.6627451, 1, 1,
0.1843898, -1.313484, 2.782401, 0, 0.6588235, 1, 1,
0.1858365, 1.355778, 0.6871976, 0, 0.6509804, 1, 1,
0.1922865, 1.322132, -0.1849764, 0, 0.6470588, 1, 1,
0.1934143, 0.7324743, 0.1368544, 0, 0.6392157, 1, 1,
0.1936044, 0.1050616, 1.249665, 0, 0.6352941, 1, 1,
0.1937026, 0.3927994, -0.1031336, 0, 0.627451, 1, 1,
0.1969728, -0.1346847, 2.769844, 0, 0.6235294, 1, 1,
0.1988393, -0.03888492, 3.288793, 0, 0.6156863, 1, 1,
0.1991889, -0.7286566, 3.695779, 0, 0.6117647, 1, 1,
0.2001933, -0.08711874, 0.8475211, 0, 0.6039216, 1, 1,
0.2019764, -1.58232, 4.112822, 0, 0.5960785, 1, 1,
0.2105855, -0.5166332, 3.99139, 0, 0.5921569, 1, 1,
0.2113086, -0.7265604, 4.311428, 0, 0.5843138, 1, 1,
0.2145513, 1.495547, 0.3531063, 0, 0.5803922, 1, 1,
0.2161508, -0.8352627, 2.167203, 0, 0.572549, 1, 1,
0.2166857, -0.3421064, 2.698625, 0, 0.5686275, 1, 1,
0.2201988, -1.409528, 3.828414, 0, 0.5607843, 1, 1,
0.2202568, 1.40206, 1.012633, 0, 0.5568628, 1, 1,
0.2267782, 2.215092, 2.049442, 0, 0.5490196, 1, 1,
0.2281546, 0.7832062, -1.093373, 0, 0.5450981, 1, 1,
0.2282658, 0.1133382, 1.678274, 0, 0.5372549, 1, 1,
0.2294826, 0.3908229, 1.591681, 0, 0.5333334, 1, 1,
0.2329898, 0.6435843, -1.116838, 0, 0.5254902, 1, 1,
0.2340388, 0.4563867, 0.4164798, 0, 0.5215687, 1, 1,
0.2375683, 1.698493, 0.05265378, 0, 0.5137255, 1, 1,
0.2395439, 2.724141, -1.160053, 0, 0.509804, 1, 1,
0.2405228, 1.677341, 2.872941, 0, 0.5019608, 1, 1,
0.2427277, 0.7261527, 0.6622705, 0, 0.4941176, 1, 1,
0.2431499, 0.3846992, 1.1158, 0, 0.4901961, 1, 1,
0.2483651, -1.171569, 4.944948, 0, 0.4823529, 1, 1,
0.250537, -1.13405, 1.731137, 0, 0.4784314, 1, 1,
0.253217, -0.914036, 3.628572, 0, 0.4705882, 1, 1,
0.2629789, -0.2433172, 3.607654, 0, 0.4666667, 1, 1,
0.2689277, -0.4082409, -0.1570716, 0, 0.4588235, 1, 1,
0.2770762, 0.3812707, -0.4545813, 0, 0.454902, 1, 1,
0.2790164, 1.438375, -0.0548837, 0, 0.4470588, 1, 1,
0.2821021, -0.1278413, 0.7777726, 0, 0.4431373, 1, 1,
0.28715, -1.104142, 2.965761, 0, 0.4352941, 1, 1,
0.2886092, -1.114093, 3.411231, 0, 0.4313726, 1, 1,
0.288748, -2.931083, 2.702796, 0, 0.4235294, 1, 1,
0.289288, -0.7790037, 4.404827, 0, 0.4196078, 1, 1,
0.291284, 1.313886, -0.6842638, 0, 0.4117647, 1, 1,
0.2923793, -0.4608871, 2.279954, 0, 0.4078431, 1, 1,
0.2936733, -1.681462, 3.823152, 0, 0.4, 1, 1,
0.294714, -0.7283179, 3.37287, 0, 0.3921569, 1, 1,
0.2956778, 0.05868509, 2.693653, 0, 0.3882353, 1, 1,
0.2987072, -1.207541, 3.955702, 0, 0.3803922, 1, 1,
0.3049134, 1.025191, 1.435456, 0, 0.3764706, 1, 1,
0.3065161, 0.2831864, -0.1807746, 0, 0.3686275, 1, 1,
0.3067895, -0.2006308, 2.674841, 0, 0.3647059, 1, 1,
0.3086783, 0.4266839, 1.35919, 0, 0.3568628, 1, 1,
0.3113944, -0.1250753, 0.3919795, 0, 0.3529412, 1, 1,
0.3137361, 0.1667543, 1.256111, 0, 0.345098, 1, 1,
0.3141425, 0.6740729, -0.103268, 0, 0.3411765, 1, 1,
0.3159937, -0.3324496, 2.74341, 0, 0.3333333, 1, 1,
0.3194751, 1.291697, -2.255437, 0, 0.3294118, 1, 1,
0.3237032, -0.4696621, 2.110999, 0, 0.3215686, 1, 1,
0.3242089, -1.413189, 3.515464, 0, 0.3176471, 1, 1,
0.3249395, -0.3318608, 1.686008, 0, 0.3098039, 1, 1,
0.3309053, -2.216326, 2.269883, 0, 0.3058824, 1, 1,
0.3322218, 1.564505, -1.171348, 0, 0.2980392, 1, 1,
0.3375589, -0.3237412, 4.611706, 0, 0.2901961, 1, 1,
0.3419332, -1.450511, 3.936068, 0, 0.2862745, 1, 1,
0.3420997, -1.204101, 1.402036, 0, 0.2784314, 1, 1,
0.3451644, -1.917391, 3.294588, 0, 0.2745098, 1, 1,
0.3453571, -0.6563215, 3.702852, 0, 0.2666667, 1, 1,
0.3480688, 0.9477403, 1.319516, 0, 0.2627451, 1, 1,
0.3481694, -0.2216754, 0.6880576, 0, 0.254902, 1, 1,
0.3483607, 0.06873713, 2.692356, 0, 0.2509804, 1, 1,
0.3570026, 0.9585313, 0.2286459, 0, 0.2431373, 1, 1,
0.3576132, -0.2371617, 2.030828, 0, 0.2392157, 1, 1,
0.3578305, 0.5018323, 1.33023, 0, 0.2313726, 1, 1,
0.3579614, -1.421976, 4.012614, 0, 0.227451, 1, 1,
0.3601636, -1.53245, 3.831676, 0, 0.2196078, 1, 1,
0.3614279, 0.8630158, 1.426357, 0, 0.2156863, 1, 1,
0.3633124, 0.8791943, 0.7516226, 0, 0.2078431, 1, 1,
0.3648045, 0.9867234, -0.9821931, 0, 0.2039216, 1, 1,
0.368769, 0.7331056, 1.85107, 0, 0.1960784, 1, 1,
0.3696176, 0.6259842, 1.144772, 0, 0.1882353, 1, 1,
0.3756805, 0.2379992, 1.935515, 0, 0.1843137, 1, 1,
0.3811261, -0.4419847, 1.482797, 0, 0.1764706, 1, 1,
0.3825448, -0.594355, 4.152994, 0, 0.172549, 1, 1,
0.3851047, -1.452041, 3.81147, 0, 0.1647059, 1, 1,
0.3860282, -0.04485202, 2.540804, 0, 0.1607843, 1, 1,
0.3911788, 1.253606, -0.2669439, 0, 0.1529412, 1, 1,
0.3990359, 0.131145, 1.01256, 0, 0.1490196, 1, 1,
0.4012341, 0.4132232, 0.1316343, 0, 0.1411765, 1, 1,
0.409276, -0.2159469, 2.909112, 0, 0.1372549, 1, 1,
0.4128033, 0.4863036, 0.7107303, 0, 0.1294118, 1, 1,
0.4151621, 0.8085567, -0.9664102, 0, 0.1254902, 1, 1,
0.4176826, -1.084599, 1.653745, 0, 0.1176471, 1, 1,
0.4180947, 0.1766566, 1.147664, 0, 0.1137255, 1, 1,
0.4193378, -0.3730699, 2.824975, 0, 0.1058824, 1, 1,
0.4198285, -0.4735063, 2.006702, 0, 0.09803922, 1, 1,
0.4211391, 0.31015, 0.955146, 0, 0.09411765, 1, 1,
0.4224719, 3.23935, 0.5524917, 0, 0.08627451, 1, 1,
0.4297664, 2.254806, -0.6025081, 0, 0.08235294, 1, 1,
0.4311162, 0.6082651, 0.9297059, 0, 0.07450981, 1, 1,
0.4328483, 0.965659, 1.155771, 0, 0.07058824, 1, 1,
0.4359391, -0.7554463, 0.6166292, 0, 0.0627451, 1, 1,
0.441421, -0.5708324, 3.892511, 0, 0.05882353, 1, 1,
0.4449129, 0.3344008, 1.174906, 0, 0.05098039, 1, 1,
0.4465915, -0.4155564, 1.799179, 0, 0.04705882, 1, 1,
0.447113, 0.2406121, 1.729403, 0, 0.03921569, 1, 1,
0.4477161, 1.899112, 2.113223, 0, 0.03529412, 1, 1,
0.44927, -0.5690699, 1.274532, 0, 0.02745098, 1, 1,
0.4498309, -0.8962492, 3.622121, 0, 0.02352941, 1, 1,
0.4532929, -1.10546, 3.855148, 0, 0.01568628, 1, 1,
0.4610519, -0.4672451, 3.720418, 0, 0.01176471, 1, 1,
0.4624422, -1.748373, 2.198331, 0, 0.003921569, 1, 1,
0.4624688, 0.3661508, 0.9119824, 0.003921569, 0, 1, 1,
0.4631554, -0.1989649, 2.71623, 0.007843138, 0, 1, 1,
0.4705802, -0.5971956, 4.55319, 0.01568628, 0, 1, 1,
0.4734966, -0.9200466, 2.327632, 0.01960784, 0, 1, 1,
0.4750122, 0.2053756, 2.217056, 0.02745098, 0, 1, 1,
0.4784004, -0.2389813, 2.353417, 0.03137255, 0, 1, 1,
0.4964326, 0.8691296, 0.9733616, 0.03921569, 0, 1, 1,
0.4975958, -0.2419812, 0.8882491, 0.04313726, 0, 1, 1,
0.4978026, 0.5544776, -0.3263084, 0.05098039, 0, 1, 1,
0.4991622, -0.3354486, 1.438509, 0.05490196, 0, 1, 1,
0.5026813, -0.406593, 1.721924, 0.0627451, 0, 1, 1,
0.5055171, 1.957826, 0.4613156, 0.06666667, 0, 1, 1,
0.506546, 0.1373255, 1.452402, 0.07450981, 0, 1, 1,
0.5078746, -0.7313222, 2.956003, 0.07843138, 0, 1, 1,
0.509708, -1.426026, 2.902101, 0.08627451, 0, 1, 1,
0.5123858, -0.4027263, 2.660592, 0.09019608, 0, 1, 1,
0.5147027, 1.287422, 0.02410709, 0.09803922, 0, 1, 1,
0.5151845, 0.4374, 2.344763, 0.1058824, 0, 1, 1,
0.5155652, 0.439365, 1.901323, 0.1098039, 0, 1, 1,
0.5190698, -0.1055373, 1.320105, 0.1176471, 0, 1, 1,
0.521781, -0.2407898, 1.370735, 0.1215686, 0, 1, 1,
0.5223971, 0.423552, 1.021223, 0.1294118, 0, 1, 1,
0.5257336, -0.3723686, 2.484938, 0.1333333, 0, 1, 1,
0.5313605, 0.8758892, -0.3633116, 0.1411765, 0, 1, 1,
0.53158, 0.0436182, 2.881855, 0.145098, 0, 1, 1,
0.5324012, -0.3698081, 0.7910405, 0.1529412, 0, 1, 1,
0.533564, 0.5711708, 0.3182563, 0.1568628, 0, 1, 1,
0.5366128, 1.48863, -0.2293294, 0.1647059, 0, 1, 1,
0.5412254, 0.492481, 0.9649825, 0.1686275, 0, 1, 1,
0.5443673, 0.09902953, 0.4815789, 0.1764706, 0, 1, 1,
0.5487964, 0.1242526, 2.291032, 0.1803922, 0, 1, 1,
0.5529546, 0.6587273, 1.134915, 0.1882353, 0, 1, 1,
0.5537713, 1.19925, 0.09539902, 0.1921569, 0, 1, 1,
0.5541198, -0.8235889, 1.442037, 0.2, 0, 1, 1,
0.5560527, -0.4080713, 1.484069, 0.2078431, 0, 1, 1,
0.5647561, -0.2609239, 3.605537, 0.2117647, 0, 1, 1,
0.5653976, 0.2912957, 1.804013, 0.2196078, 0, 1, 1,
0.5674981, -0.2183586, 0.244869, 0.2235294, 0, 1, 1,
0.5691109, -0.4661941, 1.67578, 0.2313726, 0, 1, 1,
0.5712839, 0.8963917, -0.05868134, 0.2352941, 0, 1, 1,
0.5729297, 0.8020883, 1.014347, 0.2431373, 0, 1, 1,
0.5746306, -1.205224, 2.627056, 0.2470588, 0, 1, 1,
0.5747775, 0.02911491, 0.9959235, 0.254902, 0, 1, 1,
0.5796955, 0.7524363, 0.480125, 0.2588235, 0, 1, 1,
0.5820229, -1.317986, 2.887127, 0.2666667, 0, 1, 1,
0.5833215, -1.134099, 5.156686, 0.2705882, 0, 1, 1,
0.5834386, 0.2785828, 2.570997, 0.2784314, 0, 1, 1,
0.5871717, 1.656151, 0.9048709, 0.282353, 0, 1, 1,
0.5894581, 0.04775129, -0.693626, 0.2901961, 0, 1, 1,
0.5942397, -0.2211998, 0.9116982, 0.2941177, 0, 1, 1,
0.5975745, -1.627821, 3.042517, 0.3019608, 0, 1, 1,
0.5986643, 1.070454, 1.527647, 0.3098039, 0, 1, 1,
0.5989294, -1.399015, 1.287879, 0.3137255, 0, 1, 1,
0.5990176, -0.07069324, 0.9091106, 0.3215686, 0, 1, 1,
0.6014134, -0.05593471, 1.674576, 0.3254902, 0, 1, 1,
0.6029834, -0.1448897, 0.1923549, 0.3333333, 0, 1, 1,
0.6169093, -0.4245411, 0.7518165, 0.3372549, 0, 1, 1,
0.6192355, -1.78296, 3.170944, 0.345098, 0, 1, 1,
0.622038, -0.632421, 1.717724, 0.3490196, 0, 1, 1,
0.6223135, -0.4587559, 3.114304, 0.3568628, 0, 1, 1,
0.6229838, 1.452954, 0.2782134, 0.3607843, 0, 1, 1,
0.6242438, -0.4442857, 3.732482, 0.3686275, 0, 1, 1,
0.6396101, 0.09218931, 1.507175, 0.372549, 0, 1, 1,
0.6501305, 0.03252924, 1.571576, 0.3803922, 0, 1, 1,
0.6517823, -0.662864, 3.444084, 0.3843137, 0, 1, 1,
0.661377, -0.8316108, 3.112753, 0.3921569, 0, 1, 1,
0.6684592, -0.1062166, 0.9401115, 0.3960784, 0, 1, 1,
0.6704234, 1.117277, -0.1291849, 0.4039216, 0, 1, 1,
0.6709526, -1.329936, 3.861835, 0.4117647, 0, 1, 1,
0.6743467, -1.935127, 1.836527, 0.4156863, 0, 1, 1,
0.6761299, -0.3880534, 2.950168, 0.4235294, 0, 1, 1,
0.6790425, 0.3112092, -0.405009, 0.427451, 0, 1, 1,
0.6792955, -0.1672098, 1.352817, 0.4352941, 0, 1, 1,
0.6807035, -1.714859, 2.490811, 0.4392157, 0, 1, 1,
0.6849089, -0.4384353, 2.009103, 0.4470588, 0, 1, 1,
0.687614, 1.794031, 0.04503557, 0.4509804, 0, 1, 1,
0.6894268, 1.374987, -0.7316873, 0.4588235, 0, 1, 1,
0.7026086, -0.2723055, 2.760827, 0.4627451, 0, 1, 1,
0.7073489, 0.141963, 0.9164701, 0.4705882, 0, 1, 1,
0.7120088, -0.6185081, 2.043909, 0.4745098, 0, 1, 1,
0.712774, 0.05460768, 1.946931, 0.4823529, 0, 1, 1,
0.7132021, 0.3821646, 2.282937, 0.4862745, 0, 1, 1,
0.7139059, -0.07232915, 1.976485, 0.4941176, 0, 1, 1,
0.7308578, -0.7741676, 2.215775, 0.5019608, 0, 1, 1,
0.7349855, -0.3217105, 2.726274, 0.5058824, 0, 1, 1,
0.7352247, 1.309581, -0.1202906, 0.5137255, 0, 1, 1,
0.7461377, 0.7589607, -0.2125275, 0.5176471, 0, 1, 1,
0.7474328, -1.531119, 2.355943, 0.5254902, 0, 1, 1,
0.7495379, 1.711951, 0.9828378, 0.5294118, 0, 1, 1,
0.7498941, -1.704691, 1.326973, 0.5372549, 0, 1, 1,
0.7512804, -0.5545073, 2.910402, 0.5411765, 0, 1, 1,
0.7523996, -1.44616, 2.645213, 0.5490196, 0, 1, 1,
0.7528912, 0.7363654, -0.2205342, 0.5529412, 0, 1, 1,
0.7570673, 0.8862374, -1.73047, 0.5607843, 0, 1, 1,
0.7595446, 0.05787181, -0.0910847, 0.5647059, 0, 1, 1,
0.7619267, -1.826562, 3.576529, 0.572549, 0, 1, 1,
0.7622958, -0.5559847, 1.24811, 0.5764706, 0, 1, 1,
0.7658486, -0.1553112, 1.922612, 0.5843138, 0, 1, 1,
0.7709244, 1.366865, 1.177287, 0.5882353, 0, 1, 1,
0.7775669, 1.551396, -0.02609086, 0.5960785, 0, 1, 1,
0.7791226, -1.078374, 4.076443, 0.6039216, 0, 1, 1,
0.7793394, 0.5818456, 0.3448079, 0.6078432, 0, 1, 1,
0.7793412, -1.693691, 2.248855, 0.6156863, 0, 1, 1,
0.7897741, 1.090143, 2.308495, 0.6196079, 0, 1, 1,
0.7915405, 1.167716, 2.035434, 0.627451, 0, 1, 1,
0.7924972, 0.3159384, 0.6565869, 0.6313726, 0, 1, 1,
0.7968758, -0.3039252, 3.137153, 0.6392157, 0, 1, 1,
0.8039089, 1.102331, 1.477736, 0.6431373, 0, 1, 1,
0.8079012, -0.7074652, 3.25079, 0.6509804, 0, 1, 1,
0.8085795, 0.4799933, 0.8212981, 0.654902, 0, 1, 1,
0.8130657, 1.787714, -0.06250255, 0.6627451, 0, 1, 1,
0.8142072, -0.1685373, 1.303112, 0.6666667, 0, 1, 1,
0.8146099, 0.966915, 1.895979, 0.6745098, 0, 1, 1,
0.817851, 0.1923202, 0.7473842, 0.6784314, 0, 1, 1,
0.8198615, -1.183764, 1.233847, 0.6862745, 0, 1, 1,
0.8261498, -0.4185136, 4.578629, 0.6901961, 0, 1, 1,
0.8284155, -1.335741, 2.436731, 0.6980392, 0, 1, 1,
0.8357693, -0.8622994, 1.556334, 0.7058824, 0, 1, 1,
0.8360208, 0.4492988, 1.605338, 0.7098039, 0, 1, 1,
0.8371992, -0.2932123, 1.482751, 0.7176471, 0, 1, 1,
0.8404656, -0.2525876, 0.5610862, 0.7215686, 0, 1, 1,
0.8421232, 1.113142, 0.4513239, 0.7294118, 0, 1, 1,
0.8449871, 0.519883, 0.3372759, 0.7333333, 0, 1, 1,
0.8454616, -0.5205774, 2.118834, 0.7411765, 0, 1, 1,
0.848035, 0.3041016, 2.730025, 0.7450981, 0, 1, 1,
0.8504141, 0.9601225, 1.54021, 0.7529412, 0, 1, 1,
0.8524595, 0.5624363, 1.434544, 0.7568628, 0, 1, 1,
0.8601226, -0.2820536, 1.725995, 0.7647059, 0, 1, 1,
0.8612863, -1.055016, 2.305817, 0.7686275, 0, 1, 1,
0.8626029, -0.2189495, 0.1688565, 0.7764706, 0, 1, 1,
0.8639946, -1.487778, 2.253025, 0.7803922, 0, 1, 1,
0.8697288, 0.8016245, 1.823696, 0.7882353, 0, 1, 1,
0.8708904, -0.5402745, -0.8568099, 0.7921569, 0, 1, 1,
0.8784376, -0.2325341, 0.4192224, 0.8, 0, 1, 1,
0.8859508, 1.383075, 0.6383704, 0.8078431, 0, 1, 1,
0.8910336, -1.025643, 1.595821, 0.8117647, 0, 1, 1,
0.8920764, 0.3931409, 1.241354, 0.8196079, 0, 1, 1,
0.8979352, -0.857851, 3.472599, 0.8235294, 0, 1, 1,
0.904392, 0.836261, 1.09212, 0.8313726, 0, 1, 1,
0.9079537, -0.5906096, 1.761417, 0.8352941, 0, 1, 1,
0.912613, 1.414903, 0.6832605, 0.8431373, 0, 1, 1,
0.9206977, -0.2762281, 2.330513, 0.8470588, 0, 1, 1,
0.9281585, -0.08929966, 1.584355, 0.854902, 0, 1, 1,
0.9297126, 0.2520117, 1.180362, 0.8588235, 0, 1, 1,
0.9350894, -0.4489223, 2.47352, 0.8666667, 0, 1, 1,
0.9450095, 0.8124562, 1.265579, 0.8705882, 0, 1, 1,
0.9465637, -0.3195038, 1.730414, 0.8784314, 0, 1, 1,
0.9486299, 0.6042239, -0.3808565, 0.8823529, 0, 1, 1,
0.9745166, 0.7904574, 0.3523951, 0.8901961, 0, 1, 1,
0.9766489, -1.215768, 0.9545004, 0.8941177, 0, 1, 1,
0.9815168, 0.3402385, -0.5460858, 0.9019608, 0, 1, 1,
0.9824278, -2.304878, 2.909627, 0.9098039, 0, 1, 1,
0.9840215, 0.821871, 2.322345, 0.9137255, 0, 1, 1,
0.994448, 1.0114, 3.171002, 0.9215686, 0, 1, 1,
1.014451, 1.362241, 0.4173699, 0.9254902, 0, 1, 1,
1.015644, -1.868832, 3.164348, 0.9333333, 0, 1, 1,
1.015969, -0.6365815, 1.931281, 0.9372549, 0, 1, 1,
1.017565, 1.380224, -0.8208382, 0.945098, 0, 1, 1,
1.017855, -0.8163137, 1.248659, 0.9490196, 0, 1, 1,
1.021662, 0.9513785, 2.145381, 0.9568627, 0, 1, 1,
1.024836, 0.658364, 2.350646, 0.9607843, 0, 1, 1,
1.027462, 0.3132168, 1.049059, 0.9686275, 0, 1, 1,
1.032043, -0.8380577, 2.63909, 0.972549, 0, 1, 1,
1.033154, 0.2841125, 1.148968, 0.9803922, 0, 1, 1,
1.034711, 0.0004891292, 1.277157, 0.9843137, 0, 1, 1,
1.041968, 0.637377, -0.6843715, 0.9921569, 0, 1, 1,
1.047835, 0.4328639, 1.300652, 0.9960784, 0, 1, 1,
1.049888, -0.4208972, 2.806839, 1, 0, 0.9960784, 1,
1.053744, -0.804028, 2.921599, 1, 0, 0.9882353, 1,
1.05869, -0.7915288, 3.003207, 1, 0, 0.9843137, 1,
1.059275, 0.8263946, 2.151917, 1, 0, 0.9764706, 1,
1.060707, 0.05304082, 0.8063122, 1, 0, 0.972549, 1,
1.067095, 0.6396138, 0.9087261, 1, 0, 0.9647059, 1,
1.070127, 0.1153604, 2.078615, 1, 0, 0.9607843, 1,
1.073489, 0.4965319, 1.670771, 1, 0, 0.9529412, 1,
1.073671, 1.165806, -0.1401843, 1, 0, 0.9490196, 1,
1.075858, -0.9409157, 3.737837, 1, 0, 0.9411765, 1,
1.08256, -0.002046255, 1.215258, 1, 0, 0.9372549, 1,
1.087812, -0.8156891, 1.128049, 1, 0, 0.9294118, 1,
1.099149, 2.222759, 2.167683, 1, 0, 0.9254902, 1,
1.100354, -0.06156278, 1.149437, 1, 0, 0.9176471, 1,
1.101143, 1.104624, 1.086212, 1, 0, 0.9137255, 1,
1.102839, -0.4319489, 0.9478672, 1, 0, 0.9058824, 1,
1.105183, -1.061615, 0.9359182, 1, 0, 0.9019608, 1,
1.10803, -0.6596214, 1.183909, 1, 0, 0.8941177, 1,
1.10953, 0.1662624, 0.2333804, 1, 0, 0.8862745, 1,
1.111153, 0.7321962, 0.4223405, 1, 0, 0.8823529, 1,
1.115178, -3.344083, 3.093244, 1, 0, 0.8745098, 1,
1.117591, 0.6551248, 2.684192, 1, 0, 0.8705882, 1,
1.117902, 0.4575617, -0.03081137, 1, 0, 0.8627451, 1,
1.119234, 1.224692, 0.7321628, 1, 0, 0.8588235, 1,
1.120627, 1.101132, 1.459803, 1, 0, 0.8509804, 1,
1.127545, 0.5997143, 1.866692, 1, 0, 0.8470588, 1,
1.146644, 1.605302, 0.4439366, 1, 0, 0.8392157, 1,
1.150948, -0.2503285, 0.6377292, 1, 0, 0.8352941, 1,
1.152497, -0.9938001, 1.792686, 1, 0, 0.827451, 1,
1.15392, -0.6057138, 0.315712, 1, 0, 0.8235294, 1,
1.154423, -1.112393, 2.811876, 1, 0, 0.8156863, 1,
1.160775, 0.8575426, 0.002015674, 1, 0, 0.8117647, 1,
1.169496, -0.1072329, 1.658426, 1, 0, 0.8039216, 1,
1.175604, -2.722184, 3.545475, 1, 0, 0.7960784, 1,
1.190497, -1.639375, 2.245547, 1, 0, 0.7921569, 1,
1.196107, -0.6704475, -1.065833, 1, 0, 0.7843137, 1,
1.20202, -0.991343, 1.594031, 1, 0, 0.7803922, 1,
1.204264, 1.469859, 1.389579, 1, 0, 0.772549, 1,
1.216684, 1.352198, 1.445038, 1, 0, 0.7686275, 1,
1.217227, 0.1938217, 0.5867993, 1, 0, 0.7607843, 1,
1.218059, 2.502899, 0.0402343, 1, 0, 0.7568628, 1,
1.220902, -0.1736941, 2.585759, 1, 0, 0.7490196, 1,
1.227817, 1.103674, 0.3360807, 1, 0, 0.7450981, 1,
1.22956, -0.124669, 2.081288, 1, 0, 0.7372549, 1,
1.235408, 1.309334, 0.4876999, 1, 0, 0.7333333, 1,
1.239654, -0.8097769, 2.797208, 1, 0, 0.7254902, 1,
1.244025, -1.116444, 3.472218, 1, 0, 0.7215686, 1,
1.248952, 0.5064455, 0.05288314, 1, 0, 0.7137255, 1,
1.256004, 2.164721, 0.2591341, 1, 0, 0.7098039, 1,
1.258852, 0.5185636, 3.264194, 1, 0, 0.7019608, 1,
1.259222, -0.3232026, 0.4987416, 1, 0, 0.6941177, 1,
1.268194, 0.4759442, 2.895445, 1, 0, 0.6901961, 1,
1.278957, 1.230296, 2.440317, 1, 0, 0.682353, 1,
1.284261, -0.8055168, 1.22097, 1, 0, 0.6784314, 1,
1.295967, 0.6278495, 0.1318496, 1, 0, 0.6705883, 1,
1.304755, -1.286659, 2.360651, 1, 0, 0.6666667, 1,
1.306272, 0.8986489, 0.5265917, 1, 0, 0.6588235, 1,
1.315768, 1.017424, 0.03350475, 1, 0, 0.654902, 1,
1.321846, 0.3944016, 1.189803, 1, 0, 0.6470588, 1,
1.330982, 1.700623, 0.1315166, 1, 0, 0.6431373, 1,
1.331486, 0.8355944, 1.043321, 1, 0, 0.6352941, 1,
1.333324, 1.040561, -1.868527, 1, 0, 0.6313726, 1,
1.336575, 1.652244, 0.2309343, 1, 0, 0.6235294, 1,
1.336805, -1.288296, 3.01752, 1, 0, 0.6196079, 1,
1.344467, -1.234083, 1.855188, 1, 0, 0.6117647, 1,
1.345664, -0.9217217, 2.84528, 1, 0, 0.6078432, 1,
1.346361, -0.1593072, 0.3497501, 1, 0, 0.6, 1,
1.347674, -0.2468915, 2.087179, 1, 0, 0.5921569, 1,
1.350175, -0.7435403, -0.01748652, 1, 0, 0.5882353, 1,
1.35086, 0.5907125, 2.422243, 1, 0, 0.5803922, 1,
1.366581, -0.7659337, 1.800506, 1, 0, 0.5764706, 1,
1.367139, -1.553464, 1.534143, 1, 0, 0.5686275, 1,
1.380435, 1.262345, -0.4540817, 1, 0, 0.5647059, 1,
1.381437, 0.8640886, 0.6348531, 1, 0, 0.5568628, 1,
1.383201, -1.138021, 1.495737, 1, 0, 0.5529412, 1,
1.383975, -0.4456551, 3.484623, 1, 0, 0.5450981, 1,
1.391492, 0.8469131, 0.4686022, 1, 0, 0.5411765, 1,
1.399855, -1.319839, 2.770377, 1, 0, 0.5333334, 1,
1.405413, 0.542536, 1.178856, 1, 0, 0.5294118, 1,
1.415472, 0.1735141, 1.403072, 1, 0, 0.5215687, 1,
1.421674, -0.4194317, 1.005792, 1, 0, 0.5176471, 1,
1.426982, 1.329668, -0.8972869, 1, 0, 0.509804, 1,
1.427468, -1.036189, 2.062073, 1, 0, 0.5058824, 1,
1.453173, -1.019124, 2.455715, 1, 0, 0.4980392, 1,
1.459414, 2.212852, 0.7052648, 1, 0, 0.4901961, 1,
1.46631, 1.014953, 1.661498, 1, 0, 0.4862745, 1,
1.477064, 0.06060407, 1.901965, 1, 0, 0.4784314, 1,
1.477398, -0.06018804, 2.971025, 1, 0, 0.4745098, 1,
1.49959, -0.7100382, 2.241902, 1, 0, 0.4666667, 1,
1.509956, 1.436051, 0.1337168, 1, 0, 0.4627451, 1,
1.515001, 1.22381, 0.108523, 1, 0, 0.454902, 1,
1.518828, 0.3632941, 1.082189, 1, 0, 0.4509804, 1,
1.527485, -0.7032233, 1.266375, 1, 0, 0.4431373, 1,
1.527787, 0.9130831, 0.3455223, 1, 0, 0.4392157, 1,
1.533989, 0.04474138, 2.32207, 1, 0, 0.4313726, 1,
1.535425, 3.409811, 0.1191884, 1, 0, 0.427451, 1,
1.545361, 0.5559046, 1.415354, 1, 0, 0.4196078, 1,
1.545505, -0.9728441, 1.775526, 1, 0, 0.4156863, 1,
1.554297, -1.064023, 3.11364, 1, 0, 0.4078431, 1,
1.563545, -0.4109439, 1.109307, 1, 0, 0.4039216, 1,
1.575021, 0.6594626, 2.197745, 1, 0, 0.3960784, 1,
1.57613, 0.9192874, 0.5534693, 1, 0, 0.3882353, 1,
1.584342, -0.7511195, 2.1879, 1, 0, 0.3843137, 1,
1.588035, -1.14482, 1.511492, 1, 0, 0.3764706, 1,
1.591488, -1.339645, 2.005286, 1, 0, 0.372549, 1,
1.59724, 1.385699, -0.1518219, 1, 0, 0.3647059, 1,
1.610901, -0.9883592, 2.945144, 1, 0, 0.3607843, 1,
1.612881, 0.3196406, 0.1435264, 1, 0, 0.3529412, 1,
1.62546, -2.207413, 1.681788, 1, 0, 0.3490196, 1,
1.645703, 0.4439325, 0.486809, 1, 0, 0.3411765, 1,
1.648705, -0.2072898, 1.560434, 1, 0, 0.3372549, 1,
1.648886, -0.8669428, 2.564344, 1, 0, 0.3294118, 1,
1.648978, 1.867968, 0.9171928, 1, 0, 0.3254902, 1,
1.654762, 0.2901373, 0.4346271, 1, 0, 0.3176471, 1,
1.655534, -1.349035, 0.6140645, 1, 0, 0.3137255, 1,
1.658194, -0.5463344, 3.674742, 1, 0, 0.3058824, 1,
1.704414, -0.1429207, 2.082304, 1, 0, 0.2980392, 1,
1.707021, 0.8729621, 0.8841515, 1, 0, 0.2941177, 1,
1.723889, -0.4881279, 1.992425, 1, 0, 0.2862745, 1,
1.741746, 0.4440408, 1.773221, 1, 0, 0.282353, 1,
1.743204, 0.7291125, 0.1253618, 1, 0, 0.2745098, 1,
1.754804, -0.6051289, 1.048189, 1, 0, 0.2705882, 1,
1.754839, -0.6997018, 3.051598, 1, 0, 0.2627451, 1,
1.757517, 0.1687884, 0.4296075, 1, 0, 0.2588235, 1,
1.762311, -0.3752386, 0.5893068, 1, 0, 0.2509804, 1,
1.769239, 0.2362781, 2.076815, 1, 0, 0.2470588, 1,
1.775102, -1.487294, 2.275901, 1, 0, 0.2392157, 1,
1.779616, 0.4959523, 0.09546617, 1, 0, 0.2352941, 1,
1.788926, -0.03686059, 1.195517, 1, 0, 0.227451, 1,
1.79097, 0.5219293, 0.8696691, 1, 0, 0.2235294, 1,
1.797375, -1.635249, 0.8738977, 1, 0, 0.2156863, 1,
1.799701, -0.5803618, 2.834097, 1, 0, 0.2117647, 1,
1.816691, 0.189965, 1.389396, 1, 0, 0.2039216, 1,
1.818383, -0.8623635, 4.05843, 1, 0, 0.1960784, 1,
1.848137, 0.2318414, 2.048866, 1, 0, 0.1921569, 1,
1.852444, -1.67585, -0.1497085, 1, 0, 0.1843137, 1,
1.853376, -1.510629, 3.766738, 1, 0, 0.1803922, 1,
1.854619, -0.381583, 1.319791, 1, 0, 0.172549, 1,
1.859656, -0.6344117, 3.003645, 1, 0, 0.1686275, 1,
1.869525, 0.5142299, -0.0009583813, 1, 0, 0.1607843, 1,
1.893044, -0.1660204, 2.5871, 1, 0, 0.1568628, 1,
1.89645, -0.169565, 2.101326, 1, 0, 0.1490196, 1,
1.902896, -0.2252253, 1.809459, 1, 0, 0.145098, 1,
1.92387, 0.7340648, 0.879659, 1, 0, 0.1372549, 1,
1.962819, -0.01264861, 1.921551, 1, 0, 0.1333333, 1,
1.965437, -1.868738, 3.24179, 1, 0, 0.1254902, 1,
1.973077, -0.4955943, 3.190593, 1, 0, 0.1215686, 1,
2.035762, 1.254725, -1.130569, 1, 0, 0.1137255, 1,
2.044343, -1.885175, 3.565181, 1, 0, 0.1098039, 1,
2.050447, 0.297746, 1.095536, 1, 0, 0.1019608, 1,
2.061458, 0.7924192, 0.8350447, 1, 0, 0.09411765, 1,
2.121812, 0.2516524, 0.7396935, 1, 0, 0.09019608, 1,
2.13659, -2.23267, -0.3298459, 1, 0, 0.08235294, 1,
2.273268, 1.186785, 1.413111, 1, 0, 0.07843138, 1,
2.289737, 0.8348539, 1.93323, 1, 0, 0.07058824, 1,
2.384408, -0.7049249, 1.1925, 1, 0, 0.06666667, 1,
2.389008, 2.627968, 1.184856, 1, 0, 0.05882353, 1,
2.395213, -1.577078, 2.427187, 1, 0, 0.05490196, 1,
2.481608, -0.6685517, 2.885957, 1, 0, 0.04705882, 1,
2.510493, -0.9092904, 3.336943, 1, 0, 0.04313726, 1,
2.590229, 0.1121235, 1.913898, 1, 0, 0.03529412, 1,
2.606338, -0.1030592, 1.27226, 1, 0, 0.03137255, 1,
2.661926, -0.424338, 1.556938, 1, 0, 0.02352941, 1,
2.736155, 1.133943, 1.511598, 1, 0, 0.01960784, 1,
2.836347, 0.07783383, 0.8776, 1, 0, 0.01176471, 1,
2.872481, 0.03439026, 1.045428, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.118885, -4.488868, -6.965906, 0, -0.5, 0.5, 0.5,
-0.118885, -4.488868, -6.965906, 1, -0.5, 0.5, 0.5,
-0.118885, -4.488868, -6.965906, 1, 1.5, 0.5, 0.5,
-0.118885, -4.488868, -6.965906, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.124325, 0.03286386, -6.965906, 0, -0.5, 0.5, 0.5,
-4.124325, 0.03286386, -6.965906, 1, -0.5, 0.5, 0.5,
-4.124325, 0.03286386, -6.965906, 1, 1.5, 0.5, 0.5,
-4.124325, 0.03286386, -6.965906, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.124325, -4.488868, 0.01606512, 0, -0.5, 0.5, 0.5,
-4.124325, -4.488868, 0.01606512, 1, -0.5, 0.5, 0.5,
-4.124325, -4.488868, 0.01606512, 1, 1.5, 0.5, 0.5,
-4.124325, -4.488868, 0.01606512, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.445392, -5.354681,
2, -3.445392, -5.354681,
-3, -3.445392, -5.354681,
-3, -3.619304, -5.623219,
-2, -3.445392, -5.354681,
-2, -3.619304, -5.623219,
-1, -3.445392, -5.354681,
-1, -3.619304, -5.623219,
0, -3.445392, -5.354681,
0, -3.619304, -5.623219,
1, -3.445392, -5.354681,
1, -3.619304, -5.623219,
2, -3.445392, -5.354681,
2, -3.619304, -5.623219
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.96713, -6.160294, 0, -0.5, 0.5, 0.5,
-3, -3.96713, -6.160294, 1, -0.5, 0.5, 0.5,
-3, -3.96713, -6.160294, 1, 1.5, 0.5, 0.5,
-3, -3.96713, -6.160294, 0, 1.5, 0.5, 0.5,
-2, -3.96713, -6.160294, 0, -0.5, 0.5, 0.5,
-2, -3.96713, -6.160294, 1, -0.5, 0.5, 0.5,
-2, -3.96713, -6.160294, 1, 1.5, 0.5, 0.5,
-2, -3.96713, -6.160294, 0, 1.5, 0.5, 0.5,
-1, -3.96713, -6.160294, 0, -0.5, 0.5, 0.5,
-1, -3.96713, -6.160294, 1, -0.5, 0.5, 0.5,
-1, -3.96713, -6.160294, 1, 1.5, 0.5, 0.5,
-1, -3.96713, -6.160294, 0, 1.5, 0.5, 0.5,
0, -3.96713, -6.160294, 0, -0.5, 0.5, 0.5,
0, -3.96713, -6.160294, 1, -0.5, 0.5, 0.5,
0, -3.96713, -6.160294, 1, 1.5, 0.5, 0.5,
0, -3.96713, -6.160294, 0, 1.5, 0.5, 0.5,
1, -3.96713, -6.160294, 0, -0.5, 0.5, 0.5,
1, -3.96713, -6.160294, 1, -0.5, 0.5, 0.5,
1, -3.96713, -6.160294, 1, 1.5, 0.5, 0.5,
1, -3.96713, -6.160294, 0, 1.5, 0.5, 0.5,
2, -3.96713, -6.160294, 0, -0.5, 0.5, 0.5,
2, -3.96713, -6.160294, 1, -0.5, 0.5, 0.5,
2, -3.96713, -6.160294, 1, 1.5, 0.5, 0.5,
2, -3.96713, -6.160294, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.199992, -3, -5.354681,
-3.199992, 3, -5.354681,
-3.199992, -3, -5.354681,
-3.354048, -3, -5.623219,
-3.199992, -2, -5.354681,
-3.354048, -2, -5.623219,
-3.199992, -1, -5.354681,
-3.354048, -1, -5.623219,
-3.199992, 0, -5.354681,
-3.354048, 0, -5.623219,
-3.199992, 1, -5.354681,
-3.354048, 1, -5.623219,
-3.199992, 2, -5.354681,
-3.354048, 2, -5.623219,
-3.199992, 3, -5.354681,
-3.354048, 3, -5.623219
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.662158, -3, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, -3, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, -3, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, -3, -6.160294, 0, 1.5, 0.5, 0.5,
-3.662158, -2, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, -2, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, -2, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, -2, -6.160294, 0, 1.5, 0.5, 0.5,
-3.662158, -1, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, -1, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, -1, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, -1, -6.160294, 0, 1.5, 0.5, 0.5,
-3.662158, 0, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, 0, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, 0, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, 0, -6.160294, 0, 1.5, 0.5, 0.5,
-3.662158, 1, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, 1, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, 1, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, 1, -6.160294, 0, 1.5, 0.5, 0.5,
-3.662158, 2, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, 2, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, 2, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, 2, -6.160294, 0, 1.5, 0.5, 0.5,
-3.662158, 3, -6.160294, 0, -0.5, 0.5, 0.5,
-3.662158, 3, -6.160294, 1, -0.5, 0.5, 0.5,
-3.662158, 3, -6.160294, 1, 1.5, 0.5, 0.5,
-3.662158, 3, -6.160294, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.199992, -3.445392, -4,
-3.199992, -3.445392, 4,
-3.199992, -3.445392, -4,
-3.354048, -3.619304, -4,
-3.199992, -3.445392, -2,
-3.354048, -3.619304, -2,
-3.199992, -3.445392, 0,
-3.354048, -3.619304, 0,
-3.199992, -3.445392, 2,
-3.354048, -3.619304, 2,
-3.199992, -3.445392, 4,
-3.354048, -3.619304, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.662158, -3.96713, -4, 0, -0.5, 0.5, 0.5,
-3.662158, -3.96713, -4, 1, -0.5, 0.5, 0.5,
-3.662158, -3.96713, -4, 1, 1.5, 0.5, 0.5,
-3.662158, -3.96713, -4, 0, 1.5, 0.5, 0.5,
-3.662158, -3.96713, -2, 0, -0.5, 0.5, 0.5,
-3.662158, -3.96713, -2, 1, -0.5, 0.5, 0.5,
-3.662158, -3.96713, -2, 1, 1.5, 0.5, 0.5,
-3.662158, -3.96713, -2, 0, 1.5, 0.5, 0.5,
-3.662158, -3.96713, 0, 0, -0.5, 0.5, 0.5,
-3.662158, -3.96713, 0, 1, -0.5, 0.5, 0.5,
-3.662158, -3.96713, 0, 1, 1.5, 0.5, 0.5,
-3.662158, -3.96713, 0, 0, 1.5, 0.5, 0.5,
-3.662158, -3.96713, 2, 0, -0.5, 0.5, 0.5,
-3.662158, -3.96713, 2, 1, -0.5, 0.5, 0.5,
-3.662158, -3.96713, 2, 1, 1.5, 0.5, 0.5,
-3.662158, -3.96713, 2, 0, 1.5, 0.5, 0.5,
-3.662158, -3.96713, 4, 0, -0.5, 0.5, 0.5,
-3.662158, -3.96713, 4, 1, -0.5, 0.5, 0.5,
-3.662158, -3.96713, 4, 1, 1.5, 0.5, 0.5,
-3.662158, -3.96713, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.199992, -3.445392, -5.354681,
-3.199992, 3.511119, -5.354681,
-3.199992, -3.445392, 5.386812,
-3.199992, 3.511119, 5.386812,
-3.199992, -3.445392, -5.354681,
-3.199992, -3.445392, 5.386812,
-3.199992, 3.511119, -5.354681,
-3.199992, 3.511119, 5.386812,
-3.199992, -3.445392, -5.354681,
2.962222, -3.445392, -5.354681,
-3.199992, -3.445392, 5.386812,
2.962222, -3.445392, 5.386812,
-3.199992, 3.511119, -5.354681,
2.962222, 3.511119, -5.354681,
-3.199992, 3.511119, 5.386812,
2.962222, 3.511119, 5.386812,
2.962222, -3.445392, -5.354681,
2.962222, 3.511119, -5.354681,
2.962222, -3.445392, 5.386812,
2.962222, 3.511119, 5.386812,
2.962222, -3.445392, -5.354681,
2.962222, -3.445392, 5.386812,
2.962222, 3.511119, -5.354681,
2.962222, 3.511119, 5.386812
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.58451;
var distance = 33.74434;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.118885, -0.03286386, -0.01606512 );
mvMatrix.scale( 1.330775, 1.178827, 0.7634432 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.74434);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methyl_carbamate<-read.table("Methyl_carbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methyl_carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
y<-Methyl_carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
z<-Methyl_carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_carbamate' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.110251, -1.069008, -3.587351, 0, 0, 1, 1, 1,
-2.741176, -0.2338771, -2.745648, 1, 0, 0, 1, 1,
-2.717813, -1.629482, -1.225891, 1, 0, 0, 1, 1,
-2.632866, -1.619964, -1.208165, 1, 0, 0, 1, 1,
-2.626758, 2.147839, -0.6398703, 1, 0, 0, 1, 1,
-2.611619, 0.3696795, -0.1351277, 1, 0, 0, 1, 1,
-2.591959, -0.02865379, -0.3659685, 0, 0, 0, 1, 1,
-2.483392, -0.6907652, -1.975637, 0, 0, 0, 1, 1,
-2.417653, -1.498451, -2.660601, 0, 0, 0, 1, 1,
-2.390582, -0.5329759, -0.4485211, 0, 0, 0, 1, 1,
-2.380903, -0.9182258, -1.197919, 0, 0, 0, 1, 1,
-2.368933, -0.6400782, -1.604757, 0, 0, 0, 1, 1,
-2.315972, -2.064253, -2.205281, 0, 0, 0, 1, 1,
-2.300868, -0.7114675, -2.043985, 1, 1, 1, 1, 1,
-2.26798, 0.1804222, -1.043332, 1, 1, 1, 1, 1,
-2.252923, 0.4324968, -1.051547, 1, 1, 1, 1, 1,
-2.237797, -0.7736553, -1.707458, 1, 1, 1, 1, 1,
-2.232292, 1.214895, -2.182956, 1, 1, 1, 1, 1,
-2.223911, 0.6855776, -1.380319, 1, 1, 1, 1, 1,
-2.212981, 0.4414697, 1.108724, 1, 1, 1, 1, 1,
-2.170834, -0.4882051, -0.8232425, 1, 1, 1, 1, 1,
-2.165811, 1.608989, -0.8652597, 1, 1, 1, 1, 1,
-2.139815, -1.309165, -1.730661, 1, 1, 1, 1, 1,
-2.129121, 0.2923852, -1.136835, 1, 1, 1, 1, 1,
-2.08184, -0.1451419, -1.637361, 1, 1, 1, 1, 1,
-2.047677, 0.1000085, -3.455599, 1, 1, 1, 1, 1,
-2.04182, -1.880545, -2.08974, 1, 1, 1, 1, 1,
-1.955464, -0.3880786, -2.00205, 1, 1, 1, 1, 1,
-1.93318, 0.485527, 0.2818768, 0, 0, 1, 1, 1,
-1.930359, 1.056299, -1.368515, 1, 0, 0, 1, 1,
-1.927195, 1.570845, -0.9694372, 1, 0, 0, 1, 1,
-1.926319, -1.359373, -0.9833521, 1, 0, 0, 1, 1,
-1.894483, -0.8017223, -1.589691, 1, 0, 0, 1, 1,
-1.863608, -0.3077195, -1.003197, 1, 0, 0, 1, 1,
-1.862681, -0.04846436, -0.984924, 0, 0, 0, 1, 1,
-1.862037, 0.02035255, -1.477062, 0, 0, 0, 1, 1,
-1.827171, 0.3945252, -1.735319, 0, 0, 0, 1, 1,
-1.797641, -0.1247257, -1.567357, 0, 0, 0, 1, 1,
-1.767, -1.071512, -2.359229, 0, 0, 0, 1, 1,
-1.759443, 0.4136021, -2.733623, 0, 0, 0, 1, 1,
-1.74556, 1.569025, -0.9303943, 0, 0, 0, 1, 1,
-1.745297, -0.7689539, -2.171446, 1, 1, 1, 1, 1,
-1.74108, 1.105021, -2.164679, 1, 1, 1, 1, 1,
-1.727042, -1.421943, -1.745982, 1, 1, 1, 1, 1,
-1.693058, 0.02718472, -1.878719, 1, 1, 1, 1, 1,
-1.688089, -0.9318655, -2.251297, 1, 1, 1, 1, 1,
-1.685733, -0.533391, -2.448297, 1, 1, 1, 1, 1,
-1.680053, -0.7249113, -1.438463, 1, 1, 1, 1, 1,
-1.663962, -0.7445676, -1.931406, 1, 1, 1, 1, 1,
-1.658897, -0.152474, -2.269343, 1, 1, 1, 1, 1,
-1.65138, -0.2391196, -1.733081, 1, 1, 1, 1, 1,
-1.650355, -1.002935, -3.274392, 1, 1, 1, 1, 1,
-1.643215, 0.7423365, -0.6247594, 1, 1, 1, 1, 1,
-1.633506, 2.357269, 0.3726203, 1, 1, 1, 1, 1,
-1.632825, -0.5116828, -1.687739, 1, 1, 1, 1, 1,
-1.609934, 2.366639, -2.097992, 1, 1, 1, 1, 1,
-1.600066, 1.314007, -1.925613, 0, 0, 1, 1, 1,
-1.594434, -1.158126, -3.25938, 1, 0, 0, 1, 1,
-1.593488, -0.7045775, -1.381284, 1, 0, 0, 1, 1,
-1.593077, 1.800854, -1.223481, 1, 0, 0, 1, 1,
-1.588013, 0.3325085, -1.123484, 1, 0, 0, 1, 1,
-1.565462, -1.325879, -0.9824675, 1, 0, 0, 1, 1,
-1.561361, 0.4620935, -1.093004, 0, 0, 0, 1, 1,
-1.559735, 1.781583, 0.8966576, 0, 0, 0, 1, 1,
-1.557505, -0.7949251, -2.861606, 0, 0, 0, 1, 1,
-1.552277, 0.6280485, 0.4071108, 0, 0, 0, 1, 1,
-1.54956, -1.477716, -1.186917, 0, 0, 0, 1, 1,
-1.503198, -0.8518016, -2.947269, 0, 0, 0, 1, 1,
-1.499185, 0.7485268, -0.3207737, 0, 0, 0, 1, 1,
-1.496819, 0.08203505, -1.68945, 1, 1, 1, 1, 1,
-1.492486, -0.4332934, -1.37796, 1, 1, 1, 1, 1,
-1.490972, -0.7568548, -2.073158, 1, 1, 1, 1, 1,
-1.490476, 0.07454799, -2.005916, 1, 1, 1, 1, 1,
-1.480261, -0.09839409, -1.008943, 1, 1, 1, 1, 1,
-1.476034, -0.6760191, -3.643841, 1, 1, 1, 1, 1,
-1.467669, 0.8145453, -3.165897, 1, 1, 1, 1, 1,
-1.466096, -1.097988, -3.404705, 1, 1, 1, 1, 1,
-1.457517, 1.242887, 0.02470343, 1, 1, 1, 1, 1,
-1.453684, -0.5036418, -2.602359, 1, 1, 1, 1, 1,
-1.449574, 0.307664, -1.160258, 1, 1, 1, 1, 1,
-1.402094, 0.3549725, -1.223065, 1, 1, 1, 1, 1,
-1.399091, 0.994662, -1.977828, 1, 1, 1, 1, 1,
-1.396768, 1.11223, -0.1531765, 1, 1, 1, 1, 1,
-1.396389, -1.352301, -3.458303, 1, 1, 1, 1, 1,
-1.39245, 0.1305488, -1.791952, 0, 0, 1, 1, 1,
-1.391216, 0.05323373, -0.8394511, 1, 0, 0, 1, 1,
-1.38834, 2.066962, -0.5248666, 1, 0, 0, 1, 1,
-1.336828, 0.06764499, -1.204173, 1, 0, 0, 1, 1,
-1.335525, 0.6099255, -0.09398583, 1, 0, 0, 1, 1,
-1.334179, -1.9957, -2.941307, 1, 0, 0, 1, 1,
-1.328032, 0.09543803, -1.133275, 0, 0, 0, 1, 1,
-1.323813, 1.010989, -2.799774, 0, 0, 0, 1, 1,
-1.323175, -0.4747024, -1.646248, 0, 0, 0, 1, 1,
-1.313459, 0.7792198, 0.1439829, 0, 0, 0, 1, 1,
-1.30587, -1.050465, -4.647211, 0, 0, 0, 1, 1,
-1.303842, 0.6362835, -1.954745, 0, 0, 0, 1, 1,
-1.300865, -0.864622, -2.452971, 0, 0, 0, 1, 1,
-1.296245, -0.9140734, -4.455363, 1, 1, 1, 1, 1,
-1.292375, 1.172603, -3.062042, 1, 1, 1, 1, 1,
-1.260383, 0.3464015, -1.869885, 1, 1, 1, 1, 1,
-1.256188, 0.8563114, -1.579706, 1, 1, 1, 1, 1,
-1.24832, -0.4175962, -1.784012, 1, 1, 1, 1, 1,
-1.246425, -1.536465, -3.199704, 1, 1, 1, 1, 1,
-1.231926, -1.31105, -2.439951, 1, 1, 1, 1, 1,
-1.22666, 0.1913707, -0.6923671, 1, 1, 1, 1, 1,
-1.225384, 1.079674, -1.588817, 1, 1, 1, 1, 1,
-1.222488, -1.106254, -1.356487, 1, 1, 1, 1, 1,
-1.216852, 0.8778883, 0.3300339, 1, 1, 1, 1, 1,
-1.216257, 0.130703, -3.335675, 1, 1, 1, 1, 1,
-1.214187, 0.5896191, -2.8286, 1, 1, 1, 1, 1,
-1.212604, -1.018662, -2.092967, 1, 1, 1, 1, 1,
-1.211895, 0.7935324, -0.8516968, 1, 1, 1, 1, 1,
-1.208125, 1.045452, -1.90036, 0, 0, 1, 1, 1,
-1.206928, 0.5709669, -0.779183, 1, 0, 0, 1, 1,
-1.203273, 1.284733, -1.550046, 1, 0, 0, 1, 1,
-1.191039, 0.3157405, -0.1897278, 1, 0, 0, 1, 1,
-1.189974, -0.346964, -1.216997, 1, 0, 0, 1, 1,
-1.18944, -1.493575, -1.140386, 1, 0, 0, 1, 1,
-1.188194, -0.0444905, -1.074709, 0, 0, 0, 1, 1,
-1.18729, -0.4229162, -1.424738, 0, 0, 0, 1, 1,
-1.166405, 1.25799, -1.242929, 0, 0, 0, 1, 1,
-1.162785, -1.308227, -2.827954, 0, 0, 0, 1, 1,
-1.160566, 1.579621, -0.7325474, 0, 0, 0, 1, 1,
-1.160395, 1.719608, -1.418296, 0, 0, 0, 1, 1,
-1.160275, 0.1556018, -1.534479, 0, 0, 0, 1, 1,
-1.1571, -0.4702333, -1.753016, 1, 1, 1, 1, 1,
-1.142524, 0.08207195, -0.6678643, 1, 1, 1, 1, 1,
-1.131753, 0.6934758, -0.6835148, 1, 1, 1, 1, 1,
-1.13117, -1.463276, -3.611812, 1, 1, 1, 1, 1,
-1.12889, -1.102844, -0.9266202, 1, 1, 1, 1, 1,
-1.118211, 0.6335604, 0.1658821, 1, 1, 1, 1, 1,
-1.112862, 0.5029037, -0.5373379, 1, 1, 1, 1, 1,
-1.107306, 1.225147, -1.154979, 1, 1, 1, 1, 1,
-1.10603, -0.2927542, -2.820407, 1, 1, 1, 1, 1,
-1.101489, -0.6471568, -2.294124, 1, 1, 1, 1, 1,
-1.100842, -0.5114803, -1.067499, 1, 1, 1, 1, 1,
-1.100142, -1.653363, -1.977693, 1, 1, 1, 1, 1,
-1.099629, 1.364015, 1.603964, 1, 1, 1, 1, 1,
-1.097575, -0.9560331, -3.025377, 1, 1, 1, 1, 1,
-1.085694, 1.748082, -0.07161415, 1, 1, 1, 1, 1,
-1.073253, 0.05424498, -0.410462, 0, 0, 1, 1, 1,
-1.055522, -0.01065892, -2.554192, 1, 0, 0, 1, 1,
-1.051738, -0.9430643, -2.906505, 1, 0, 0, 1, 1,
-1.046213, 0.342503, -1.973314, 1, 0, 0, 1, 1,
-1.045024, -0.3469557, -1.814166, 1, 0, 0, 1, 1,
-1.041913, -0.8837137, -2.032321, 1, 0, 0, 1, 1,
-1.036603, -0.7756271, -3.546074, 0, 0, 0, 1, 1,
-1.035228, 0.6499614, -1.545164, 0, 0, 0, 1, 1,
-1.030746, 1.828738, 0.1441953, 0, 0, 0, 1, 1,
-1.027757, 0.2770332, -2.925879, 0, 0, 0, 1, 1,
-1.024771, 1.182217, -1.060076, 0, 0, 0, 1, 1,
-1.018573, -1.209499, -3.195764, 0, 0, 0, 1, 1,
-1.004784, -0.02855104, -2.476334, 0, 0, 0, 1, 1,
-1.002574, 0.4887268, 0.2303602, 1, 1, 1, 1, 1,
-0.98944, 0.1429889, -0.720302, 1, 1, 1, 1, 1,
-0.988094, 1.171578, 2.150271, 1, 1, 1, 1, 1,
-0.9855198, 0.2588884, -0.9751768, 1, 1, 1, 1, 1,
-0.9850319, -0.1375904, -0.4600158, 1, 1, 1, 1, 1,
-0.9766447, -0.5904764, -2.339709, 1, 1, 1, 1, 1,
-0.9752064, -1.141684, -2.33897, 1, 1, 1, 1, 1,
-0.9746576, 0.5653379, -1.444518, 1, 1, 1, 1, 1,
-0.9741752, -0.3029248, -2.150113, 1, 1, 1, 1, 1,
-0.9730341, -0.8320431, -1.792717, 1, 1, 1, 1, 1,
-0.9707463, 0.9240456, -0.8341658, 1, 1, 1, 1, 1,
-0.9639322, -0.449698, -3.382073, 1, 1, 1, 1, 1,
-0.9626352, -1.354236, -2.850255, 1, 1, 1, 1, 1,
-0.9517027, 1.486664, -1.060909, 1, 1, 1, 1, 1,
-0.9498212, 1.875515, -1.067688, 1, 1, 1, 1, 1,
-0.94915, 1.71542, 0.1392769, 0, 0, 1, 1, 1,
-0.9491295, -0.5786715, -2.777183, 1, 0, 0, 1, 1,
-0.9481421, -0.8246206, -1.737069, 1, 0, 0, 1, 1,
-0.9317682, 0.03817355, -1.404336, 1, 0, 0, 1, 1,
-0.9304574, 0.9491436, -0.01869268, 1, 0, 0, 1, 1,
-0.9218522, -1.550666, -3.134856, 1, 0, 0, 1, 1,
-0.921719, 0.1138161, -1.941159, 0, 0, 0, 1, 1,
-0.9204035, 0.5897853, -0.9376389, 0, 0, 0, 1, 1,
-0.9200718, -0.9157833, -1.225941, 0, 0, 0, 1, 1,
-0.9147735, -1.203737, -0.05233086, 0, 0, 0, 1, 1,
-0.9143047, 0.9712751, -0.2805185, 0, 0, 0, 1, 1,
-0.9073668, -1.192474, -2.13156, 0, 0, 0, 1, 1,
-0.9007928, 1.259725, 0.752326, 0, 0, 0, 1, 1,
-0.8977879, -0.1014336, -2.083168, 1, 1, 1, 1, 1,
-0.8911448, -0.3074388, -3.369905, 1, 1, 1, 1, 1,
-0.8885185, -2.317897, -3.441741, 1, 1, 1, 1, 1,
-0.8877605, -1.269477, -2.472021, 1, 1, 1, 1, 1,
-0.8864388, -1.363124, -4.13232, 1, 1, 1, 1, 1,
-0.8832268, 0.4111978, -0.04114604, 1, 1, 1, 1, 1,
-0.8826945, -0.5271198, -0.1085258, 1, 1, 1, 1, 1,
-0.8625849, -1.566835, -2.805241, 1, 1, 1, 1, 1,
-0.8564227, 0.3170531, -1.669975, 1, 1, 1, 1, 1,
-0.8550137, 0.7927555, 0.4514003, 1, 1, 1, 1, 1,
-0.8546304, -0.4263007, -2.313873, 1, 1, 1, 1, 1,
-0.8539004, 0.8241723, -0.07086694, 1, 1, 1, 1, 1,
-0.8490096, 2.631333, -1.584101, 1, 1, 1, 1, 1,
-0.8467789, -0.7920768, -2.823093, 1, 1, 1, 1, 1,
-0.8455572, 0.3962302, -2.118328, 1, 1, 1, 1, 1,
-0.839609, 1.757315, 1.186028, 0, 0, 1, 1, 1,
-0.8389168, -0.2596734, -2.955358, 1, 0, 0, 1, 1,
-0.834172, -0.3639173, -1.491029, 1, 0, 0, 1, 1,
-0.824609, 0.6003557, -1.395607, 1, 0, 0, 1, 1,
-0.8212951, -0.6765515, -1.281458, 1, 0, 0, 1, 1,
-0.8201258, 1.210828, -2.869241, 1, 0, 0, 1, 1,
-0.8198278, 1.733646, -0.3081101, 0, 0, 0, 1, 1,
-0.8186328, -0.565014, -2.951555, 0, 0, 0, 1, 1,
-0.8109766, 2.650091, 0.1074046, 0, 0, 0, 1, 1,
-0.8084226, 0.9470223, 0.3979485, 0, 0, 0, 1, 1,
-0.8040712, -0.6276894, -3.45309, 0, 0, 0, 1, 1,
-0.8015581, -0.7643459, -3.263928, 0, 0, 0, 1, 1,
-0.7987189, 1.662917, -0.9543363, 0, 0, 0, 1, 1,
-0.7834474, 0.3978038, -0.09124335, 1, 1, 1, 1, 1,
-0.782263, -0.8887845, -2.338424, 1, 1, 1, 1, 1,
-0.7741122, -0.3108299, -2.593712, 1, 1, 1, 1, 1,
-0.768263, -0.4652624, -1.975415, 1, 1, 1, 1, 1,
-0.7644795, -0.4812012, -1.777149, 1, 1, 1, 1, 1,
-0.7575321, 0.9285544, -0.5724777, 1, 1, 1, 1, 1,
-0.7570044, 1.767073, 0.9322726, 1, 1, 1, 1, 1,
-0.7347434, -1.27092, -1.067039, 1, 1, 1, 1, 1,
-0.7228453, -0.4561279, -1.910165, 1, 1, 1, 1, 1,
-0.7211534, 0.5766951, -0.4958233, 1, 1, 1, 1, 1,
-0.7142782, -0.392897, -1.133534, 1, 1, 1, 1, 1,
-0.7114781, 0.4921939, 0.06518355, 1, 1, 1, 1, 1,
-0.7049137, -0.803519, -1.955298, 1, 1, 1, 1, 1,
-0.7048512, -1.171697, -3.241317, 1, 1, 1, 1, 1,
-0.7025025, -0.7715921, -1.560942, 1, 1, 1, 1, 1,
-0.7019737, 1.794798, 0.08296122, 0, 0, 1, 1, 1,
-0.7002175, 0.3067197, -1.611315, 1, 0, 0, 1, 1,
-0.6950271, -1.439649, -2.332973, 1, 0, 0, 1, 1,
-0.6930354, 0.3992276, -1.173787, 1, 0, 0, 1, 1,
-0.6910544, -0.5631379, -3.695256, 1, 0, 0, 1, 1,
-0.6896291, 0.7898482, -0.1548926, 1, 0, 0, 1, 1,
-0.687152, -0.9583565, -2.916776, 0, 0, 0, 1, 1,
-0.6851256, -1.187901, -2.131014, 0, 0, 0, 1, 1,
-0.6807838, -0.3112236, -2.604932, 0, 0, 0, 1, 1,
-0.680568, -0.3944872, -1.471853, 0, 0, 0, 1, 1,
-0.676245, 0.6909456, -0.334977, 0, 0, 0, 1, 1,
-0.6757293, -1.330347, -1.190023, 0, 0, 0, 1, 1,
-0.6736687, -0.0743182, -2.40066, 0, 0, 0, 1, 1,
-0.6731071, 2.162498, -1.14059, 1, 1, 1, 1, 1,
-0.6714453, 1.476549, -2.394699, 1, 1, 1, 1, 1,
-0.6559399, -0.1662785, -1.583398, 1, 1, 1, 1, 1,
-0.6550046, 2.251192, -1.502759, 1, 1, 1, 1, 1,
-0.6549755, -0.460201, -1.640473, 1, 1, 1, 1, 1,
-0.6536022, 1.071035, 0.6691415, 1, 1, 1, 1, 1,
-0.6530249, -0.1695313, -1.880454, 1, 1, 1, 1, 1,
-0.6521581, -0.3489409, -1.083491, 1, 1, 1, 1, 1,
-0.6520072, -0.2559001, -2.820261, 1, 1, 1, 1, 1,
-0.6459416, 0.5960474, 0.3740663, 1, 1, 1, 1, 1,
-0.641499, -1.430604, -1.693312, 1, 1, 1, 1, 1,
-0.6378428, -0.6822382, -2.708569, 1, 1, 1, 1, 1,
-0.6319759, -2.063477, -2.270389, 1, 1, 1, 1, 1,
-0.6279939, 1.252273, -0.06096574, 1, 1, 1, 1, 1,
-0.6217477, -2.147824, -2.283827, 1, 1, 1, 1, 1,
-0.6189063, -0.1654, -3.219053, 0, 0, 1, 1, 1,
-0.616587, 0.542582, 0.2731854, 1, 0, 0, 1, 1,
-0.6081046, -0.3473123, -2.457325, 1, 0, 0, 1, 1,
-0.6063427, 1.81798, 2.372465, 1, 0, 0, 1, 1,
-0.6026102, 0.9724342, 0.2936085, 1, 0, 0, 1, 1,
-0.5999568, -1.332403, -4.032439, 1, 0, 0, 1, 1,
-0.5994081, -0.9066479, -2.082084, 0, 0, 0, 1, 1,
-0.5993022, -0.8769363, -3.257852, 0, 0, 0, 1, 1,
-0.5937257, 0.2626873, -0.9009049, 0, 0, 0, 1, 1,
-0.5918051, 1.643064, 1.502327, 0, 0, 0, 1, 1,
-0.5891432, -1.215989, -3.218405, 0, 0, 0, 1, 1,
-0.5883414, 0.07928915, -1.019943, 0, 0, 0, 1, 1,
-0.5852122, 1.896737, -1.07045, 0, 0, 0, 1, 1,
-0.58438, -1.488057, -2.417035, 1, 1, 1, 1, 1,
-0.5815222, 0.239452, -1.414786, 1, 1, 1, 1, 1,
-0.5812093, 0.640306, -1.802608, 1, 1, 1, 1, 1,
-0.5722957, -1.207919, -1.325051, 1, 1, 1, 1, 1,
-0.5697353, -0.2249494, -1.120659, 1, 1, 1, 1, 1,
-0.5689922, 0.1727558, -0.01922015, 1, 1, 1, 1, 1,
-0.5641225, -0.7612819, -2.351734, 1, 1, 1, 1, 1,
-0.5623645, -0.3468526, -2.182679, 1, 1, 1, 1, 1,
-0.5570689, -0.9415768, -4.071826, 1, 1, 1, 1, 1,
-0.556055, 0.276927, -2.056196, 1, 1, 1, 1, 1,
-0.5538779, 0.8030667, -0.1187251, 1, 1, 1, 1, 1,
-0.5525028, 0.9630111, -1.340248, 1, 1, 1, 1, 1,
-0.5506607, -0.02981699, -1.629751, 1, 1, 1, 1, 1,
-0.5502185, 0.2487737, -1.305132, 1, 1, 1, 1, 1,
-0.5483411, 0.8094682, 0.1874046, 1, 1, 1, 1, 1,
-0.5441283, 0.2870368, -0.3963449, 0, 0, 1, 1, 1,
-0.5433433, 0.0749481, -2.580539, 1, 0, 0, 1, 1,
-0.5246739, 1.555434, 1.794082, 1, 0, 0, 1, 1,
-0.5223597, -0.6297928, -0.8517247, 1, 0, 0, 1, 1,
-0.5165009, -0.9354468, -3.092851, 1, 0, 0, 1, 1,
-0.5159803, -0.7637062, -4.037226, 1, 0, 0, 1, 1,
-0.5159234, 0.1824636, -0.8441105, 0, 0, 0, 1, 1,
-0.5079001, 0.6394705, 0.4924192, 0, 0, 0, 1, 1,
-0.5074468, -0.9476917, -0.9007528, 0, 0, 0, 1, 1,
-0.5073767, 0.2712107, -0.8764932, 0, 0, 0, 1, 1,
-0.4955666, -0.2791822, -1.89827, 0, 0, 0, 1, 1,
-0.4877362, -0.5369481, -2.1118, 0, 0, 0, 1, 1,
-0.4828475, 0.9319917, -0.05626518, 0, 0, 0, 1, 1,
-0.4824615, 0.07012039, -0.8061592, 1, 1, 1, 1, 1,
-0.4817255, 0.4623554, -1.628374, 1, 1, 1, 1, 1,
-0.4801434, -1.310831, -3.824986, 1, 1, 1, 1, 1,
-0.4787524, -0.1663258, -1.079425, 1, 1, 1, 1, 1,
-0.4772893, 0.1337008, -1.449658, 1, 1, 1, 1, 1,
-0.4764935, 0.3365602, 0.08270596, 1, 1, 1, 1, 1,
-0.4683743, 0.8281526, -0.2503567, 1, 1, 1, 1, 1,
-0.4664502, -0.6946923, -2.335696, 1, 1, 1, 1, 1,
-0.4663518, 0.2149507, -1.917778, 1, 1, 1, 1, 1,
-0.4653805, 1.056641, 1.252272, 1, 1, 1, 1, 1,
-0.4636598, 1.812835, 0.8990012, 1, 1, 1, 1, 1,
-0.4602424, 1.115361, -0.2356798, 1, 1, 1, 1, 1,
-0.4590318, 0.9321218, 1.096792, 1, 1, 1, 1, 1,
-0.4583626, 0.6157343, 0.3254401, 1, 1, 1, 1, 1,
-0.4506381, -0.01915491, -2.865474, 1, 1, 1, 1, 1,
-0.4492692, -0.1237751, -0.4120945, 0, 0, 1, 1, 1,
-0.4410204, 0.1526832, 0.5022035, 1, 0, 0, 1, 1,
-0.4362662, 0.03258918, -0.6779276, 1, 0, 0, 1, 1,
-0.4256922, -1.266835, -0.5662956, 1, 0, 0, 1, 1,
-0.421959, -0.4048074, -1.039661, 1, 0, 0, 1, 1,
-0.4197429, 0.8811035, -0.3747213, 1, 0, 0, 1, 1,
-0.4164441, 0.9847677, -1.065628, 0, 0, 0, 1, 1,
-0.4134489, -0.4576635, -2.686208, 0, 0, 0, 1, 1,
-0.4121063, 0.03649322, -3.759712, 0, 0, 0, 1, 1,
-0.409248, -0.6049627, -2.446108, 0, 0, 0, 1, 1,
-0.4076149, 0.8648463, -0.4224667, 0, 0, 0, 1, 1,
-0.4073358, 0.2768581, -1.18215, 0, 0, 0, 1, 1,
-0.4068599, -1.111065, -1.17547, 0, 0, 0, 1, 1,
-0.4033799, 0.4597828, -0.6465701, 1, 1, 1, 1, 1,
-0.4033654, -0.3264253, -0.8576533, 1, 1, 1, 1, 1,
-0.3987822, -0.7752762, -3.293968, 1, 1, 1, 1, 1,
-0.3964897, -0.9412486, -1.749991, 1, 1, 1, 1, 1,
-0.3947376, -0.472838, -2.456944, 1, 1, 1, 1, 1,
-0.3935706, 0.7388893, -1.197518, 1, 1, 1, 1, 1,
-0.3910986, 1.179733, 0.471121, 1, 1, 1, 1, 1,
-0.3910249, 0.8880702, -0.07675679, 1, 1, 1, 1, 1,
-0.3905553, 0.5113879, -2.024617, 1, 1, 1, 1, 1,
-0.3902723, 0.1429689, -1.826939, 1, 1, 1, 1, 1,
-0.3851222, -1.227384, -3.961259, 1, 1, 1, 1, 1,
-0.3801855, 0.3668531, -2.827316, 1, 1, 1, 1, 1,
-0.3766635, -0.03959789, -1.420315, 1, 1, 1, 1, 1,
-0.3719887, -1.027508, -3.558041, 1, 1, 1, 1, 1,
-0.3719011, -1.255771, -2.315765, 1, 1, 1, 1, 1,
-0.3699023, -0.6282871, -4.61872, 0, 0, 1, 1, 1,
-0.3635942, -1.294371, -3.692105, 1, 0, 0, 1, 1,
-0.3563818, 0.05681447, -1.651604, 1, 0, 0, 1, 1,
-0.3558718, 1.292914, 0.4494676, 1, 0, 0, 1, 1,
-0.353196, 1.224515, -0.09060846, 1, 0, 0, 1, 1,
-0.3526455, 0.3276074, -0.4633631, 1, 0, 0, 1, 1,
-0.3517746, -0.1443749, -3.074996, 0, 0, 0, 1, 1,
-0.34848, -0.2320425, -2.761066, 0, 0, 0, 1, 1,
-0.3449236, -1.151587, -2.754935, 0, 0, 0, 1, 1,
-0.3418573, -1.164357, -2.310191, 0, 0, 0, 1, 1,
-0.340122, 0.5726441, -0.783913, 0, 0, 0, 1, 1,
-0.3385214, -1.232818, -3.202371, 0, 0, 0, 1, 1,
-0.3381639, -1.161407, -1.588482, 0, 0, 0, 1, 1,
-0.3372593, -0.5888767, -1.174179, 1, 1, 1, 1, 1,
-0.3360445, -0.5548766, -3.291622, 1, 1, 1, 1, 1,
-0.3348981, -0.269416, -1.682497, 1, 1, 1, 1, 1,
-0.3251135, -0.453163, -3.789745, 1, 1, 1, 1, 1,
-0.3243318, 0.8164032, -0.5823395, 1, 1, 1, 1, 1,
-0.3209408, -0.5380931, -1.236663, 1, 1, 1, 1, 1,
-0.318651, 0.883387, -0.561611, 1, 1, 1, 1, 1,
-0.3179291, -2.088604, -2.592049, 1, 1, 1, 1, 1,
-0.3178098, -1.004519, -4.489582, 1, 1, 1, 1, 1,
-0.3174548, 2.070163, 1.374538, 1, 1, 1, 1, 1,
-0.3166098, -0.01981907, -1.276125, 1, 1, 1, 1, 1,
-0.3087695, -0.2436389, -3.17347, 1, 1, 1, 1, 1,
-0.3059458, -0.7795141, -3.328537, 1, 1, 1, 1, 1,
-0.2969315, -0.4921877, -1.92251, 1, 1, 1, 1, 1,
-0.2940773, -1.823985, -2.249149, 1, 1, 1, 1, 1,
-0.2933217, 0.335342, -0.2295334, 0, 0, 1, 1, 1,
-0.2906478, 0.7967939, 0.09805955, 1, 0, 0, 1, 1,
-0.2891485, -0.6020403, -1.427641, 1, 0, 0, 1, 1,
-0.2891089, 0.8821893, -1.358006, 1, 0, 0, 1, 1,
-0.289076, 0.5888181, -0.2369468, 1, 0, 0, 1, 1,
-0.2870697, 1.071118, 0.2114829, 1, 0, 0, 1, 1,
-0.2860082, -0.6390901, -2.289835, 0, 0, 0, 1, 1,
-0.2837972, 0.2896158, -0.5860177, 0, 0, 0, 1, 1,
-0.2830896, 0.4486183, 0.2390386, 0, 0, 0, 1, 1,
-0.2793247, 0.6672454, -2.729359, 0, 0, 0, 1, 1,
-0.2778451, -1.070737, -1.617669, 0, 0, 0, 1, 1,
-0.2774922, 0.6707247, -0.2962991, 0, 0, 0, 1, 1,
-0.272958, 0.7467042, 0.1899262, 0, 0, 0, 1, 1,
-0.2712508, 2.657353, -0.6990933, 1, 1, 1, 1, 1,
-0.2697312, 1.926096, -1.312418, 1, 1, 1, 1, 1,
-0.2690323, -0.3491172, -1.338369, 1, 1, 1, 1, 1,
-0.2685856, -1.056641, -3.80035, 1, 1, 1, 1, 1,
-0.2677124, 0.1927763, -2.175815, 1, 1, 1, 1, 1,
-0.2653643, -0.418539, -1.737757, 1, 1, 1, 1, 1,
-0.2636648, -1.088963, -3.42974, 1, 1, 1, 1, 1,
-0.2582948, 0.1157425, -1.601096, 1, 1, 1, 1, 1,
-0.2494221, 1.484426, -0.6165185, 1, 1, 1, 1, 1,
-0.2482157, -0.8190172, -4.202429, 1, 1, 1, 1, 1,
-0.2468276, 1.890498, -0.8127351, 1, 1, 1, 1, 1,
-0.2403135, 2.643171, -0.07714849, 1, 1, 1, 1, 1,
-0.2373168, -0.6603944, -4.068729, 1, 1, 1, 1, 1,
-0.2359297, 0.7801142, -1.45417, 1, 1, 1, 1, 1,
-0.2356505, 0.7412975, -0.4786749, 1, 1, 1, 1, 1,
-0.2340088, 0.1155046, -1.456017, 0, 0, 1, 1, 1,
-0.2318319, 0.9933009, -2.131611, 1, 0, 0, 1, 1,
-0.2227185, 0.3985621, 0.1972722, 1, 0, 0, 1, 1,
-0.2208599, -2.06584, -3.735583, 1, 0, 0, 1, 1,
-0.2203009, 1.559728, -0.8456789, 1, 0, 0, 1, 1,
-0.2192344, 0.1075381, -0.9000192, 1, 0, 0, 1, 1,
-0.2173433, -0.693211, -3.534405, 0, 0, 0, 1, 1,
-0.2162053, 0.7171902, -1.850586, 0, 0, 0, 1, 1,
-0.2139824, 0.6763146, -0.8393657, 0, 0, 0, 1, 1,
-0.2074695, 0.061083, -1.716544, 0, 0, 0, 1, 1,
-0.2050564, 1.479199, -0.6623546, 0, 0, 0, 1, 1,
-0.2028701, -0.4457375, -3.185931, 0, 0, 0, 1, 1,
-0.2028417, -0.2568936, -4.579465, 0, 0, 0, 1, 1,
-0.2015098, -0.8828927, -1.182077, 1, 1, 1, 1, 1,
-0.2014337, 1.346217, -1.265055, 1, 1, 1, 1, 1,
-0.2013635, 0.6630744, -1.364964, 1, 1, 1, 1, 1,
-0.1992552, -1.687324, -3.810673, 1, 1, 1, 1, 1,
-0.1988041, -0.6820434, -2.91466, 1, 1, 1, 1, 1,
-0.1976546, -1.65734, -4.06049, 1, 1, 1, 1, 1,
-0.194781, -1.309618, -2.613777, 1, 1, 1, 1, 1,
-0.194578, 0.7222523, 1.383233, 1, 1, 1, 1, 1,
-0.1942777, 0.03726736, -1.38064, 1, 1, 1, 1, 1,
-0.1925688, 0.1477122, -0.1763545, 1, 1, 1, 1, 1,
-0.1924646, -0.4508894, -3.049128, 1, 1, 1, 1, 1,
-0.1890235, -0.6850916, -3.889727, 1, 1, 1, 1, 1,
-0.1797099, -0.8735654, -3.461227, 1, 1, 1, 1, 1,
-0.1783457, 0.1241324, 2.706623, 1, 1, 1, 1, 1,
-0.1767253, 0.05348856, -2.315204, 1, 1, 1, 1, 1,
-0.170495, -0.3438476, -3.67906, 0, 0, 1, 1, 1,
-0.1689492, -0.07866421, -3.2184, 1, 0, 0, 1, 1,
-0.1640285, 0.5187213, -1.077534, 1, 0, 0, 1, 1,
-0.1621796, 0.08771397, -1.001346, 1, 0, 0, 1, 1,
-0.1596183, -0.5857083, -0.9944198, 1, 0, 0, 1, 1,
-0.1595916, 0.3001682, -0.9050249, 1, 0, 0, 1, 1,
-0.1595237, 0.3423979, -1.190592, 0, 0, 0, 1, 1,
-0.1506406, 0.3961902, -1.759216, 0, 0, 0, 1, 1,
-0.14914, -0.2939559, -2.919391, 0, 0, 0, 1, 1,
-0.1485548, -0.08335047, -2.56665, 0, 0, 0, 1, 1,
-0.1447609, 1.141653, -0.715266, 0, 0, 0, 1, 1,
-0.1427841, 1.140135, 1.929185, 0, 0, 0, 1, 1,
-0.1388018, -1.037734, -1.944951, 0, 0, 0, 1, 1,
-0.1323832, -0.1191262, -1.92398, 1, 1, 1, 1, 1,
-0.1313822, 0.1625, 0.01246237, 1, 1, 1, 1, 1,
-0.1299388, -1.130265, -4.235146, 1, 1, 1, 1, 1,
-0.1295146, 0.4582409, -1.07582, 1, 1, 1, 1, 1,
-0.1280376, 0.1362973, -1.092806, 1, 1, 1, 1, 1,
-0.1244433, -0.9937068, -4.165085, 1, 1, 1, 1, 1,
-0.1224969, 0.07349024, -1.883326, 1, 1, 1, 1, 1,
-0.1208271, 0.5760109, 0.2048732, 1, 1, 1, 1, 1,
-0.1145967, 0.5389626, 0.04598686, 1, 1, 1, 1, 1,
-0.1106285, 0.9218716, 1.569591, 1, 1, 1, 1, 1,
-0.1103872, -0.0600505, -0.8893132, 1, 1, 1, 1, 1,
-0.108442, 0.8333895, -1.2315, 1, 1, 1, 1, 1,
-0.1067241, 0.8564184, -1.358964, 1, 1, 1, 1, 1,
-0.1060365, -0.07666536, -2.434147, 1, 1, 1, 1, 1,
-0.1037298, 0.7367253, 0.5174084, 1, 1, 1, 1, 1,
-0.1037233, 0.9068117, -1.079771, 0, 0, 1, 1, 1,
-0.09623838, -1.916398, -3.39886, 1, 0, 0, 1, 1,
-0.09509493, 0.8431742, -0.247942, 1, 0, 0, 1, 1,
-0.08441284, 1.095637, 0.1056279, 1, 0, 0, 1, 1,
-0.08193418, 2.108435, -1.385875, 1, 0, 0, 1, 1,
-0.08100756, 1.035913, -1.903664, 1, 0, 0, 1, 1,
-0.08089434, -1.555497, -5.198252, 0, 0, 0, 1, 1,
-0.07873246, 1.349932, 0.2871425, 0, 0, 0, 1, 1,
-0.06989266, -1.674309, -2.496612, 0, 0, 0, 1, 1,
-0.06358017, 0.704996, -1.01792, 0, 0, 0, 1, 1,
-0.06173158, 0.307257, -0.1870171, 0, 0, 0, 1, 1,
-0.05902678, -1.479914, -1.703632, 0, 0, 0, 1, 1,
-0.05742727, -0.6190562, -3.769527, 0, 0, 0, 1, 1,
-0.05659796, 0.1289597, 1.490065, 1, 1, 1, 1, 1,
-0.05461753, -1.804223, -4.851886, 1, 1, 1, 1, 1,
-0.05256031, 1.520358, 0.8504676, 1, 1, 1, 1, 1,
-0.04871251, -0.3571081, -2.180389, 1, 1, 1, 1, 1,
-0.04856385, 0.7278703, -1.388101, 1, 1, 1, 1, 1,
-0.0375926, 0.8199913, 0.7209841, 1, 1, 1, 1, 1,
-0.032717, 0.3291776, -0.01421827, 1, 1, 1, 1, 1,
-0.03240905, -1.244476, -2.835559, 1, 1, 1, 1, 1,
-0.03214994, -0.503442, -2.620097, 1, 1, 1, 1, 1,
-0.03208065, 0.4302737, -1.031963, 1, 1, 1, 1, 1,
-0.03049256, -1.506207, -2.507404, 1, 1, 1, 1, 1,
-0.03047369, 0.3871509, -0.8322914, 1, 1, 1, 1, 1,
-0.02423464, 0.2688204, 1.051775, 1, 1, 1, 1, 1,
-0.02333396, -0.5440435, -3.795892, 1, 1, 1, 1, 1,
-0.02060655, -0.1746989, -3.127119, 1, 1, 1, 1, 1,
-0.01921305, 0.7164668, 0.2096666, 0, 0, 1, 1, 1,
-0.01812112, -1.071753, -1.028856, 1, 0, 0, 1, 1,
-0.01404541, -0.4831577, -2.435855, 1, 0, 0, 1, 1,
-0.01281891, -1.857659, -3.95745, 1, 0, 0, 1, 1,
-0.008621881, 1.218337, -0.1857639, 1, 0, 0, 1, 1,
-0.005755836, -1.472377, -2.064271, 1, 0, 0, 1, 1,
-0.004901247, -0.1370287, -2.349557, 0, 0, 0, 1, 1,
0.00216934, -0.7555398, 3.791801, 0, 0, 0, 1, 1,
0.004524034, 2.310276, -2.189707, 0, 0, 0, 1, 1,
0.01209481, -1.599665, 2.617019, 0, 0, 0, 1, 1,
0.01412927, -0.2133946, 2.91765, 0, 0, 0, 1, 1,
0.01424656, -1.44539, 3.621828, 0, 0, 0, 1, 1,
0.01506255, -0.319658, 1.438275, 0, 0, 0, 1, 1,
0.01508654, 0.9798853, 0.7637531, 1, 1, 1, 1, 1,
0.01581407, -1.40347, 3.181341, 1, 1, 1, 1, 1,
0.01630696, 2.561366, 0.9855468, 1, 1, 1, 1, 1,
0.02017391, 0.3720341, -1.031993, 1, 1, 1, 1, 1,
0.02506555, -1.838431, 3.602525, 1, 1, 1, 1, 1,
0.02737749, 1.138276, -0.7215526, 1, 1, 1, 1, 1,
0.03516116, 0.004324693, 1.469124, 1, 1, 1, 1, 1,
0.03719665, 0.2310268, 1.4779, 1, 1, 1, 1, 1,
0.03884156, 0.8838201, -0.6724504, 1, 1, 1, 1, 1,
0.04994754, 0.4822358, -1.197096, 1, 1, 1, 1, 1,
0.05293627, 0.06592526, 1.124011, 1, 1, 1, 1, 1,
0.05496845, -0.5344927, 1.6443, 1, 1, 1, 1, 1,
0.05530878, 0.7237401, 1.323301, 1, 1, 1, 1, 1,
0.06652104, 0.3216463, 2.99479, 1, 1, 1, 1, 1,
0.0674044, -0.4713665, 0.8274155, 1, 1, 1, 1, 1,
0.07718945, 1.12258, 1.792822, 0, 0, 1, 1, 1,
0.07984459, 0.8444301, -0.2411422, 1, 0, 0, 1, 1,
0.08135182, 0.2815391, 1.010158, 1, 0, 0, 1, 1,
0.08303454, 1.278453, 0.1360696, 1, 0, 0, 1, 1,
0.08345839, -0.3924777, 3.551375, 1, 0, 0, 1, 1,
0.08643385, 0.2563995, -0.8357449, 1, 0, 0, 1, 1,
0.09055369, 0.5669428, -0.4325571, 0, 0, 0, 1, 1,
0.0932603, 1.460411, -0.7377202, 0, 0, 0, 1, 1,
0.09747048, 0.345669, -0.1148678, 0, 0, 0, 1, 1,
0.1001661, -0.2195671, 5.230382, 0, 0, 0, 1, 1,
0.1016944, -0.07725421, 2.826023, 0, 0, 0, 1, 1,
0.1019154, 0.9669142, -0.4315516, 0, 0, 0, 1, 1,
0.1101326, 0.07847065, 2.177854, 0, 0, 0, 1, 1,
0.1112003, -0.654632, 3.598371, 1, 1, 1, 1, 1,
0.1113188, -0.2158104, 3.366229, 1, 1, 1, 1, 1,
0.1138687, -1.466608, 3.822279, 1, 1, 1, 1, 1,
0.1157542, -0.6143662, 3.814417, 1, 1, 1, 1, 1,
0.1159382, 1.973537, -2.462731, 1, 1, 1, 1, 1,
0.117755, 1.262843, 0.1791729, 1, 1, 1, 1, 1,
0.1186647, -1.23955, 2.85346, 1, 1, 1, 1, 1,
0.123332, -1.709218, 4.240695, 1, 1, 1, 1, 1,
0.1234156, 1.063239, 0.888344, 1, 1, 1, 1, 1,
0.1236313, -1.635403, 2.505291, 1, 1, 1, 1, 1,
0.1256411, 0.5874622, -1.193322, 1, 1, 1, 1, 1,
0.1259669, -0.0995357, 1.693576, 1, 1, 1, 1, 1,
0.1302599, -1.048784, 1.96388, 1, 1, 1, 1, 1,
0.136769, 0.5021017, -0.1506045, 1, 1, 1, 1, 1,
0.139476, -0.8585442, 3.632493, 1, 1, 1, 1, 1,
0.140871, -1.061903, 2.727042, 0, 0, 1, 1, 1,
0.1421596, -0.3225829, 1.112531, 1, 0, 0, 1, 1,
0.1440789, -0.8856976, 4.5918, 1, 0, 0, 1, 1,
0.1448917, 0.7471304, 1.737509, 1, 0, 0, 1, 1,
0.1456311, 0.5361654, 0.6546975, 1, 0, 0, 1, 1,
0.1491681, 1.350388, 2.181164, 1, 0, 0, 1, 1,
0.1491713, 0.2046626, 0.2250029, 0, 0, 0, 1, 1,
0.1494408, -0.5614269, 2.050451, 0, 0, 0, 1, 1,
0.1503004, 1.084147, -1.969309, 0, 0, 0, 1, 1,
0.1507357, 0.8020397, 1.532056, 0, 0, 0, 1, 1,
0.1551926, 2.101936, -0.07759632, 0, 0, 0, 1, 1,
0.1567078, 0.002433016, 0.9311734, 0, 0, 0, 1, 1,
0.1612531, 0.7258174, -0.7285146, 0, 0, 0, 1, 1,
0.1632845, 1.140109, 1.078098, 1, 1, 1, 1, 1,
0.1682706, -0.2030458, 2.780318, 1, 1, 1, 1, 1,
0.1703222, 1.186546, -0.09968986, 1, 1, 1, 1, 1,
0.1714058, -0.2476853, 0.6560088, 1, 1, 1, 1, 1,
0.1733005, 0.1489285, 0.7599199, 1, 1, 1, 1, 1,
0.1765305, -1.677389, 4.12485, 1, 1, 1, 1, 1,
0.1792439, 0.001914352, 2.450581, 1, 1, 1, 1, 1,
0.1820829, 1.130519, -0.9462629, 1, 1, 1, 1, 1,
0.1826989, 0.6608979, -0.1050948, 1, 1, 1, 1, 1,
0.1833142, 1.329991, -0.5001853, 1, 1, 1, 1, 1,
0.1835289, -0.06535679, 1.084505, 1, 1, 1, 1, 1,
0.1840396, -0.3014835, 1.644567, 1, 1, 1, 1, 1,
0.1843898, -1.313484, 2.782401, 1, 1, 1, 1, 1,
0.1858365, 1.355778, 0.6871976, 1, 1, 1, 1, 1,
0.1922865, 1.322132, -0.1849764, 1, 1, 1, 1, 1,
0.1934143, 0.7324743, 0.1368544, 0, 0, 1, 1, 1,
0.1936044, 0.1050616, 1.249665, 1, 0, 0, 1, 1,
0.1937026, 0.3927994, -0.1031336, 1, 0, 0, 1, 1,
0.1969728, -0.1346847, 2.769844, 1, 0, 0, 1, 1,
0.1988393, -0.03888492, 3.288793, 1, 0, 0, 1, 1,
0.1991889, -0.7286566, 3.695779, 1, 0, 0, 1, 1,
0.2001933, -0.08711874, 0.8475211, 0, 0, 0, 1, 1,
0.2019764, -1.58232, 4.112822, 0, 0, 0, 1, 1,
0.2105855, -0.5166332, 3.99139, 0, 0, 0, 1, 1,
0.2113086, -0.7265604, 4.311428, 0, 0, 0, 1, 1,
0.2145513, 1.495547, 0.3531063, 0, 0, 0, 1, 1,
0.2161508, -0.8352627, 2.167203, 0, 0, 0, 1, 1,
0.2166857, -0.3421064, 2.698625, 0, 0, 0, 1, 1,
0.2201988, -1.409528, 3.828414, 1, 1, 1, 1, 1,
0.2202568, 1.40206, 1.012633, 1, 1, 1, 1, 1,
0.2267782, 2.215092, 2.049442, 1, 1, 1, 1, 1,
0.2281546, 0.7832062, -1.093373, 1, 1, 1, 1, 1,
0.2282658, 0.1133382, 1.678274, 1, 1, 1, 1, 1,
0.2294826, 0.3908229, 1.591681, 1, 1, 1, 1, 1,
0.2329898, 0.6435843, -1.116838, 1, 1, 1, 1, 1,
0.2340388, 0.4563867, 0.4164798, 1, 1, 1, 1, 1,
0.2375683, 1.698493, 0.05265378, 1, 1, 1, 1, 1,
0.2395439, 2.724141, -1.160053, 1, 1, 1, 1, 1,
0.2405228, 1.677341, 2.872941, 1, 1, 1, 1, 1,
0.2427277, 0.7261527, 0.6622705, 1, 1, 1, 1, 1,
0.2431499, 0.3846992, 1.1158, 1, 1, 1, 1, 1,
0.2483651, -1.171569, 4.944948, 1, 1, 1, 1, 1,
0.250537, -1.13405, 1.731137, 1, 1, 1, 1, 1,
0.253217, -0.914036, 3.628572, 0, 0, 1, 1, 1,
0.2629789, -0.2433172, 3.607654, 1, 0, 0, 1, 1,
0.2689277, -0.4082409, -0.1570716, 1, 0, 0, 1, 1,
0.2770762, 0.3812707, -0.4545813, 1, 0, 0, 1, 1,
0.2790164, 1.438375, -0.0548837, 1, 0, 0, 1, 1,
0.2821021, -0.1278413, 0.7777726, 1, 0, 0, 1, 1,
0.28715, -1.104142, 2.965761, 0, 0, 0, 1, 1,
0.2886092, -1.114093, 3.411231, 0, 0, 0, 1, 1,
0.288748, -2.931083, 2.702796, 0, 0, 0, 1, 1,
0.289288, -0.7790037, 4.404827, 0, 0, 0, 1, 1,
0.291284, 1.313886, -0.6842638, 0, 0, 0, 1, 1,
0.2923793, -0.4608871, 2.279954, 0, 0, 0, 1, 1,
0.2936733, -1.681462, 3.823152, 0, 0, 0, 1, 1,
0.294714, -0.7283179, 3.37287, 1, 1, 1, 1, 1,
0.2956778, 0.05868509, 2.693653, 1, 1, 1, 1, 1,
0.2987072, -1.207541, 3.955702, 1, 1, 1, 1, 1,
0.3049134, 1.025191, 1.435456, 1, 1, 1, 1, 1,
0.3065161, 0.2831864, -0.1807746, 1, 1, 1, 1, 1,
0.3067895, -0.2006308, 2.674841, 1, 1, 1, 1, 1,
0.3086783, 0.4266839, 1.35919, 1, 1, 1, 1, 1,
0.3113944, -0.1250753, 0.3919795, 1, 1, 1, 1, 1,
0.3137361, 0.1667543, 1.256111, 1, 1, 1, 1, 1,
0.3141425, 0.6740729, -0.103268, 1, 1, 1, 1, 1,
0.3159937, -0.3324496, 2.74341, 1, 1, 1, 1, 1,
0.3194751, 1.291697, -2.255437, 1, 1, 1, 1, 1,
0.3237032, -0.4696621, 2.110999, 1, 1, 1, 1, 1,
0.3242089, -1.413189, 3.515464, 1, 1, 1, 1, 1,
0.3249395, -0.3318608, 1.686008, 1, 1, 1, 1, 1,
0.3309053, -2.216326, 2.269883, 0, 0, 1, 1, 1,
0.3322218, 1.564505, -1.171348, 1, 0, 0, 1, 1,
0.3375589, -0.3237412, 4.611706, 1, 0, 0, 1, 1,
0.3419332, -1.450511, 3.936068, 1, 0, 0, 1, 1,
0.3420997, -1.204101, 1.402036, 1, 0, 0, 1, 1,
0.3451644, -1.917391, 3.294588, 1, 0, 0, 1, 1,
0.3453571, -0.6563215, 3.702852, 0, 0, 0, 1, 1,
0.3480688, 0.9477403, 1.319516, 0, 0, 0, 1, 1,
0.3481694, -0.2216754, 0.6880576, 0, 0, 0, 1, 1,
0.3483607, 0.06873713, 2.692356, 0, 0, 0, 1, 1,
0.3570026, 0.9585313, 0.2286459, 0, 0, 0, 1, 1,
0.3576132, -0.2371617, 2.030828, 0, 0, 0, 1, 1,
0.3578305, 0.5018323, 1.33023, 0, 0, 0, 1, 1,
0.3579614, -1.421976, 4.012614, 1, 1, 1, 1, 1,
0.3601636, -1.53245, 3.831676, 1, 1, 1, 1, 1,
0.3614279, 0.8630158, 1.426357, 1, 1, 1, 1, 1,
0.3633124, 0.8791943, 0.7516226, 1, 1, 1, 1, 1,
0.3648045, 0.9867234, -0.9821931, 1, 1, 1, 1, 1,
0.368769, 0.7331056, 1.85107, 1, 1, 1, 1, 1,
0.3696176, 0.6259842, 1.144772, 1, 1, 1, 1, 1,
0.3756805, 0.2379992, 1.935515, 1, 1, 1, 1, 1,
0.3811261, -0.4419847, 1.482797, 1, 1, 1, 1, 1,
0.3825448, -0.594355, 4.152994, 1, 1, 1, 1, 1,
0.3851047, -1.452041, 3.81147, 1, 1, 1, 1, 1,
0.3860282, -0.04485202, 2.540804, 1, 1, 1, 1, 1,
0.3911788, 1.253606, -0.2669439, 1, 1, 1, 1, 1,
0.3990359, 0.131145, 1.01256, 1, 1, 1, 1, 1,
0.4012341, 0.4132232, 0.1316343, 1, 1, 1, 1, 1,
0.409276, -0.2159469, 2.909112, 0, 0, 1, 1, 1,
0.4128033, 0.4863036, 0.7107303, 1, 0, 0, 1, 1,
0.4151621, 0.8085567, -0.9664102, 1, 0, 0, 1, 1,
0.4176826, -1.084599, 1.653745, 1, 0, 0, 1, 1,
0.4180947, 0.1766566, 1.147664, 1, 0, 0, 1, 1,
0.4193378, -0.3730699, 2.824975, 1, 0, 0, 1, 1,
0.4198285, -0.4735063, 2.006702, 0, 0, 0, 1, 1,
0.4211391, 0.31015, 0.955146, 0, 0, 0, 1, 1,
0.4224719, 3.23935, 0.5524917, 0, 0, 0, 1, 1,
0.4297664, 2.254806, -0.6025081, 0, 0, 0, 1, 1,
0.4311162, 0.6082651, 0.9297059, 0, 0, 0, 1, 1,
0.4328483, 0.965659, 1.155771, 0, 0, 0, 1, 1,
0.4359391, -0.7554463, 0.6166292, 0, 0, 0, 1, 1,
0.441421, -0.5708324, 3.892511, 1, 1, 1, 1, 1,
0.4449129, 0.3344008, 1.174906, 1, 1, 1, 1, 1,
0.4465915, -0.4155564, 1.799179, 1, 1, 1, 1, 1,
0.447113, 0.2406121, 1.729403, 1, 1, 1, 1, 1,
0.4477161, 1.899112, 2.113223, 1, 1, 1, 1, 1,
0.44927, -0.5690699, 1.274532, 1, 1, 1, 1, 1,
0.4498309, -0.8962492, 3.622121, 1, 1, 1, 1, 1,
0.4532929, -1.10546, 3.855148, 1, 1, 1, 1, 1,
0.4610519, -0.4672451, 3.720418, 1, 1, 1, 1, 1,
0.4624422, -1.748373, 2.198331, 1, 1, 1, 1, 1,
0.4624688, 0.3661508, 0.9119824, 1, 1, 1, 1, 1,
0.4631554, -0.1989649, 2.71623, 1, 1, 1, 1, 1,
0.4705802, -0.5971956, 4.55319, 1, 1, 1, 1, 1,
0.4734966, -0.9200466, 2.327632, 1, 1, 1, 1, 1,
0.4750122, 0.2053756, 2.217056, 1, 1, 1, 1, 1,
0.4784004, -0.2389813, 2.353417, 0, 0, 1, 1, 1,
0.4964326, 0.8691296, 0.9733616, 1, 0, 0, 1, 1,
0.4975958, -0.2419812, 0.8882491, 1, 0, 0, 1, 1,
0.4978026, 0.5544776, -0.3263084, 1, 0, 0, 1, 1,
0.4991622, -0.3354486, 1.438509, 1, 0, 0, 1, 1,
0.5026813, -0.406593, 1.721924, 1, 0, 0, 1, 1,
0.5055171, 1.957826, 0.4613156, 0, 0, 0, 1, 1,
0.506546, 0.1373255, 1.452402, 0, 0, 0, 1, 1,
0.5078746, -0.7313222, 2.956003, 0, 0, 0, 1, 1,
0.509708, -1.426026, 2.902101, 0, 0, 0, 1, 1,
0.5123858, -0.4027263, 2.660592, 0, 0, 0, 1, 1,
0.5147027, 1.287422, 0.02410709, 0, 0, 0, 1, 1,
0.5151845, 0.4374, 2.344763, 0, 0, 0, 1, 1,
0.5155652, 0.439365, 1.901323, 1, 1, 1, 1, 1,
0.5190698, -0.1055373, 1.320105, 1, 1, 1, 1, 1,
0.521781, -0.2407898, 1.370735, 1, 1, 1, 1, 1,
0.5223971, 0.423552, 1.021223, 1, 1, 1, 1, 1,
0.5257336, -0.3723686, 2.484938, 1, 1, 1, 1, 1,
0.5313605, 0.8758892, -0.3633116, 1, 1, 1, 1, 1,
0.53158, 0.0436182, 2.881855, 1, 1, 1, 1, 1,
0.5324012, -0.3698081, 0.7910405, 1, 1, 1, 1, 1,
0.533564, 0.5711708, 0.3182563, 1, 1, 1, 1, 1,
0.5366128, 1.48863, -0.2293294, 1, 1, 1, 1, 1,
0.5412254, 0.492481, 0.9649825, 1, 1, 1, 1, 1,
0.5443673, 0.09902953, 0.4815789, 1, 1, 1, 1, 1,
0.5487964, 0.1242526, 2.291032, 1, 1, 1, 1, 1,
0.5529546, 0.6587273, 1.134915, 1, 1, 1, 1, 1,
0.5537713, 1.19925, 0.09539902, 1, 1, 1, 1, 1,
0.5541198, -0.8235889, 1.442037, 0, 0, 1, 1, 1,
0.5560527, -0.4080713, 1.484069, 1, 0, 0, 1, 1,
0.5647561, -0.2609239, 3.605537, 1, 0, 0, 1, 1,
0.5653976, 0.2912957, 1.804013, 1, 0, 0, 1, 1,
0.5674981, -0.2183586, 0.244869, 1, 0, 0, 1, 1,
0.5691109, -0.4661941, 1.67578, 1, 0, 0, 1, 1,
0.5712839, 0.8963917, -0.05868134, 0, 0, 0, 1, 1,
0.5729297, 0.8020883, 1.014347, 0, 0, 0, 1, 1,
0.5746306, -1.205224, 2.627056, 0, 0, 0, 1, 1,
0.5747775, 0.02911491, 0.9959235, 0, 0, 0, 1, 1,
0.5796955, 0.7524363, 0.480125, 0, 0, 0, 1, 1,
0.5820229, -1.317986, 2.887127, 0, 0, 0, 1, 1,
0.5833215, -1.134099, 5.156686, 0, 0, 0, 1, 1,
0.5834386, 0.2785828, 2.570997, 1, 1, 1, 1, 1,
0.5871717, 1.656151, 0.9048709, 1, 1, 1, 1, 1,
0.5894581, 0.04775129, -0.693626, 1, 1, 1, 1, 1,
0.5942397, -0.2211998, 0.9116982, 1, 1, 1, 1, 1,
0.5975745, -1.627821, 3.042517, 1, 1, 1, 1, 1,
0.5986643, 1.070454, 1.527647, 1, 1, 1, 1, 1,
0.5989294, -1.399015, 1.287879, 1, 1, 1, 1, 1,
0.5990176, -0.07069324, 0.9091106, 1, 1, 1, 1, 1,
0.6014134, -0.05593471, 1.674576, 1, 1, 1, 1, 1,
0.6029834, -0.1448897, 0.1923549, 1, 1, 1, 1, 1,
0.6169093, -0.4245411, 0.7518165, 1, 1, 1, 1, 1,
0.6192355, -1.78296, 3.170944, 1, 1, 1, 1, 1,
0.622038, -0.632421, 1.717724, 1, 1, 1, 1, 1,
0.6223135, -0.4587559, 3.114304, 1, 1, 1, 1, 1,
0.6229838, 1.452954, 0.2782134, 1, 1, 1, 1, 1,
0.6242438, -0.4442857, 3.732482, 0, 0, 1, 1, 1,
0.6396101, 0.09218931, 1.507175, 1, 0, 0, 1, 1,
0.6501305, 0.03252924, 1.571576, 1, 0, 0, 1, 1,
0.6517823, -0.662864, 3.444084, 1, 0, 0, 1, 1,
0.661377, -0.8316108, 3.112753, 1, 0, 0, 1, 1,
0.6684592, -0.1062166, 0.9401115, 1, 0, 0, 1, 1,
0.6704234, 1.117277, -0.1291849, 0, 0, 0, 1, 1,
0.6709526, -1.329936, 3.861835, 0, 0, 0, 1, 1,
0.6743467, -1.935127, 1.836527, 0, 0, 0, 1, 1,
0.6761299, -0.3880534, 2.950168, 0, 0, 0, 1, 1,
0.6790425, 0.3112092, -0.405009, 0, 0, 0, 1, 1,
0.6792955, -0.1672098, 1.352817, 0, 0, 0, 1, 1,
0.6807035, -1.714859, 2.490811, 0, 0, 0, 1, 1,
0.6849089, -0.4384353, 2.009103, 1, 1, 1, 1, 1,
0.687614, 1.794031, 0.04503557, 1, 1, 1, 1, 1,
0.6894268, 1.374987, -0.7316873, 1, 1, 1, 1, 1,
0.7026086, -0.2723055, 2.760827, 1, 1, 1, 1, 1,
0.7073489, 0.141963, 0.9164701, 1, 1, 1, 1, 1,
0.7120088, -0.6185081, 2.043909, 1, 1, 1, 1, 1,
0.712774, 0.05460768, 1.946931, 1, 1, 1, 1, 1,
0.7132021, 0.3821646, 2.282937, 1, 1, 1, 1, 1,
0.7139059, -0.07232915, 1.976485, 1, 1, 1, 1, 1,
0.7308578, -0.7741676, 2.215775, 1, 1, 1, 1, 1,
0.7349855, -0.3217105, 2.726274, 1, 1, 1, 1, 1,
0.7352247, 1.309581, -0.1202906, 1, 1, 1, 1, 1,
0.7461377, 0.7589607, -0.2125275, 1, 1, 1, 1, 1,
0.7474328, -1.531119, 2.355943, 1, 1, 1, 1, 1,
0.7495379, 1.711951, 0.9828378, 1, 1, 1, 1, 1,
0.7498941, -1.704691, 1.326973, 0, 0, 1, 1, 1,
0.7512804, -0.5545073, 2.910402, 1, 0, 0, 1, 1,
0.7523996, -1.44616, 2.645213, 1, 0, 0, 1, 1,
0.7528912, 0.7363654, -0.2205342, 1, 0, 0, 1, 1,
0.7570673, 0.8862374, -1.73047, 1, 0, 0, 1, 1,
0.7595446, 0.05787181, -0.0910847, 1, 0, 0, 1, 1,
0.7619267, -1.826562, 3.576529, 0, 0, 0, 1, 1,
0.7622958, -0.5559847, 1.24811, 0, 0, 0, 1, 1,
0.7658486, -0.1553112, 1.922612, 0, 0, 0, 1, 1,
0.7709244, 1.366865, 1.177287, 0, 0, 0, 1, 1,
0.7775669, 1.551396, -0.02609086, 0, 0, 0, 1, 1,
0.7791226, -1.078374, 4.076443, 0, 0, 0, 1, 1,
0.7793394, 0.5818456, 0.3448079, 0, 0, 0, 1, 1,
0.7793412, -1.693691, 2.248855, 1, 1, 1, 1, 1,
0.7897741, 1.090143, 2.308495, 1, 1, 1, 1, 1,
0.7915405, 1.167716, 2.035434, 1, 1, 1, 1, 1,
0.7924972, 0.3159384, 0.6565869, 1, 1, 1, 1, 1,
0.7968758, -0.3039252, 3.137153, 1, 1, 1, 1, 1,
0.8039089, 1.102331, 1.477736, 1, 1, 1, 1, 1,
0.8079012, -0.7074652, 3.25079, 1, 1, 1, 1, 1,
0.8085795, 0.4799933, 0.8212981, 1, 1, 1, 1, 1,
0.8130657, 1.787714, -0.06250255, 1, 1, 1, 1, 1,
0.8142072, -0.1685373, 1.303112, 1, 1, 1, 1, 1,
0.8146099, 0.966915, 1.895979, 1, 1, 1, 1, 1,
0.817851, 0.1923202, 0.7473842, 1, 1, 1, 1, 1,
0.8198615, -1.183764, 1.233847, 1, 1, 1, 1, 1,
0.8261498, -0.4185136, 4.578629, 1, 1, 1, 1, 1,
0.8284155, -1.335741, 2.436731, 1, 1, 1, 1, 1,
0.8357693, -0.8622994, 1.556334, 0, 0, 1, 1, 1,
0.8360208, 0.4492988, 1.605338, 1, 0, 0, 1, 1,
0.8371992, -0.2932123, 1.482751, 1, 0, 0, 1, 1,
0.8404656, -0.2525876, 0.5610862, 1, 0, 0, 1, 1,
0.8421232, 1.113142, 0.4513239, 1, 0, 0, 1, 1,
0.8449871, 0.519883, 0.3372759, 1, 0, 0, 1, 1,
0.8454616, -0.5205774, 2.118834, 0, 0, 0, 1, 1,
0.848035, 0.3041016, 2.730025, 0, 0, 0, 1, 1,
0.8504141, 0.9601225, 1.54021, 0, 0, 0, 1, 1,
0.8524595, 0.5624363, 1.434544, 0, 0, 0, 1, 1,
0.8601226, -0.2820536, 1.725995, 0, 0, 0, 1, 1,
0.8612863, -1.055016, 2.305817, 0, 0, 0, 1, 1,
0.8626029, -0.2189495, 0.1688565, 0, 0, 0, 1, 1,
0.8639946, -1.487778, 2.253025, 1, 1, 1, 1, 1,
0.8697288, 0.8016245, 1.823696, 1, 1, 1, 1, 1,
0.8708904, -0.5402745, -0.8568099, 1, 1, 1, 1, 1,
0.8784376, -0.2325341, 0.4192224, 1, 1, 1, 1, 1,
0.8859508, 1.383075, 0.6383704, 1, 1, 1, 1, 1,
0.8910336, -1.025643, 1.595821, 1, 1, 1, 1, 1,
0.8920764, 0.3931409, 1.241354, 1, 1, 1, 1, 1,
0.8979352, -0.857851, 3.472599, 1, 1, 1, 1, 1,
0.904392, 0.836261, 1.09212, 1, 1, 1, 1, 1,
0.9079537, -0.5906096, 1.761417, 1, 1, 1, 1, 1,
0.912613, 1.414903, 0.6832605, 1, 1, 1, 1, 1,
0.9206977, -0.2762281, 2.330513, 1, 1, 1, 1, 1,
0.9281585, -0.08929966, 1.584355, 1, 1, 1, 1, 1,
0.9297126, 0.2520117, 1.180362, 1, 1, 1, 1, 1,
0.9350894, -0.4489223, 2.47352, 1, 1, 1, 1, 1,
0.9450095, 0.8124562, 1.265579, 0, 0, 1, 1, 1,
0.9465637, -0.3195038, 1.730414, 1, 0, 0, 1, 1,
0.9486299, 0.6042239, -0.3808565, 1, 0, 0, 1, 1,
0.9745166, 0.7904574, 0.3523951, 1, 0, 0, 1, 1,
0.9766489, -1.215768, 0.9545004, 1, 0, 0, 1, 1,
0.9815168, 0.3402385, -0.5460858, 1, 0, 0, 1, 1,
0.9824278, -2.304878, 2.909627, 0, 0, 0, 1, 1,
0.9840215, 0.821871, 2.322345, 0, 0, 0, 1, 1,
0.994448, 1.0114, 3.171002, 0, 0, 0, 1, 1,
1.014451, 1.362241, 0.4173699, 0, 0, 0, 1, 1,
1.015644, -1.868832, 3.164348, 0, 0, 0, 1, 1,
1.015969, -0.6365815, 1.931281, 0, 0, 0, 1, 1,
1.017565, 1.380224, -0.8208382, 0, 0, 0, 1, 1,
1.017855, -0.8163137, 1.248659, 1, 1, 1, 1, 1,
1.021662, 0.9513785, 2.145381, 1, 1, 1, 1, 1,
1.024836, 0.658364, 2.350646, 1, 1, 1, 1, 1,
1.027462, 0.3132168, 1.049059, 1, 1, 1, 1, 1,
1.032043, -0.8380577, 2.63909, 1, 1, 1, 1, 1,
1.033154, 0.2841125, 1.148968, 1, 1, 1, 1, 1,
1.034711, 0.0004891292, 1.277157, 1, 1, 1, 1, 1,
1.041968, 0.637377, -0.6843715, 1, 1, 1, 1, 1,
1.047835, 0.4328639, 1.300652, 1, 1, 1, 1, 1,
1.049888, -0.4208972, 2.806839, 1, 1, 1, 1, 1,
1.053744, -0.804028, 2.921599, 1, 1, 1, 1, 1,
1.05869, -0.7915288, 3.003207, 1, 1, 1, 1, 1,
1.059275, 0.8263946, 2.151917, 1, 1, 1, 1, 1,
1.060707, 0.05304082, 0.8063122, 1, 1, 1, 1, 1,
1.067095, 0.6396138, 0.9087261, 1, 1, 1, 1, 1,
1.070127, 0.1153604, 2.078615, 0, 0, 1, 1, 1,
1.073489, 0.4965319, 1.670771, 1, 0, 0, 1, 1,
1.073671, 1.165806, -0.1401843, 1, 0, 0, 1, 1,
1.075858, -0.9409157, 3.737837, 1, 0, 0, 1, 1,
1.08256, -0.002046255, 1.215258, 1, 0, 0, 1, 1,
1.087812, -0.8156891, 1.128049, 1, 0, 0, 1, 1,
1.099149, 2.222759, 2.167683, 0, 0, 0, 1, 1,
1.100354, -0.06156278, 1.149437, 0, 0, 0, 1, 1,
1.101143, 1.104624, 1.086212, 0, 0, 0, 1, 1,
1.102839, -0.4319489, 0.9478672, 0, 0, 0, 1, 1,
1.105183, -1.061615, 0.9359182, 0, 0, 0, 1, 1,
1.10803, -0.6596214, 1.183909, 0, 0, 0, 1, 1,
1.10953, 0.1662624, 0.2333804, 0, 0, 0, 1, 1,
1.111153, 0.7321962, 0.4223405, 1, 1, 1, 1, 1,
1.115178, -3.344083, 3.093244, 1, 1, 1, 1, 1,
1.117591, 0.6551248, 2.684192, 1, 1, 1, 1, 1,
1.117902, 0.4575617, -0.03081137, 1, 1, 1, 1, 1,
1.119234, 1.224692, 0.7321628, 1, 1, 1, 1, 1,
1.120627, 1.101132, 1.459803, 1, 1, 1, 1, 1,
1.127545, 0.5997143, 1.866692, 1, 1, 1, 1, 1,
1.146644, 1.605302, 0.4439366, 1, 1, 1, 1, 1,
1.150948, -0.2503285, 0.6377292, 1, 1, 1, 1, 1,
1.152497, -0.9938001, 1.792686, 1, 1, 1, 1, 1,
1.15392, -0.6057138, 0.315712, 1, 1, 1, 1, 1,
1.154423, -1.112393, 2.811876, 1, 1, 1, 1, 1,
1.160775, 0.8575426, 0.002015674, 1, 1, 1, 1, 1,
1.169496, -0.1072329, 1.658426, 1, 1, 1, 1, 1,
1.175604, -2.722184, 3.545475, 1, 1, 1, 1, 1,
1.190497, -1.639375, 2.245547, 0, 0, 1, 1, 1,
1.196107, -0.6704475, -1.065833, 1, 0, 0, 1, 1,
1.20202, -0.991343, 1.594031, 1, 0, 0, 1, 1,
1.204264, 1.469859, 1.389579, 1, 0, 0, 1, 1,
1.216684, 1.352198, 1.445038, 1, 0, 0, 1, 1,
1.217227, 0.1938217, 0.5867993, 1, 0, 0, 1, 1,
1.218059, 2.502899, 0.0402343, 0, 0, 0, 1, 1,
1.220902, -0.1736941, 2.585759, 0, 0, 0, 1, 1,
1.227817, 1.103674, 0.3360807, 0, 0, 0, 1, 1,
1.22956, -0.124669, 2.081288, 0, 0, 0, 1, 1,
1.235408, 1.309334, 0.4876999, 0, 0, 0, 1, 1,
1.239654, -0.8097769, 2.797208, 0, 0, 0, 1, 1,
1.244025, -1.116444, 3.472218, 0, 0, 0, 1, 1,
1.248952, 0.5064455, 0.05288314, 1, 1, 1, 1, 1,
1.256004, 2.164721, 0.2591341, 1, 1, 1, 1, 1,
1.258852, 0.5185636, 3.264194, 1, 1, 1, 1, 1,
1.259222, -0.3232026, 0.4987416, 1, 1, 1, 1, 1,
1.268194, 0.4759442, 2.895445, 1, 1, 1, 1, 1,
1.278957, 1.230296, 2.440317, 1, 1, 1, 1, 1,
1.284261, -0.8055168, 1.22097, 1, 1, 1, 1, 1,
1.295967, 0.6278495, 0.1318496, 1, 1, 1, 1, 1,
1.304755, -1.286659, 2.360651, 1, 1, 1, 1, 1,
1.306272, 0.8986489, 0.5265917, 1, 1, 1, 1, 1,
1.315768, 1.017424, 0.03350475, 1, 1, 1, 1, 1,
1.321846, 0.3944016, 1.189803, 1, 1, 1, 1, 1,
1.330982, 1.700623, 0.1315166, 1, 1, 1, 1, 1,
1.331486, 0.8355944, 1.043321, 1, 1, 1, 1, 1,
1.333324, 1.040561, -1.868527, 1, 1, 1, 1, 1,
1.336575, 1.652244, 0.2309343, 0, 0, 1, 1, 1,
1.336805, -1.288296, 3.01752, 1, 0, 0, 1, 1,
1.344467, -1.234083, 1.855188, 1, 0, 0, 1, 1,
1.345664, -0.9217217, 2.84528, 1, 0, 0, 1, 1,
1.346361, -0.1593072, 0.3497501, 1, 0, 0, 1, 1,
1.347674, -0.2468915, 2.087179, 1, 0, 0, 1, 1,
1.350175, -0.7435403, -0.01748652, 0, 0, 0, 1, 1,
1.35086, 0.5907125, 2.422243, 0, 0, 0, 1, 1,
1.366581, -0.7659337, 1.800506, 0, 0, 0, 1, 1,
1.367139, -1.553464, 1.534143, 0, 0, 0, 1, 1,
1.380435, 1.262345, -0.4540817, 0, 0, 0, 1, 1,
1.381437, 0.8640886, 0.6348531, 0, 0, 0, 1, 1,
1.383201, -1.138021, 1.495737, 0, 0, 0, 1, 1,
1.383975, -0.4456551, 3.484623, 1, 1, 1, 1, 1,
1.391492, 0.8469131, 0.4686022, 1, 1, 1, 1, 1,
1.399855, -1.319839, 2.770377, 1, 1, 1, 1, 1,
1.405413, 0.542536, 1.178856, 1, 1, 1, 1, 1,
1.415472, 0.1735141, 1.403072, 1, 1, 1, 1, 1,
1.421674, -0.4194317, 1.005792, 1, 1, 1, 1, 1,
1.426982, 1.329668, -0.8972869, 1, 1, 1, 1, 1,
1.427468, -1.036189, 2.062073, 1, 1, 1, 1, 1,
1.453173, -1.019124, 2.455715, 1, 1, 1, 1, 1,
1.459414, 2.212852, 0.7052648, 1, 1, 1, 1, 1,
1.46631, 1.014953, 1.661498, 1, 1, 1, 1, 1,
1.477064, 0.06060407, 1.901965, 1, 1, 1, 1, 1,
1.477398, -0.06018804, 2.971025, 1, 1, 1, 1, 1,
1.49959, -0.7100382, 2.241902, 1, 1, 1, 1, 1,
1.509956, 1.436051, 0.1337168, 1, 1, 1, 1, 1,
1.515001, 1.22381, 0.108523, 0, 0, 1, 1, 1,
1.518828, 0.3632941, 1.082189, 1, 0, 0, 1, 1,
1.527485, -0.7032233, 1.266375, 1, 0, 0, 1, 1,
1.527787, 0.9130831, 0.3455223, 1, 0, 0, 1, 1,
1.533989, 0.04474138, 2.32207, 1, 0, 0, 1, 1,
1.535425, 3.409811, 0.1191884, 1, 0, 0, 1, 1,
1.545361, 0.5559046, 1.415354, 0, 0, 0, 1, 1,
1.545505, -0.9728441, 1.775526, 0, 0, 0, 1, 1,
1.554297, -1.064023, 3.11364, 0, 0, 0, 1, 1,
1.563545, -0.4109439, 1.109307, 0, 0, 0, 1, 1,
1.575021, 0.6594626, 2.197745, 0, 0, 0, 1, 1,
1.57613, 0.9192874, 0.5534693, 0, 0, 0, 1, 1,
1.584342, -0.7511195, 2.1879, 0, 0, 0, 1, 1,
1.588035, -1.14482, 1.511492, 1, 1, 1, 1, 1,
1.591488, -1.339645, 2.005286, 1, 1, 1, 1, 1,
1.59724, 1.385699, -0.1518219, 1, 1, 1, 1, 1,
1.610901, -0.9883592, 2.945144, 1, 1, 1, 1, 1,
1.612881, 0.3196406, 0.1435264, 1, 1, 1, 1, 1,
1.62546, -2.207413, 1.681788, 1, 1, 1, 1, 1,
1.645703, 0.4439325, 0.486809, 1, 1, 1, 1, 1,
1.648705, -0.2072898, 1.560434, 1, 1, 1, 1, 1,
1.648886, -0.8669428, 2.564344, 1, 1, 1, 1, 1,
1.648978, 1.867968, 0.9171928, 1, 1, 1, 1, 1,
1.654762, 0.2901373, 0.4346271, 1, 1, 1, 1, 1,
1.655534, -1.349035, 0.6140645, 1, 1, 1, 1, 1,
1.658194, -0.5463344, 3.674742, 1, 1, 1, 1, 1,
1.704414, -0.1429207, 2.082304, 1, 1, 1, 1, 1,
1.707021, 0.8729621, 0.8841515, 1, 1, 1, 1, 1,
1.723889, -0.4881279, 1.992425, 0, 0, 1, 1, 1,
1.741746, 0.4440408, 1.773221, 1, 0, 0, 1, 1,
1.743204, 0.7291125, 0.1253618, 1, 0, 0, 1, 1,
1.754804, -0.6051289, 1.048189, 1, 0, 0, 1, 1,
1.754839, -0.6997018, 3.051598, 1, 0, 0, 1, 1,
1.757517, 0.1687884, 0.4296075, 1, 0, 0, 1, 1,
1.762311, -0.3752386, 0.5893068, 0, 0, 0, 1, 1,
1.769239, 0.2362781, 2.076815, 0, 0, 0, 1, 1,
1.775102, -1.487294, 2.275901, 0, 0, 0, 1, 1,
1.779616, 0.4959523, 0.09546617, 0, 0, 0, 1, 1,
1.788926, -0.03686059, 1.195517, 0, 0, 0, 1, 1,
1.79097, 0.5219293, 0.8696691, 0, 0, 0, 1, 1,
1.797375, -1.635249, 0.8738977, 0, 0, 0, 1, 1,
1.799701, -0.5803618, 2.834097, 1, 1, 1, 1, 1,
1.816691, 0.189965, 1.389396, 1, 1, 1, 1, 1,
1.818383, -0.8623635, 4.05843, 1, 1, 1, 1, 1,
1.848137, 0.2318414, 2.048866, 1, 1, 1, 1, 1,
1.852444, -1.67585, -0.1497085, 1, 1, 1, 1, 1,
1.853376, -1.510629, 3.766738, 1, 1, 1, 1, 1,
1.854619, -0.381583, 1.319791, 1, 1, 1, 1, 1,
1.859656, -0.6344117, 3.003645, 1, 1, 1, 1, 1,
1.869525, 0.5142299, -0.0009583813, 1, 1, 1, 1, 1,
1.893044, -0.1660204, 2.5871, 1, 1, 1, 1, 1,
1.89645, -0.169565, 2.101326, 1, 1, 1, 1, 1,
1.902896, -0.2252253, 1.809459, 1, 1, 1, 1, 1,
1.92387, 0.7340648, 0.879659, 1, 1, 1, 1, 1,
1.962819, -0.01264861, 1.921551, 1, 1, 1, 1, 1,
1.965437, -1.868738, 3.24179, 1, 1, 1, 1, 1,
1.973077, -0.4955943, 3.190593, 0, 0, 1, 1, 1,
2.035762, 1.254725, -1.130569, 1, 0, 0, 1, 1,
2.044343, -1.885175, 3.565181, 1, 0, 0, 1, 1,
2.050447, 0.297746, 1.095536, 1, 0, 0, 1, 1,
2.061458, 0.7924192, 0.8350447, 1, 0, 0, 1, 1,
2.121812, 0.2516524, 0.7396935, 1, 0, 0, 1, 1,
2.13659, -2.23267, -0.3298459, 0, 0, 0, 1, 1,
2.273268, 1.186785, 1.413111, 0, 0, 0, 1, 1,
2.289737, 0.8348539, 1.93323, 0, 0, 0, 1, 1,
2.384408, -0.7049249, 1.1925, 0, 0, 0, 1, 1,
2.389008, 2.627968, 1.184856, 0, 0, 0, 1, 1,
2.395213, -1.577078, 2.427187, 0, 0, 0, 1, 1,
2.481608, -0.6685517, 2.885957, 0, 0, 0, 1, 1,
2.510493, -0.9092904, 3.336943, 1, 1, 1, 1, 1,
2.590229, 0.1121235, 1.913898, 1, 1, 1, 1, 1,
2.606338, -0.1030592, 1.27226, 1, 1, 1, 1, 1,
2.661926, -0.424338, 1.556938, 1, 1, 1, 1, 1,
2.736155, 1.133943, 1.511598, 1, 1, 1, 1, 1,
2.836347, 0.07783383, 0.8776, 1, 1, 1, 1, 1,
2.872481, 0.03439026, 1.045428, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.443768;
var distance = 33.17084;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.118885, -0.03286386, -0.01606512 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17084);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
